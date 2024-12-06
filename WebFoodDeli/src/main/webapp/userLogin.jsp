<!DOCTYPE html>
<html>
    <head>
        <title>Login for User</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="styles/loginPage.css">
    </head>

    </head>
    <body>
        <div class="container">
            <div class="form-section">
                <h1>Welcome Back!</h1>
                <form action="userLogin.jsp" method="post">
                    <input type="text" placeholder="Username" required> <br><br>
                    <input type="text" placeholder="Password" required> <br><br>
                    <button type="submit">Login</button>
                </form>
                <div class="social-login">

                </div>
            </div>
            <div class="image-section">
                <img class="login" style="width: 50px; border-radius: 50%" src="Utilities/img/google-icon.png" alt="Google">
                <img class="login" style="width: 50px; border-radius: 50%" src="Utilities/img/facebook-icon.png" alt="Google">
                <img class="login" style="width: 50px; border-radius: 50%" src="Utilities/img/apple-icon.png" alt="Google">
            </div>
        </div>
            
    </body>
</html>
