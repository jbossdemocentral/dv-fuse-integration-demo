#!/bin/sh 
DEMO="JBoss Data Virtualization & Fuse Integration Demo" 
AUTHORS="Kenny Peeples, Bill Kemp, Cojan van Ballegooijen"
PROJECT="git@github.com:kpeeples/dv-fuse-integration-demo.git"
PRODUCT="JBoss DV & Fuse Integration Demo"
JBOSS_HOME=./target/jboss-eap-6.1
JBOSS_HOME_DV=./target/dv/jboss-eap-6.1
JBOSS_HOME_FUSE=./target/jboss-fuse-6.1.0.redhat-379
SERVER_DIR=$JBOSS_HOME/standalone/deployments/
SERVER_CONF=$JBOSS_HOME/standalone/configuration/
SERVER_BIN=$JBOSS_HOME/bin
SERVER_BIN_DV=$JBOSS_HOME_DV/bin
SERVER_BIN_FUSE=$JBOSS_HOME_FUSE/bin
SERVER_DIR=$JBOSS_HOME/standalone/deployments/
SERVER_CONF_DV=$JBOSS_HOME_DV/standalone/configuration/
SERVER_CONF_FUSE=$JBOSS_HOME_FUSE/etc
SRC_DIR=./software
DV_SUPPORT_DIR=./support/dv-support
FUSE_SUPPORT_DIR=./support/fuse-support
PRJ_DIR=./projects
FUSE=jboss-fuse-full-6.1.0.redhat-379.zip
DV=jboss-dv-installer-6.0.0.GA-redhat-4.jar
FUSE_VERSION=6.1.0
DV_VERSION=6.0.0

# wipe screen.
clear 

echo
echo "########################################################################"
echo "##                                                                    ##"   
echo "##  Setting up the ${DEMO}  ##"
echo "##                                                                    ##"   
echo "##                                                                    ##"   
echo "##   ####  #        #        ####  #  #   ###  ####                   ##"
echo "##   #   #  #      #     #   #     #  #  #     #                      ##"
echo "##   #   #   #    #     ###  ###   #  #   ##   ###                    ##"
echo "##   #   #    #  #       #   #     #  #     #  #                      ##"
echo "##   ####      #             #     ####  ###   ####                   ##"
echo "##                                                                    ##"   
echo "##                                                                    ##"   
echo "##  brought to you by,                                                ##"   
echo "##             ${AUTHORS}       ##"
echo "##                                                                    ##"   
echo "##  ${PROJECT}              ##"
echo "##                                                                    ##"   
echo "########################################################################"
echo

command -v mvn -q >/dev/null 2>&1 || { echo >&2 "Maven is required but not installed yet... aborting."; exit 1; }

# make some checks first before proceeding.	
if [ -r $SRC_DIR/$DV ] || [ -L $SRC_DIR/$DV ]; then
	    echo JBoss product sources, $DV present...
		echo
else
		echo Need to download $DV package from the Customer Portal 
		echo and place it in the $SRC_DIR directory to proceed...
		echo
		exit
fi

# make some checks first before proceeding.	
if [ -r $SRC_DIR/$FUSE ] || [ -L $SRC_DIR/$FUSE ]; then
	    echo JBoss product sources, $FUSE present...
		echo
else
		echo Need to download $FUSE package from the Customer Portal 
		echo and place it in the $SRC_DIR directory to proceed...
		echo
		exit
fi

# Remove JBoss product installation if exists.
if [ -x target ]; then
	echo "  - existing JBoss product installation detected..."
	echo
	echo "  - removing existing JBoss product installation..."
	echo
	rm -rf target
fi

read -p "Starting DV Install <hit return or wait 5 seconds>" -t 2
echo

# Run DV installer.
echo Product installer running now...
echo

java -jar $SRC_DIR/$DV $DV_SUPPORT_DIR/InstallationScript.xml 

read -p "Post DV install configuration <hit return or wait 5 seconds>" -t 5
echo

echo
echo "  - install teiid security files..."
echo
cp $DV_SUPPORT_DIR/teiid* $SERVER_CONF_DV

echo
echo "  - move data files..."
echo
cp -R $DV_SUPPORT_DIR/data/* $JBOSS_HOME_DV/standalone/data

echo
echo "  - move virtual database..."
echo
cp -R $DV_SUPPORT_DIR/vdb $JBOSS_HOME_DV/standalone/deployments

echo "  - setting up dv standalone.xml configuration adjustments..."
echo
cp $DV_SUPPORT_DIR/standalone.dv.xml $SERVER_CONF_DV/standalone.xml

if [ -x target ]; then
  # Unzip the JBoss Fuse instance.
  echo Installing JBoss Fuse $FUSE_VERSION
  echo
  unzip -q -d target $SRC_DIR/$FUSE
else
	echo
	echo Missing target directory, stopping installation.
	echo 
	exit
fi

echo "  - enabling demo accounts logins in users.properties file..."
echo
cp $FUSE_SUPPORT_DIR/users.properties $SERVER_CONF_FUSE

echo "  - enabling useCase 3 properties file..."
echo
cp $FUSE_SUPPORT_DIR/com.demo.usecase3.odata.cfg $SERVER_CONF_FUSE



# Final instructions to user to start and run demo.                                                                  
echo
echo "==========================================================================================="
echo "=                                                                                         ="
echo "=  You can now start the JBoss Data Virtualization with:                                  ="
echo "=                                                                                         ="
echo "=        $SERVER_BIN/standalone.sh                                         ="
echo "=                                                                                         ="
echo "=    - login JBoss Data Virtualization at:                                                ="
echo "=                                                                                         ="
echo "=        http://localhost:8080/ (u:admin/p:redhat1!)                                      ="
echo "=                                                                                         ="
echo "=  Deploying the camel route in JBoss Fuse as follows:                                    ="
echo "=                                                                                         ="
echo "=    - add fabric server passwords for Maven Plugin to your ~/.m2/settings.xml            =" 
echo "=      file the fabric server's user and password so that the maven plugin can            ="
echo "=      login to the fabric. fabric8.upload.repoadminadmin                                 ="
echo "=                                                                                         ="
echo "=    - start the JBoss Fuse with:                                                         ="
echo "=                                                                                         ="
echo "=        $SERVER_BIN_FUSE/fuse                                    ="
echo "=                                                                                         ="
echo "=    - start up fabric in fuse console: fabric:create --wait-for-provisioning             ="
echo "=                                                                                         ="
echo "=    - run 'mvn fabric8:deploy' from projects/usecase1                                    ="
echo "=                                                                                         ="
echo "=    - login to Fuse management console at:                                               ="
echo "=                                                                                         ="
echo "=        http://localhost:8181    (u:admin/p:admin)                                       ="
echo "=                                                                                         ="
echo "=    - connect to root container with login presented by console  (u:admin/p:admin)       ="
echo "=    - edit dvfusedemo profile to include the Teiid JDBC driver                           ="
echo "=      or use the following command in the bin/admin shell                                ="
echo "=          profile-edit                                                                   ="
echo "=                --bundles wrap:file:///teiid-8.4.1-redhat-7-jdbc.jar                     ="
echo "=                dvfusedemo 1.0                                                           ="
echo "=                                                                                         ="
echo "=    - create container name c1 and add dvfusedemo and jboss-fuse-minimal profile         ="
echo "=      or use the following command in the bin/admin shell                                ="
echo "=          fabric:container-create-child --profile dvfusedemo                             ="
echo "=                                        --profile jboss-fuse-minimal root c1             ="
echo "=                                                                                         ="
echo "=    - open c1 container to view route under 'Diagram' tab                                ="
echo "=                                                                                         ="                   
echo "=                                                                                         ="
echo "=   $DEMO Setup Complete.                     ="
echo "==========================================================================================="
echo

