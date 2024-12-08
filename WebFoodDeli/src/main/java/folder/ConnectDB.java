/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package folder;

import java.sql.*;

// This Class handles connection to the Database
// Each instance get a new connection and have to close at the end of the function

public class ConnectDB {
    public Statement stmt;
    public PreparedStatement preparedStmt;
    public Connection conn;
    String jdbcUrl = "jdbc:mysql://localhost:3306/FoodDelivery?autoReconnect=true&useSSL=false";
    String dbuser = "root"; // change if different
    String dbpassword = "Admin123"; // change if different
    
    public ConnectDB() throws SQLException {
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (Exception e) {
           e.printStackTrace();
        }
        conn = DriverManager.getConnection(jdbcUrl,dbuser,dbpassword);
        stmt = conn.createStatement();
    }



    public void closeConnection() throws SQLException {
        conn.close();
    }

    public Connection getConn() {
        return conn;
    }

    public String getUrl() {
        return jdbcUrl;
    }

    public void setUrl(String url) {
        this.jdbcUrl = jdbcUrl;
    }
}

