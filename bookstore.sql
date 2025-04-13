--Create database--
CREATE DATABASE bookstore;

--Use bookstore db--
USE bookstore;
--Book language table--
CREATE TABLE book_language (
    language_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);
--inserting data into book language table 
INSERT INTO book_language (language_id, name) VALUES
(1, 'English'),
(2, 'Spanish'),
(3, 'French'),
(4, 'German'),
(5, 'Chinese'),
(6, 'Japanese'),
(7, 'Russian'),
(8, 'Arabic'),
(9, 'Portuguese'),
(10, 'Hindi');
insert into publisher(publisher_id,name) VALUES
("1", "")
--Publisher table
CREATE TABLE publisher (
    publisher_id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);
--insert data into punlisher table 
INSERT INTO publisher (publisher_id, name) VALUES
(1, 'Penguin Random House'),
(2, 'HarperCollins'),
(3, 'Macmillan Publishers'),
(4, 'Simon & Schuster'),
(5, 'Hachette Livre'),
(6, 'Scholastic'),
(7, 'Pearson'),
(8, 'Wiley'),
(9, 'Oxford University Press'),
(10, 'Cambridge University Press');

-- Book table --
CREATE TABLE book (
    book_id INT PRIMARY KEY,
    title VARCHAR(250) NOT NULL,
    isbn VARCHAR(30) UNIQUE,
    language_id INT,
    publisher_id INT,
    publish_year INT,
    price DECIMAL(10,2)
);
--book table data rows
INSERT INTO book (book_id, title, isbn, language_id, publisher_id, publish_year, price) VALUES
(1, 'American Gods', '9780062472106', 1, 1, 2001, 14.99),
(2, 'The Handmaid''s Tale', '9780385490818', 2, 2, 1985, 12.95),
(3, 'Never Let Me Go', '9781400078776', 3, 3, 2005, 11.99),
(4, 'The House of the Spirits', '9780553383805', 4, 4, 1982, 13.50),
(5, 'Half of a Yellow Sun', '9781400095209', 5, 5, 2006, 10.99),
(6, 'Sapiens', '9780062316097', 6, 6, 2011, 16.00),
(7, 'The Underground Railroad', '9780385542364', 7, 7, 2016, 13.95),
(8, 'Normal People', '9781984822178', 8, 8, 2018, 9.75),
(9, 'The Kite Runner', '9781594631931', 9, 9, 2003, 12.00),
(10, 'The Goldfinch', '9780316055444', 10, 10, 2013, 15.00);

--Author table--
CREATE TABLE author (
    author_id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

--inserting data into author table 
INSERT INTO author (author_id, name) VALUES
(1, 'George Orwell'),
(2, 'Jane Austen'),
(3, 'Mark Twain'),
(4, 'J.K. Rowling'),
(5, 'Agatha Christie'),
(6, 'Ernest Hemingway'),
(7, 'Stephen King'),
(8, 'Leo Tolstoy'),
(9, 'Gabriel García Márquez'),
(10, 'Haruki Murakami');
--Book_author table--
CREATE TABLE book_author (
    book_id INT,
    author_id INT,
    PRIMARY KEY (book_id, author_id),
    FOREIGN KEY (book_id) REFERENCES book(book_id),
    FOREIGN KEY (author_id) REFERENCES author(author_id)
);
--inserting data into book author table 
INSERT INTO book_author (book_id, author_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);
--Country table--
CREATE TABLE country (
    country_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);
INSERT INTO country (country_id, name) VALUES
(1, 'Norway'),
(2, 'South Africa'),
(3, 'Mexico'),
(4, 'South Korea'),
(5, 'Ireland'),
(6, 'New Zealand'),
(7, 'China'),
(8, 'Denmark'),
(9, 'Colombia'),
(10, 'Egypt');
--Address table--
CREATE TABLE address (
    address_id INT PRIMARY KEY,
    street VARCHAR(255) NOT NULL,
    city VARCHAR(100),
    state VARCHAR(100),
    zip_code VARCHAR(20),
    country_id INT,
    FOREIGN KEY (country_id) REFERENCES country(country_id)
);
--address data rows
INSERT INTO address (address_id, street, city, state, zip_code, country_id) VALUES
(1, '18 Fjordgate', 'Oslo', '', '0250', 1),
(2, '22 Long St', 'Cape Town', '', '8001', 2),
(3, '15 Reforma Ave', 'Mexico City', '', '06600', 3),
(4, '88 Itaewon-ro', 'Seoul', '', '04350', 4),
(5, '13 St. Stephen''s Green', 'Dublin', '', 'D02', 5),
(6, '101 Queen St', 'Auckland', '', '1010', 6),
(7, '66 Wudaokou', 'Beijing', '', '100084', 7),
(8, '12 Nyhavn', 'Copenhagen', '', '1051', 8),
(9, '20 Carrera 7', 'Bogotá', '', '110311', 9),
(10, '5 Tahrir Square', 'Cairo', '', '11511', 10);
--Address_status table--
CREATE TABLE address_status (
    status_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);
--Drder status data rows
INSERT INTO address_status (status_id, name) VALUES
(1, 'Main'),
(2, 'Backup'),
(3, 'Registered'),
(4, 'Unverified'),
(5, 'Preferred'),
(6, 'Non-Primary'),
(7, 'Legacy'),
(8, 'Updated'),
(9, 'Archived'),
(10, 'Current');
--Customer table 
CREATE TABLE customer (
    customer_id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255),
    phone VARCHAR(20)
);
--Customer data rows
INSERT INTO customer (customer_id, name, email, phone) VALUES
(1, 'Laura Wells', 'laura.w@example.com', '444-1100'),
(2, 'Marcus Reid', 'marcus.r@example.com', '444-2200'),
(3, 'Tina Chen', 'tina.c@example.com', '444-3300'),
(4, 'Omar Farouk', 'omar.f@example.com', '444-4400'),
(5, 'Lina Gomez', 'lina.g@example.com', '444-5500'),
(6, 'Victor Lam', 'victor.l@example.com', '444-6600'),
(7, 'Sara Park', 'sara.p@example.com', '444-7700'),
(8, 'Felix Morgan', 'felix.m@example.com', '444-8800'),
(9, 'Nina Patel', 'nina.p@example.com', '444-9900'),
(10, 'David Kim', 'david.k@example.com', '444-0011');

--Customer address table 
CREATE TABLE customer_address (
    customer_id INT,
    address_id INT,
    status_id INT,
    PRIMARY KEY (customer_id, address_id),
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    FOREIGN KEY (address_id) REFERENCES address(address_id),
    FOREIGN KEY (status_id) REFERENCES address_status(status_id)
);
--Customer address data table 
INSERT INTO customer_address (customer_id, address_id, status_id) VALUES
(1, 1, 10),
(2, 2, 9),
(3, 3, 8),
(4, 4, 7),
(5, 5, 6),
(6, 6, 5),
(7, 7, 4),
(8, 8, 3),
(9, 9, 2),
(10, 10, 1);

--Shipping method table 
CREATE TABLE shipping_method (
    shipping_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    cost DECIMAL(10,2)
);
--shipping method data 
INSERT INTO shipping_method (shipping_id, name, cost) VALUES
(1, 'Standard Shipping', 4.99),
(2, 'Express Shipping', 9.99),
(3, 'Overnight Shipping', 19.99),
(4, 'Two-Day Shipping', 7.99),
(5, 'Pickup In-Store', 0.00),
(6, 'International Standard', 14.99),
(7, 'International Express', 29.99),
(8, 'Drone Delivery', 24.99),
(9, 'Weekend Delivery', 11.99),
(10, 'Eco Shipping', 5.49);

--Order status table 
CREATE TABLE order_status (
    orderstatus_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);
--order status table data
INSERT INTO order_status (status_id, name) VALUES
(1, 'Order Placed'),
(2, 'Processing'),
(3, 'Shipped'),
(4, 'Delivered'),
(5, 'Cancelled'),
(6, 'Returned'),
(7, 'On Hold'),
(8, 'Failed Payment'),
(9, 'Refunded'),
(10, 'Out for Delivery');


--Customer order table 
CREATE TABLE cust_order (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    shipping_id INT,
    orderstatus_id INT,
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    FOREIGN KEY (shipping_id) REFERENCES shipping_method(shipping_id),
    FOREIGN KEY (orderstatus_id) REFERENCES order_status(orderstatus_id)
);
--customer order table data 
INSERT INTO cust_order (order_id, customer_id, order_date, shipping_id, status_id) VALUES
(1, 1, '2025-04-01', 1, 4),  -- Delivered
(2, 2, '2025-04-02', 2, 3),  -- Shipped
(3, 3, '2025-04-03', 3, 5),  -- Cancelled
(4, 4, '2025-04-04', 4, 4),  -- Delivered
(5, 5, '2025-04-05', 5, 4),  -- Delivered
(6, 6, '2025-04-06', 6, 3),  -- Shipped
(7, 7, '2025-04-07', 7, 6),  -- Returned
(8, 8, '2025-04-08', 8, 3),  -- Shipped
(9, 9, '2025-04-09', 9, 2),  -- Processing
(10, 10, '2025-04-10', 10, 4);  -- Delivered
--Order line table 
CREATE TABLE order_line (
    order_id INT,
    book_id INT,
    quantity INT,
    line_price DECIMAL(10,2),
    PRIMARY KEY (order_id, book_id),
    FOREIGN KEY (order_id) REFERENCES cust_order(order_id),
    FOREIGN KEY (book_id) REFERENCES book(book_id)
);
--order line table data
INSERT INTO order_line (order_id, book_id, quantity, line_price) VALUES
(1, 1, 1, 14.99),   -- American Gods
(1, 2, 1, 12.95),   -- The Handmaid's Tale
(2, 3, 2, 23.98),   -- Never Let Me Go
(3, 4, 1, 13.50),   -- The House of the Spirits
(3, 5, 2, 21.98),   -- Half of a Yellow Sun
(4, 6, 1, 16.00),   -- Sapiens
(5, 7, 1, 13.95),   -- The Underground Railroad
(6, 8, 2, 19.50),   -- Normal People
(7, 9, 2, 24.00),   -- The Kite Runner
(8, 10, 1, 15.00);
--Order history table 
CREATE TABLE order_history (
    history_id INT PRIMARY KEY,
    order_id INT,
    orderstatus_id INT,
    updated_at DATETIME,
    FOREIGN KEY (order_id) REFERENCES cust_order(order_id),
    FOREIGN KEY (orderstatus_id) REFERENCES order_status(orderstatus_id)
);
--order history data table row
INSERT INTO order_history (history_id, order_id, status_id, updated_at) VALUES
(1, 1, 1, '2025-04-01 09:00:00'),  -- Order Placed
(2, 1, 2, '2025-04-01 12:00:00'),  -- Processing
(3, 1, 3, '2025-04-02 08:30:00'),  -- Shipped
(4, 1, 4, '2025-04-03 14:00:00'),  -- Delivered
(5, 2, 1, '2025-04-02 10:15:00'),  -- Order Placed
(6, 2, 2, '2025-04-02 13:45:00'),  -- Processing
(7, 2, 3, '2025-04-03 09:20:00'),  -- Shipped
(8, 3, 1, '2025-04-03 11:00:00'),  -- Order Placed
(9, 3, 5, '2025-04-04 15:00:00'),  -- Cancelled
(10, 4, 1, '2025-04-04 08:00:00'); -- Order Placed
