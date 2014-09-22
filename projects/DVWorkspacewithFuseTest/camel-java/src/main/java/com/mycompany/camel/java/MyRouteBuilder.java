package com.mycompany.camel.java;

import org.apache.camel.builder.RouteBuilder;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.apache.camel.impl.JndiRegistry;

/**
 * A Camel Java DSL Router
 */
public class MyRouteBuilder extends RouteBuilder {

    /**
     * Let's configure the Camel routing rules using Java code...
     */
    public void configure() {
    
        from("timer://foo?period=60000")
        	.setBody(constant("select * from customer;"))
        	.to("jdbc:myDataSource")
        	.to("mock:result");
        
    }

}
