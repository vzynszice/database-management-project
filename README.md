# Hobby Market - Flutter E-Commerce Application
Hobby Market is a simple mobile e-commerce application where users can buy and sell handmade products. It uses a PostgreSQL database as the backend.

## 📱 Features
- User login and registration system
- Filtering products by category and price
- Adding products to the cart and payment transactions
- Tracking purchased products
- Viewing the products sold by the user
- Instant balance and address management

## 🛠️ Technologies
- Flutter – UI toolkit used for mobile application development.
- PostgreSQL – Relational database where user, product and shopping data is stored.
- Postgres Dart Package – Used to connect PostgreSQL to Flutter.

## 🧩 Main Modules
- Login & Register: User login and registration procedures
- Home Page: Home screen, search bar, slider and product list
- Filter Menu: Filter products by price and category
- Shopping Cart: Adding the selected products to the cart and making the payment
- User Profile: View and edit user information
- Payment: View and edit user information

## Database Schema (Summary) 
**Tables:**
- users: User information (name, password, balance, address, etc.)
- items: Product information (name, price, seller, category)
- categories: Product categories
- cart: Items in the user's cart
- purchased_items: Purchased items

## 🚀 Installation Instructions
1. Required Environment:
  - Flutter SDK must be installed
  - PostgreSQL must be installed and running
  - A database (hobby_market) must be created locally

2. Database Settings
Update the settings in the DatabaseService class for the database connection according to your environment.

3. Running the Project
flutter pub get
flutter run
