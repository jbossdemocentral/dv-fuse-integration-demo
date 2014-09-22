package com.mycompany.camel.java;

import javax.sql.DataSource;

import org.apache.camel.impl.JndiRegistry;
import org.apache.camel.main.Main;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.apache.commons.dbcp2.BasicDataSource;

/**
 * A Camel Application
 */
public class MainApp {

    /**
     * A main() so we can easily run these routing rules in our IDE
     */
    public static void main(String... args) throws Exception {
        Main main = new Main();
        main.enableHangupSupport();
        
        String url = "jdbc:teiid:CustomerLoyalty@mm://locahost:31000";
        DataSource dataSource = setupDataSource(url);
        // bind dataSource into the registery
        main.bind("myDataSource", dataSource);
        
        main.addRouteBuilder(new MyRouteBuilder());
        main.run(args);
    }
    private static DataSource setupDataSource(String connectURI) {
        BasicDataSource ds = new BasicDataSource();
        ds.setDriverClassName("org.teiid.jdbc.TeiidDriver");
        ds.setUsername("user");
        ds.setPassword("user");
        ds.setUrl(connectURI);
        return ds;
    }

}
