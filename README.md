JBoss DV and Fuse (Camel) Integration Demo
======================================
This demo project will get you started with automatically installing two server instances, one with JBoss Data Virtualization and the other with JBoss Fuse, and then configuring 4 examples for accessing data through Camel.
  
  Use case 1 - Use the JDBC component to access a virtual database  
  Use case 2 - Use the SQL component to access a virtual database  
  Use case 3 - Use the Olingo component to access a virtual database (this will be added when Fuse 6.2 is released)  
  Use case 4 - Use the REST component to access a virtual database  
  
Quickstart  
----------  

1. [Download and unzip.](https://github.com/DataVirtualizationByExample/dv-fuse-integration-demo/archive/master.zip). If running on Windows, it is reccommended the project be extracted to a location near the root drive path due to limitations of length of file/path names.

2. Add the DV and Fuse Products to the software directory.

3. Run 'init.sh' or 'init.bat' to setup the environment locally. 'init.bat' must be run with Administrative privileges (Docker and Openshift will be added)

4. Start the servers and run the test cases.  The manual steps are listed below.  If you prefer you can run the run.sh to  
run the servers and test cases.  A timer starts the route for the use cases so you can watch the console log to  
watch the output of the route.
  
   ```  
   a. First make sure the fabric server passwords for the Maven Plugin is in your ~/.m2/settings.xml file so that the maven plugin can login to the fabric. 
      
      <server>  
	<id>fabric8.upload.repo</id>  
	<username>admin</username>  
	<password>admin</password>  
      </server>  
      
   b. Start JBoss Data Virtualization with:  
      
      ./target/dv/jboss-eap-6.1/bin/standalone.sh  
  
   c. Login to JBoss Data Virtualization to view the CustomerCOntextVDB with the CustomerContextView.   
  
      http://localhost:8080/ (u:admin/p:redhat1!)  
  
   d. Start JBoss Fuse with:  

      ./target/fuse/jboss-fuse-6.1.0.redhat-379/bin/fuse  
  
   e. Start up fabric in fuse console: fabric:create --wait-for-provisioning  
  
   f. Run 'mvn clean install -DskipTests' from projects/usecase1 (for each use case)  
  
   g. Run 'mvn fabric8:deploy -DskipTests' from projects/usecase1 (for each use case)  
  
   h. Login to Fuse management console at:  
  
      http://localhost:8181    (u:admin/p:admin)  
  
   i. Connect to the root container with login presented by console  (u:admin/p:admin)  
      
   f. Edit usecase1 profile to include the Teiid JDBC driver (for each use case) or use the following command in the bin/admin shell  
   
      profile-edit --bundles wrap:file:///<install-dir>/teiid-8.4.1-redhat-7-jdbc.jar usecase1 1.0  
      where install-dir = <dir>/dv-fuse-integration-demo/target/dv/jboss-eap-6.1/dataVirtualization/jdbc  
    
   k. Create container name c1 and add usecase1 (add all use cases) and jboss-fuse-minimal profile or use the following command in the bin/admin shell  
  
      fabric:container-create-child --profile usecase1 --profile jboss-fuse-minimal root c1   
  
   l. Open c1 container to view route under 'Diagram' tab (use case 1 and 2 use timer; use case 4 use jetty container input)  
   
   m. Open the log to view the output from the route

   ``` 

Docker Option:
------------

The demo can be run in a docker container. Full instructions can be found in [support/docker/README.md](support/docker/README.md).

Coming soon:
------------
   
   * more demo ideas?


Supporting Articles
-------------------
N/A  

Released versions
-----------------

See the tagged releases for the following versions of the product:

- v2.0 - Bill, Cojan, Kenny first build
- v1.0 - Kenny Peeples initial setup
