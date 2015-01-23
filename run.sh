THIS SCRIPT IS CURRENTLY IN PROCESS
./target/dv/jboss-eap-6.1/bin/standalone.sh  
./target/fuse/jboss-fuse-6.1.0.redhat-379/bin/fuse  
fabric:create --wait-for-provisioning  
mvn clean install -DskipTests 
mvn fabric8:deploy -DskipTests  
profile-edit --bundles wrap:file:///<install-dir>/teiid-8.4.1-redhat-7-jdbc.jar usecase1 1.0  
  where install-dir = <dir>/dv-fuse-integration-demo/target/dv/jboss-eap-6.1/dataVirtualization/jdbc  
fabric:container-create-child --profile usecase1 --profile jboss-fuse-minimal root c1   
