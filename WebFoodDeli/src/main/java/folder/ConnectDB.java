/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package folder;
import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectDB {
    public static void main(String[] args) {
        String url = "jdbc:mysql://localhost:3306/fooddelivery";
        String username = "root";
        String password = "Addmin123";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver"); // Optional for MySQL 8+ drivers
            Connection conn = DriverManager.getConnection(url, username, password);
            System.out.println("Connection successful!");
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

