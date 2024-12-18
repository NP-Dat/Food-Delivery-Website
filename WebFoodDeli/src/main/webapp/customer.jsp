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
            <a href="index.html"><img class="logo" src="images/logo.png" alt=""></a>
            
            <a href="cart.html">
                <img class="cart-logo" src="images/icon-cart.svg" alt="">
            </a>
        </header>
        <main>
            <!-- Display the username dynamically -->
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
            
            <div class="middle-section">
                <input class="search-bar" type="text" placeholder="Search">
                <button class="search-button">
                    <img class="search-icon" src="images/search.svg">
                </button>
            </div>


            

            <table border="1" id="resultsTable">
                <thead>
                    <tr>
                        <th>Food Name</th>
                        <th>Food Price</th>
                        <th>Quantity</th>
                        <th>Add to Cart</th>
                    </tr>
                    <tr>
                        <td>Food Name</td>
                        <td>Food Price</td>
                        <td>Quantity</td>
                        <td><button class="add-to-cart">Add to Cart</button></td>
                    </tr>
                </thead>
                <tbody>
                    <!-- Results will be dynamically inserted here -->
                </tbody>
            </table>       
        </main>
    </body>
</html>
