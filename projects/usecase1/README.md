Camel Router Project for Blueprint (OSGi)
=========================================

To build this project use

    mvn clean install -DskipTests

To deploy the project in JBoss Fuse. The project will be deployes in a JBoss Fuse Fabric profile You can run the following command from its shell:

    mvn fabric8:deploy -D skipTests

Login to Fuse management console at:

    http://localhost:8181    

with username admin and password admin

Connect to root container with login presented by console and edit usecase1 fabric profile to include the Teiid JDBC driver or use the following command in the bin/admin shell

    profile-edit --bundles wrap:file:///$PATH/teiid-8.4.1-redhat-7-jdbc.jar iusecase1 1.0  

Create container name c1 and add usecase1 and jboss-fuse-minimal profile or use the following command in the bin/admin shell

    fabric:container-create-child --profile usecase1 --profile jboss-fuse-minimal root c1

Open c1 container to view route under 'Diagram' tab
