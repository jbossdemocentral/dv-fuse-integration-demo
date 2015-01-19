THIS DEMO IS CURRENTLY BEING BUILT TARGET 1/19 WITH Customer/Loyalty Context VDB  

JBoss DV and Fuse (Camel) Integration Demo
======================================
This is a demo project to get you started with automatically installing two EAP instances, one with JBoss Data Virtualization  product and the other with JBoss Fuse product configured and installed.
  
  Use case 1 - Use the JDBC component to access a virtual database  
  Use case 2 - Use the SQL component to access a virtual database  
  Use case 3 - Use the Olingo component to access a virtual database  
  Use case 4 - Use the REST component to access a virtual database  
  
Quickstart
----------

1. [Download and unzip.](https://github.com/DataVirtualizationByExample/dv-fuse-integration-demo/archive/master.zip)

2. Add DV Product to software directory.

3. Run 'menu.sh' to setup the environment locally (init.sh), docker (init-docker.sh) or openshift (init-openshift.sh)

4. Start the servers and run the test cases  
  
   ```  
  You can now start the JBoss Data Virtualization with:  
      ./target/dv/jboss-eap-6.1/bin/standalone.sh  
  
      - login JBoss Data Virtualization at:  
  
      http://localhost:8080/ (u:admin/p:redhat1!)  

  Deploying the camel route in JBoss Fuse as follows:

      - add fabric server passwords for Maven Plugin to your ~/.m2/settings.xml  
      file the fabric server's user and password so that the maven plugin can  
  
      login to the fabric. 
      
      <server>  
	<id>fabric8.upload.repo</id>  
	<username>admin</username>  
	<password>admin</password>  
      </server>  
  
      - start the JBoss Fuse with:  

      ./target/fuse/jboss-fuse-6.1.0.redhat-379/bin/fuse  

     - start up fabric in fuse console: fabric:create --wait-for-provisioning  
     
     - run 'mvn clean install -DskipTests' from projects/usecase1 (for each use case)
  
     - run 'mvn fabric8:deploy -DskipTests' from projects/usecase1 (for each use case)
  
     - login to Fuse management console at:
  
      http://localhost:8181    (u:admin/p:admin)

      - connect to root container with login presented by console  (u:admin/p:admin)  
      
      - edit usecase1 (each profile) profile to include the Teiid JDBC driver  
	 or use the following command in the bin/admin shell  
         profile-edit --bundles wrap:file:///<install-dir>/teiid-8.4.1-redhat-7-jdbc.jar usecase1 1.0  
         where install-dir = <dir>/dv-fuse-integration-demo/target/dv/jboss-eap-6.1/dataVirtualization/jdbc  
    
      - create container name c1 and add usecase1 (add all use cases) and jboss-fuse-minimal profile  
	or use the following command in the bin/admin shell  
	fabric:container-create-child --profile usecase1 --profile jboss-fuse-minimal root c1   
  
    - open c1 container to view route under 'Diagram' tab (use case 1 timer) (UC2 timer) (UC4 jetty container input)                                                                                                                                                                                                                         

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
