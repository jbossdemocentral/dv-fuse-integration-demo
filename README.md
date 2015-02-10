JBoss DV and Fuse (Camel) Integration Demo
======================================
This demo project will get you started with automatically installing two server instances, one with JBoss Data Virtualization and the other with JBoss Fuse, and then configuring 4 examples for accessing data through Camel.
  
  Use case 1 - Use the JDBC component to access a virtual database  
  Use case 2 - Use the SQL component to access a virtual database  
  Use case 3 - Use the Olingo component to access a virtual database (this is planned for the Fuse 6.2 release)  
  Use case 4 - Use the REST component to access a virtual database  
  
Quickstart  
----------  

1. [Download and unzip.](https://github.com/DataVirtualizationByExample/dv-fuse-integration-demo/archive/master.zip)

2. Add the DV and Fuse Products to the software directory.

3. Run 'init.sh' to setup the environment locally.  (Docker and Openshift will be added)

4. Start the servers and run the test cases.  The manual steps are listed below.  If you prefer you can run the run.sh to  
run the servers and test cases.  A timer starts the route for the use cases so you can watch the console log to  
watch the output of the route.
  
   ```  
   a. First make sure the fabric server passwords for the Maven Plugin is in your ~/.m2/settings.xml file so that the maven plugin can login to the fabric.  
      See the example in the support/settings.xml file.  Also make sure JAVA_HOME is setup, such as - export JAVA_HOME="/etc/alternatives/java_sdk" - on Fedora.  

   b. Run 'run.sh' to start the servers, create the container and deploy the bundles.  
      
   c. Sign onto the Fuse Management console and check the console log to see the output from the routes for the use cases.  You can also view the Camel Diagrams.  
   
   ``` 

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
