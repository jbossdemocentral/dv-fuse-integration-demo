THIS DEMO IS CURRENTLY BEING BUILT

JBoss DV and Fuse (Camel) Integration Demo
======================================
This is a demo project to get you started with automatically installing two EAP instances, one with JBoss 
DV product and the other with JBoss Fuse product configured and installed.

Quickstart
----------

1. [Download and unzip.](https://github.com/DataVirtualizationByExample/dv-fuse-integration-demo/archive/master.zip)

2. Add products to installs directory.

3. Run 'init.sh' or 'init.bat'.

Follow the instructions on the screen to start JBoss BRMS server and JBoss DV server.

   ```
                                                                                       
   In a terminal window start the JBoss DV server:                                         
                                                                                       
     $ ./target/jboss-eap-6.1.dv/bin/standalone.sh                                     
                                                                                                                                                                         
   View the Virtual Database Project:                                                                     
                                                                                       
       Import the DV project into JBDS with the Teiid tools installed.  
       See the How to guide for more detail.  
       The Virtual Database and data is installed during the init.sh script.                                                       

   Login to 
      DV JBoss Management: http://localhost:8080         (u:admin / p:redhat1!)  
      DV Dashboard: http://localhost:8080/dashboard	(u: user / p:user)  


   ```
UC1: JDBC
UC2: SQL
UC3: Olingo
UC4: REST for OData

Use Cases 1 
------------  
**Objective**   
Use the Olingo component to access a virtual database  
**Problem**   
   
**Solution**   
Use the Olingo camel component   
**Description:**  


Coming soon:
------------
   
   * more demo ideas?


Supporting Articles
-------------------
How to guide for more detail on install to run the demo and to recreate from scratch in process with 3 videos - Part 1 Setup/Configuration, Part 2 Build/deploy, Part 3 Run.  
DV - Example of two federating two datasources - https://developer.jboss.org/docs/DOC-18404  
BRMS - A basic BRMS quickstart - http://www.jboss.org/quickstarts/brms/helloworld-brms/  

Released versions
-----------------

See the tagged releases for the following versions of the product:

- v1.1 - setup initial demo project for using multiple camel components.

- v1.0 - Kenny Peeples initial setup for webinar on this topic in September 2014.
