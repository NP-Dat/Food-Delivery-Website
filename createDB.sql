CREATE DATABASE FoodDelivery;

USE FoodDelivery;

CREATE TABLE Users (
    UserID INT AUTO_INCREMENT PRIMARY KEY,
    Fullname VARCHAR(255),
    UserName VARCHAR(255) UNIQUE,
    UserAddress VARCHAR(255) NOT NULL,
    UserNumber VARCHAR(20) NOT NULL,
    UserPassword VARCHAR(255) NOT NULL
);

CREATE TABLE Restaurant (
    RestaurantID INT AUTO_INCREMENT PRIMARY KEY,
    RestaurantUsername VARCHAR(255) UNIQUE,
    RestaurantName VARCHAR(255) NOT NULL,
    RestaurantAddress VARCHAR(255) NOT NULL,
    RestaurantNumber VARCHAR(20) NOT NULL,
    RestaurantPassword VARCHAR(255) NOT NULL
);

CREATE TABLE DeliveryPerson (
    DeliveryID INT AUTO_INCREMENT PRIMARY KEY,
    DName VARCHAR(255) NOT NULL,
    Number VARCHAR(20) NOT NULL,
    CurrentLocation VARCHAR(255) NOT NULL,
    PersonStatus VARCHAR(10) NOT NULL
);

CREATE TABLE Cart (
    CartID INT AUTO_INCREMENT PRIMARY KEY,
    TotalCost FLOAT
);

CREATE TABLE Orders (
    OrderID INT AUTO_INCREMENT PRIMARY KEY,
    DeliveryPersonID INT,
    CartID INT NOT NULL,
    UserID INT NOT NULL,
    RestaurantID INT,
    DateAndHour VARCHAR(255),
    CurrentStatus VARCHAR(20),
    DeliveryTime VARCHAR(255),
    FOREIGN KEY (DeliveryPersonID) REFERENCES DeliveryPerson(DeliveryID),
    FOREIGN KEY (CartID) REFERENCES Cart(CartID),
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (RestaurantID) REFERENCES Restaurant(RestaurantID)
);

CREATE TABLE Payment (
    PaymentID INT AUTO_INCREMENT PRIMARY KEY,
    OrderID INT,
    PaymentMethod VARCHAR(20) NOT NULL,
    PaymentStatus VARCHAR(20) NOT NULL,
    PaymentTime VARCHAR(255) NOT NULL,
    Amount FLOAT NOT NULL,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

CREATE TABLE MenuItem (
    FoodID INT AUTO_INCREMENT PRIMARY KEY,
    FoodName VARCHAR(255) NOT NULL,
    Price FLOAT NOT NULL,
    RestaurantID INT NOT NULL,
	Url VARCHAR(255) NOT NULL,
    FOREIGN KEY (RestaurantID) REFERENCES Restaurant(RestaurantID)
);

CREATE TABLE SelectedItem (
    SelectID INT AUTO_INCREMENT PRIMARY KEY,
    FoodID INT NOT NULL,
    Quantity INT NOT NULL,
    CartID INT NOT NULL,
    FOREIGN KEY (FoodID) REFERENCES MenuItem(FoodID),
    FOREIGN KEY (CartID) REFERENCES Cart(CartID)
);

INSERT INTO Users (Fullname, UserName, UserAddress, UserNumber, UserPassword)
VALUES 
('John Doe', 'johndoe', '123 Main St, Townsville', '1234567890', 'password123'),
('Jane Smith', 'janesmith', '789 Park Ave, Townsville', '0987654321', 'mypassword');

INSERT INTO Restaurant (RestaurantUsername, RestaurantName, RestaurantAddress, RestaurantNumber, RestaurantPassword)
VALUES 
('burgerplace', 'Burger Place', '456 Side St, Townsville', '0987654321', 'securepassword'),
('pizzacorner', 'Pizza Corner', '321 Hill Rd, Townsville', '1230987654', 'pizzapass');

INSERT INTO MenuItem (FoodName, Price, RestaurantID, Url)
VALUES 
('Cheeseburger', 8, 1, 'images/burger.png'),
('Veggie Pizza', 10, 2, 'images/fries.png');

INSERT INTO DeliveryPerson (DName, Number, CurrentLocation, PersonStatus)
VALUES 
('Alice Smith', '9876543210', 'Central Hub, Townsville', 'Available'),
('Bob Johnson', '8765432109', 'North Hub, Townsville', 'Available');

INSERT INTO Cart (TotalCost)
VALUES 
(16.00),
(20.00);

INSERT INTO SelectedItem (FoodID, Quantity, CartID)
VALUES 
(1, 2, 1),
(2, 2, 2);

INSERT INTO Orders (DeliveryPersonID, CartID, UserID, RestaurantID, DateAndHour, CurrentStatus, DeliveryTime)
VALUES 
(1, 1, 1, 1, '2023-12-05 12:00:00', 'Preparing', '2023-12-05 13:00:00'),
(2, 2, 2, 2, '2023-12-06 18:00:00', 'Delivered', '2023-12-06 19:00:00');

INSERT INTO Payment (OrderID, PaymentMethod, PaymentStatus, PaymentTime, Amount)
VALUES 
(1, 'Credit Card', 'Completed', '2023-12-05 11:50:00', 16.00),
(2, 'PayPal', 'Pending', '2023-12-06 17:50:00', 20.00);

SELECT * FROM Cart;
SELECT * FROM Payment;
SELECT * FROM Orders;
SELECT * FROM Users;
SELECT * FROM Restaurant;
SELECT * FROM DeliveryPerson;
SELECT * FROM MenuItem;