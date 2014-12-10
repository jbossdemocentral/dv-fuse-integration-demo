THIS DEMO IS CURRENTLY BEING BUILT

JBoss DV and Fuse (Camel) Integration Demo
======================================
This is a demo project to get you started with automatically installing two EAP instances, one with JBoss 
DV product and the other with JBoss Fuse product configured and installed.

Quickstart
----------

1. [Download and unzip.](https://github.com/DataVirtualizationByExample/dv-fuse-integration-demo/archive/master.zip)

2. Add DV Product to software directory.

3. Run 'run.sh'

Follow the instructions on the screen to start JBoss BRMS server and JBoss DV server.

   ```
                                                                                       
   In a terminal window start the JBoss DV server:                                         
                                                                                       
     $ ./target/jboss-eap-6.1.dv/bin/standalone.sh   
   
                                                                                                                                                                         
   View the Use Case Project                                                                     
                                                                                       
       mvn test ....                                                   

   Login to 
      DV JBoss Management: http://localhost:8080         (u:admin / p:redhat1!)  
      DV Dashboard: http://localhost:8080/dashboard	(u: user / p:user)  


   ```

Use Cases 1 
------------  
**Objective**   
Use the JDBC component to access a virtual database  
**Problem**   
**Solution**   
**Description:**  
Use Cases 2 
------------  
**Objective**   
Use the SQL component to access a virtual database  
**Problem**   
**Solution**   
**Description:**  
Use Cases 3 
------------  
**Objective**   
Use the Olingo component to access a virtual database  
**Problem**   
**Solution**   
**Description:**  
Use Cases 4 
------------  
**Objective**   
Use the REST component to access a virtual database  
**Problem**   
**Solution**   
**Description:**  

Coming soon:
------------
   
   * more demo ideas?


Supporting Articles
-------------------
N/A  

Released versions
-----------------

See the tagged releases for the following versions of the product:

- v1.0 - Kenny Peeples initial setup
