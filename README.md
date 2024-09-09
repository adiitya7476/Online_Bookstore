# Online Bookstore Management System

This project is an **Online Bookstore Management System** built using **Spring Boot, JSP, Hibernate, and MySQL**. It provides users with the ability to browse books, view details, add books to a cart, and make purchases. Admins can manage the catalog, apply discounts, and track orders.

## Features

### 1. User Registration and Authentication
- **Register**: New users can create an account by registering with their details.
- **Unique Username Validation**: During registration, the system checks if the username is already taken. Users must register with a unique username.
- **Login**: Existing users can log in using their username and password.
- **Session Management**: User sessions are maintained securely throughout their interaction.

### 2. Browse and Search Books
- **Browse Books**: Users can browse the entire catalog of available books.
- **Search Functionality**: Users can search for books by title, author, or category to quickly find desired books.

### 3. Book Details
- **View Book Details**: Users can click on any book to view detailed information such as the title, author, category, publisher, price, and discounted price.
- **Image Display**: Books include a small image on the left side for a better visual experience.

### 4. Add to Cart
- **Add Books to Cart**: Users can add books to their shopping cart and specify the quantity.
- **Stock Validation**: The system checks whether the requested quantity is within available stock before adding to the cart.

### 5. View Cart and Update
- **Cart Overview**: Users can view the items they have added to the cart, including titles, prices, and quantities.
- **Update Cart**: Users can update the quantity of items in their cart or remove items.

### 6. Order Placement
- **Checkout Process**: Users can proceed to place an order after reviewing their cart.
- **Payment Modes**: Includes various payment options such as UPI, with QR code and UPI ID display.
- **Transaction Details**: Users can input transaction details such as UPI transaction ID.

### 7. Admin Panel
- **Book Management**: Admins can add, update, or remove books from the catalog.
- **User Management**: Admins can view, update, or remove users from the system.
- **Order Management**: Admins can view and update the status of orders, including "Order Placed", "Processing", "Shipped", "In Transit", and "Delivered".
- **Discount Management**: Admins can apply discounts to specific books. The discounted price is reflected for users when browsing the catalog.

### 8. Top Discounted Books on User Homepage
- **Top Discounts Display**: Users can see the top discounted books displayed on the home page.
- **Sorted by Discount**: The books are sorted by the highest discount first, showing users the best deals upfront.

### 9. Order History
- **User Order History**: Users can view their past orders and check the current status of their ongoing orders.

## Technologies Used
- **Backend**: Spring Boot, Hibernate, Java
- **Frontend**: JSP, HTML, CSS, JavaScript
- **Database**: MySQL
- **Version Control**: GitHub

## Setup Instructions
1. Clone the repository:  
   `git clone https://github.com/adiitya7476/online-bookstore.git`
2. Import the project into your IDE (Eclipse or IntelliJ).
3. Set up MySQL and configure the `application.properties` file with your database credentials.
4. Run the project from your IDE.
5. Access the application at `http://localhost:8080`.

## Future Enhancements
- Add a review and rating system for books.
- Implement a recommendation system based on user preferences.
- Improve user interface with more advanced front-end technologies like React or Angular.

