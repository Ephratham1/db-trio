--Create database--
CREATE DATABASE bookstore;

--Use bookstore db--
USE bookstore;
--create book language table--
CREATE TABLE book_language (
    language_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);
--create publisher table
CREATE TABLE publisher (
    publisher_id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);
-- Create book table --
CREATE TABLE book (
    book_id INT PRIMARY KEY,
    title VARCHAR(250) NOT NULL,
    isbn VARCHAR(30) UNIQUE,
    language_id INT,
    publisher_id INT,
    publish_year INT,
    price DECIMAL(10,2)
);
--create author table--
CREATE TABLE author (
    author_id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);
--create book_author table--
CREATE TABLE book_author (
    book_id INT,
    author_id INT,
    PRIMARY KEY (book_id, author_id),
    FOREIGN KEY (book_id) REFERENCES book(book_id),
    FOREIGN KEY (author_id) REFERENCES author(author_id)
);
--create country table--
CREATE TABLE country (
    country_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);
--create address table--
CREATE TABLE address (
    address_id INT PRIMARY KEY,
    street VARCHAR(255) NOT NULL,
    city VARCHAR(100),
    state VARCHAR(100),
    zip_code VARCHAR(20),
    country_id INT,
    FOREIGN KEY (country_id) REFERENCES country(country_id)
);
--create address_status table--
CREATE TABLE address_status (
    status_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

CREATE TABLE customer (
    customer_id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255),
    phone VARCHAR(20)
);

CREATE TABLE customer_address (
    customer_id INT,
    address_id INT,
    status_id INT,
    PRIMARY KEY (customer_id, address_id),
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    FOREIGN KEY (address_id) REFERENCES address(address_id),
    FOREIGN KEY (status_id) REFERENCES address_status(status_id)
);
CREATE TABLE shipping_method (
    shipping_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    cost DECIMAL(10,2)
);

CREATE TABLE order_status (
    status_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

CREATE TABLE cust_order (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    shipping_id INT,
    status_id INT,
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    FOREIGN KEY (shipping_id) REFERENCES shipping_method(shipping_id),
    FOREIGN KEY (status_id) REFERENCES order_status(status_id)
);

CREATE TABLE order_line (
    order_id INT,
    book_id INT,
    quantity INT,
    line_price DECIMAL(10,2),
    PRIMARY KEY (order_id, book_id),
    FOREIGN KEY (order_id) REFERENCES cust_order(order_id),
    FOREIGN KEY (book_id) REFERENCES book(book_id)
);

CREATE TABLE order_history (
    history_id INT PRIMARY KEY,
    order_id INT,
    status_id INT,
    updated_at DATETIME,
    FOREIGN KEY (order_id) REFERENCES cust_order(order_id),
    FOREIGN KEY (status_id) REFERENCES order_status(status_id)
);

