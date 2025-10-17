-- =====================================
-- Database: alx_book_store
-- Description: Online Bookstore Database
-- =====================================

-- Drop database if it exists
DROP DATABASE IF EXISTS alx_book_store;

-- Create the database
CREATE DATABASE alx_book_store;

-- Use the database
USE alx_book_store;

-- ================================
-- Table: Authors
-- ================================
CREATE TABLE Authors (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    author_name VARCHAR(215) NOT NULL
);

-- ================================
-- Table: Books
-- ================================
CREATE TABLE Books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(130) NOT NULL,
    author_id INT NOT NULL,
    price DOUBLE NOT NULL,
    publication_date DATE,
    CONSTRAINT fk_author
        FOREIGN KEY (author_id)
        REFERENCES Authors(author_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- ================================
-- Table: Customers
-- ================================
CREATE TABLE Customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(215) NOT NULL,
    email VARCHAR(215) NOT NULL UNIQUE,
    address TEXT
);

-- ================================
-- Table: Orders
-- ================================
CREATE TABLE Orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date DATE NOT NULL,
    CONSTRAINT fk_customer
        FOREIGN KEY (customer_id)
        REFERENCES Customers(customer_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- ================================
-- Table: Order_Details
-- ================================
CREATE TABLE Order_Details (
    orderdetailid INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    book_id INT NOT NULL,
    quantity DOUBLE NOT NULL,
    CONSTRAINT fk_order
        FOREIGN KEY (order_id)
        REFERENCES Orders(order_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    CONSTRAINT fk_book
        FOREIGN KEY (book_id)
        REFERENCES Books(book_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- ================================
-- Sample Data (Optional)
-- ================================

-- Authors
INSERT INTO Authors (author_name) VALUES 
('J.K. Rowling'),
('George R.R. Martin'),
('J.R.R. Tolkien');

-- Books
INSERT INTO Books (title, author_id, price, publication_date) VALUES
('Harry Potter and the Sorcerer''s Stone', 1, 29.99, '1997-06-26'),
('A Game of Thrones', 2, 39.99, '1996-08-06'),
('The Hobbit', 3, 25.50, '1937-09-21');

-- Customers
INSERT INTO Customers (customer_name, email, address) VALUES
('Alice Johnson', 'alice@example.com', '123 Main St, Cape Town, South Africa'),
('Bob Smith', 'bob@example.com', '456 Elm St, Johannesburg, South Africa');

-- Orders
INSERT INTO Orders (customer_id, order_date) VALUES
(1, '2025-10-01'),
(2, '2025-10-05');

-- Order_Details
INSERT INTO Order_Details (order_id, book_id, quantity) VALUES
(1, 1, 2),
(1, 3, 1),
(2, 2, 1);

