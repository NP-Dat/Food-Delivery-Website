<!DOCTYPE html>
<html>
    <head>
        <title>Login for User</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>

    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f7f9fc;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .container {
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            padding: 20px;
            width: 400px;
            text-align: center;
        }
        .form-section {
            margin-bottom: 20px;
        }
        input[type="text"], input[type="password"] {
            width: 100%;
            padding: 10px;
            margin: 5px 0;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        button {
            background-color: #007bff;
            color: white;
            border: none;
            padding: 10px;
            border-radius: 4px;
            cursor: pointer;
            width: 100%;
        }
        button:hover {
            background-color: #0056b3;
        }
    </style>
    <body>
        <div class="container">
            <div class="form-section">
                <h1>Welcome Back!</h1>
                <p>Enter your email and password to login</p>
                <form action="userLogin.jsp" method="post">
                    <input type="text" placeholder="Email" name="email" required> <br><br>
                    <input type="password" placeholder="Password" name="password" required> <br><br>
                    <button type="submit">Login</button>
                </form>
            </div>
        </div>
    </body>
</html>
