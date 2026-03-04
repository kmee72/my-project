CREATE DATABASE IF NOT EXISTS vm2;
USE vm2;

CREATE TABLE product (
                         product_no INT AUTO_INCREMENT PRIMARY KEY,
                         product_name VARCHAR(255) NOT NULL,
                         product_price INT NOT NULL,
                         product_limit_date DATE DEFAULT (CURRENT_DATE)
);