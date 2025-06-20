package com.ijse.gdse.api.db;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;
import jakarta.servlet.annotation.WebListener;
import org.apache.commons.dbcp2.BasicDataSource;

import java.sql.SQLException;

@WebListener
public class DBCP implements ServletContextListener { //server eka run karanakotama allaganna listner kenek use karanna oni

    @Override
    public void contextInitialized(ServletContextEvent sce) {

        System.out.println("DBCP contextInitialized");
        BasicDataSource dataSource = new BasicDataSource();
        dataSource.setDriverClassName("com.mysql.jdbc.Driver");
        dataSource.setUrl("jdbc:mysql://localhost:3306/api");
        dataSource.setUsername("root");
        dataSource.setPassword("#Shanu0609@");
        dataSource.setInitialSize(5);
        dataSource.setMaxTotal(100);

        sce.getServletContext().setAttribute("dataSource", dataSource);//hema servlet ekakatama podu thena context eka

    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        System.out.println("DBCP contextDestroyed");
     BasicDataSource ds = (BasicDataSource) sce.getServletContext().getAttribute("dataSource");
        try {
            ds.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
