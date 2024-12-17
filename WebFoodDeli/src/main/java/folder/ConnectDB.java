/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package folder;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectDB {
    private static final String url = "jdbc:mysql://localhost:3306/FoodDelivery";
    private static final String username = "root";
    private static final String password = "admin";

    public static Connection getConnectDB()throws SQLException{
        try {
            Class.forName("com.mysql.cj.jdbc.Driver"); // Optional for MySQL 8+ drivers
           
           
        } catch (ClassNotFoundException e) {}
        return DriverManager.getConnection(url, username, password);
    }
        
    
}

