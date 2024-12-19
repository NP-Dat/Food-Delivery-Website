<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%
    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;
    String searchQuery = request.getParameter("search"); // Get the search term, if any

    try {
        // Database connection
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/FoodDelivery", "root", "Admin123");

        // SQL Query to fetch all menu items or items matching the search term
        String sql = "SELECT FoodID, FoodName, Price, Url FROM MenuItem";
        if (searchQuery != null && !searchQuery.isEmpty()) {
            sql += " WHERE FoodName LIKE ?";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, "%" + searchQuery + "%");
        } else {
            stmt = conn.prepareStatement(sql);
        }

        rs = stmt.executeQuery(); // Execute the query
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="customer.css">
    <title>Customer - PD Food Deli</title>
</head>
<body>
    <header>
        <a href="index.html"><img class="logo" src="images/logo.png" alt="PD Food Deli Logo"></a>
        <a href="cart.html">
            <img class="cart-logo" src="images/icon-cart.svg" alt="Cart Icon">
        </a>
    </header>
    <main>
        <div class="welcome-message">
            <h2>
                Hello, <span id="username">
                    <% String username = (String) session.getAttribute("UserName");
                       if (username != null) {
                           out.print(username);
                       } else {
                           out.print("Guest");
                       }
                    %>
                </span>!
            </h2>
        </div>

        <!-- Search bar -->
        <div class="middle-section">
            <form method="get" action="Customer.jsp">
                <input class="search-bar" type="text" name="search" placeholder="Search for food..."
                       value="<%= searchQuery != null ? searchQuery : "" %>">
                <button class="search-button" type="submit">
                    <img class="search-icon" src="images/search.svg" alt="Search">
                </button>
            </form>
        </div>

        <!-- Menu items table -->
        <table border="1" id="resultsTable">
            <thead>
                <tr>
                    <th>Food Name</th>
                    <th>Price</th>
                    <th>Image</th>
                    <th>Add to Cart</th>
                </tr>
            </thead>
            <tbody>
                <% 
                    try {
                        if (rs != null) {
                            while (rs.next()) { 
                %>
                <tr>
                    <td><%= rs.getString("FoodName") %></td>
                    <td>$<%= rs.getDouble("Price") %></td>
                    <td><img src="<%= rs.getString("Url") %>" alt="Food Image" width="100"></td>
                    <td>
                        <form method="post" action="CartServlet">
                            <input type="hidden" name="FoodID" value="<%= rs.getInt("FoodID") %>">
                            <input type="hidden" name="action" value="add">
                            <button type="submit" class="add-to-cart">Add to Cart</button>
                        </form>
                    </td>
                </tr>
                <% 
                            }
                        } else {
                            out.println("<tr><td colspan='4'>No items found.</td></tr>");
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    } finally {
                        if (rs != null) rs.close();
                        if (stmt != null) stmt.close();
                        if (conn != null) conn.close();
                    }
                %>
            </tbody>
        </table>
    </main>
</body>
</html>
