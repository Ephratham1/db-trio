--use database 
USE bookstore;

-- Create roles
CREATE ROLE 'admin';
CREATE ROLE 'data_entry';
CREATE ROLE 'viewer';
CREATE ROLE 'report_user';
CREATE ROLE 'popup_agent';

-- Grant privileges
GRANT ALL PRIVILEGES ON bookstore.* TO 'admin';

GRANT SELECT, INSERT, UPDATE ON bookstore.customer TO 'data_entry';
GRANT SELECT, INSERT, UPDATE ON bookstore.cust_order TO 'data_entry';

GRANT SELECT ON bookstore.* TO 'viewer';
GRANT SELECT ON bookstore.customer,bookstore.cust_order, bookstore.order_history TO 'report_user';

GRANT SELECT, INSERT ON bookstore.outreach_table TO 'popup_agent'; -- example table

--create user 1
CREATE USER 'Xolani'@'localhost' IDENTIFIED BY 'Password123!';
--create user 1
CREATE USER 'Anne'@'localhost' IDENTIFIED BY 'Password456!';
--create user 1
CREATE USER 'Joshua'@'localhost' IDENTIFIED BY 'Password789!';
--grant role
GRANT 'admin' TO 'Xolani'@'localhost';
