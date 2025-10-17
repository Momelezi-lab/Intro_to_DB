-- ==========================================
-- ALX Online Bookstore Database
-- ==========================================

-- 1. Create Database
CREATE DATABASE IF NOT EXISTS alx_book_store;
USE alx_book_store;

-- 2. Authors Table
CREATE TABLE IF NOT EXISTS Authors (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    author_name VARCHAR(215) NOT NULL
);

-- 3. Books Table
CREATE TABLE IF NOT EXISTS Books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(130) NOT NULL,
    author_id INT NOT NULL,
    price DOUBLE NOT NULL,
    publication_date DATE,
    FOREIGN KEY (author_id) REFERENCES Authors(author_id)
);

-- 4. Customers Table
CREATE TABLE IF NOT EXISTS Customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(215) NOT NULL,
    email VARCHAR(215) NOT NULL UNIQUE,
    address TEXT
);

-- 5. Orders Table
CREATE TABLE IF NOT EXISTS Orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date DATE NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

-- 6. Order_Details Table
CREATE TABLE IF NOT EXISTS Order_Details (
    orderdetailid INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    book_id INT NOT NULL,
    quantity DOUBLE NOT NULL,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (book_id) REFERENCES Books(book_id)
);

-- 7. Sample Data (Optional)
INSERT INTO Authors (author_name) VALUES 
('J.K. Rowling'),
('George R.R. Martin'),
('J.R.R. Tolkien');

INSERT INTO Books (title, author_id, price, publication_date) VALUES
('Harry Potter and the Sorcerer''s Stone', 1, 29.99, '1997-06-26'),
('A Game of Thrones', 2, 39.99, '1996-08-06'),
('The Hobbit', 3, 25.50, '1937-09-21');

INSERT INTO Customers (customer_name, email, address) VALUES
('Alice Johnson', 'alice@example.com', '123 Main St, Cape Town, South Africa'),
('Bob Smith', 'bob@example.com', '456 Elm St, Johannesburg, South Africa');

INSERT INTO Orders (customer_id, order_date) VALUES
(1, '2025-10-01'),
(2, '2025-10-05');

INSERT INTO Order_Details (order_id, book_id, quantity) VALUES
(1, 1, 2),
(1, 3, 1),
(2, 2, 1);

