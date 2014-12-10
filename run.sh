#!/bin/sh 
DEMO="JBoss DV and Fuse Integration Demo"
AUTHORS="Kenny Peeples, Bill Kemp, Cojan"
PROJECT="git@github.com:kpeeples/dv-brms-integration-demo.git"
PRODUCT="JBoss BRMS & JBoss DV Integration Demo"
JBOSS_HOME=./target/jboss-eap-6.1
JBOSS_HOME_DV=./target/dv/jboss-eap-6.1
SERVER_DIR=$JBOSS_HOME/standalone/deployments/
SERVER_CONF=$JBOSS_HOME/standalone/configuration/
SERVER_BIN=$JBOSS_HOME/bin
SERVER_BIN_DV=$JBOSS_HOME_DV/bin
SERVER_CONF_DV=$JBOSS_HOME_DV/standalone/configuration/
SRC_DIR=./software
DV_SUPPORT_DIR=./support/dv-support
PRJ_DIR=./projects
FUSE=
DV=jboss-dv-installer-6.0.0.GA-redhat-4.jar
FUSE_VERSION=6.0.3
DV_VERSION=6.0.0

# wipe screen.
clear 

echo  
echo "Setting up ${DEMO}" 
echo "brought to you by,"   
echo "${AUTHORS}"
echo "${PROJECT}"
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

# Move the old JBoss instance, if it exists, to the OLD position.
if [ -x $JBOSS_HOME ]; then
		echo "  - existing JBoss product install detected and removed..."
		echo
		rm -rf ./target
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

# Final instructions to user to start and run demo.                                                                                     ="
echo "$DEMO Setup Complete."
echo

