package folder;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.*;

@WebServlet("/AccountServlet")
public class AccountServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        HttpSession session = request.getSession();

        if ("register".equals(action)) {
            // Retrieve account details from the form
            String fullname = request.getParameter("FullName");
            String username = request.getParameter("UserName");
            String address = request.getParameter("Address");
            String phonenumber = request.getParameter("PhoneNumber");
            String password = request.getParameter("Password");

            // Check if the account already exists
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                try (Connection conn = ConnectDB.getConnectDB()) {
                    String checkSql = "SELECT * FROM Users WHERE UserName = ?";
                    try (PreparedStatement checkStmt = conn.prepareStatement(checkSql)) {
                        checkStmt.setString(1, username);
                        ResultSet rs = checkStmt.executeQuery();

                        if (rs.next()) {
                            // Account already exists, redirect to customer.html
                            session.setAttribute("FullName", rs.getString("Fullname"));
                            session.setAttribute("UserName", rs.getString("UserName"));
                            session.setAttribute("Address", rs.getString("UserAddress"));
                            session.setAttribute("PhoneNumber", rs.getString("UserNumber"));
                            response.sendRedirect("customer.html");
                        } else {
                            // Insert new account into the database
                            String insertSql = "INSERT INTO Users (Fullname, UserName, UserAddress, UserNumber, UserPassword) VALUES (?, ?, ?, ?, ?)";
                            try (PreparedStatement insertStmt = conn.prepareStatement(insertSql)) {
                                insertStmt.setString(1, fullname);
                                insertStmt.setString(2, username);
                                insertStmt.setString(3, address);
                                insertStmt.setString(4, phonenumber);
                                insertStmt.setString(5, password);
                                insertStmt.executeUpdate();
                            }

                            // Set session attributes and redirect
                            session.setAttribute("FullName", fullname);
                            session.setAttribute("UserName", username);
                            session.setAttribute("Address", address);
                            session.setAttribute("PhoneNumber", phonenumber);
                            response.sendRedirect("customer.html");
                        }
                    }
                }
            } catch (ClassNotFoundException | SQLException e) {
                e.printStackTrace();
                response.sendRedirect("error.html");
            }
        } else if ("login".equals(action)) {
            // Retrieve login details from the form
            String username = request.getParameter("UserName");
            String password = request.getParameter("Password");

            // Validate login
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                try (Connection conn = ConnectDB.getConnectDB()) {
                    String sql = "SELECT * FROM Users WHERE UserName = ? AND UserPassword = ?";
                    try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                        stmt.setString(1, username);
                        stmt.setString(2, password);
                        ResultSet rs = stmt.executeQuery();

                        if (rs.next()) {
                            // Successful login
                            session.setAttribute("FullName", rs.getString("Fullname"));
                            session.setAttribute("UserName", rs.getString("UserName"));
                            session.setAttribute("Address", rs.getString("UserAddress"));
                            session.setAttribute("PhoneNumber", rs.getString("UserNumber"));
                            response.sendRedirect("customer.html");
                        } else {
                            // Failed login
                            response.sendRedirect("login.html?error=invalid");
                        }
                    }
                }
            } catch (ClassNotFoundException | SQLException e) {
                e.printStackTrace();
                response.sendRedirect("error.html");
            }
        }
    }
}
