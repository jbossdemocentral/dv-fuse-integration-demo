#/bin/sh
#
# Start a JBoss Data Virtualization & JBoss Fuse environment.
#
# This script expects JBoss Fuse to be running in order to start the c1 container
#
# author: cojan.van.ballegooijen@redhat.com
#
KARAF_LOG=./target/fuse/jboss-fuse-6.1.0.redhat-379/data/log/karaf.log
rm $KARAF_LOG </dev/null
touch $KARAF_LOG
echo 
echo "Starting JBoss Fuse"
echo
./target/fuse/jboss-fuse-6.1.0.redhat-379/bin/start  
echo 
echo "Starting JBoss Data Virtualization"
echo
nohup ./target/dv/jboss-eap-6.1/bin/standalone.sh > dv.log 2>&1 </dev/null & 
if [ ! -d ./target/fuse/jboss-fuse-6.1.0.redhat-379/instances/c1 ]
then
	./target/fuse/jboss-fuse-6.1.0.redhat-379/bin/client -u admin -p admin "fabric:create --wait-for-provisioning"
	cd projects/usecase1
	mvn clean install -DskipTests 
	mvn fabric8:deploy -DskipTests  
	cd ../usecase2
	mvn clean install -DskipTests 
	mvn fabric8:deploy -DskipTests  
	cd ../usecase4
	mvn clean install -DskipTests 
	mvn fabric8:deploy -DskipTests  
	cd ../..
	./target/fuse/jboss-fuse-6.1.0.redhat-379/bin/client -u admin -p admin "profile-edit --bundles wrap:file:///$PWD/target/dv/jboss-eap-6.1/dataVirtualization/jdbc/teiid-8.4.1-redhat-7-jdbc.jar usecase1 1.0"  
	./target/fuse/jboss-fuse-6.1.0.redhat-379/bin/client -u admin -p admin "profile-edit --bundles wrap:file:///$PWD/target/dv/jboss-eap-6.1/dataVirtualization/jdbc/teiid-8.4.1-redhat-7-jdbc.jar usecase2 1.0"  
	./target/fuse/jboss-fuse-6.1.0.redhat-379/bin/client -u admin -p admin "profile-edit --bundles wrap:file:///$PWD/target/dv/jboss-eap-6.1/dataVirtualization/jdbc/teiid-8.4.1-redhat-7-jdbc.jar usecase4 1.0"  
	./target/fuse/jboss-fuse-6.1.0.redhat-379/bin/client -u admin -p admin "fabric:container-create-child --profile usecase1 --profile usecase2 --profile usecase4 --profile jboss-fuse-minimal root c1"   
fi
# Some wait code. Wait till the system is ready. 
STARTUP_WAIT=60
count=0
launched=false

until [ $count -gt $STARTUP_WAIT ]
do
    grep 'Broker root has started' $KARAF_LOG > /dev/null
    if [ $? -eq 0 ] ; then
      launched=true
      break
    fi
    sleep 1
    let count=$count+1;
done
./target/fuse/jboss-fuse-6.1.0.redhat-379/bin/client -u admin -p admin "fabric:container-start -f c1"
