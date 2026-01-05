create database ss6_bt4;
use ss6_bt4;
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL,
    price DECIMAL(10,2) NOT NULL
);
CREATE TABLE order_items (
    order_id INT PRIMARY KEY,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);
INSERT INTO products (product_id, product_name, price) VALUES
(1, 'Laptop Dell XPS 13', 25000000),
(2, 'iPhone 15 Pro', 30000000),
(3, 'Tai nghe Sony WH-1000XM5', 8000000),
(4, 'Chuột Logitech MX Master 3', 2500000),
(5, 'Màn hình LG UltraWide 34"', 15000000);

INSERT INTO order_items (order_id, product_id, quantity) VALUES
(101, 1, 5),
(102, 2, 3),
(103, 3, 10),
(104, 4, 20),
(105, 5, 2);

SELECT p.*, SUM(o.quantity) FROM products p 
JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY p.product_id;

SELECT p.*, SUM(o.quantity * p.price) FROM products p
JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY p.product_id;

SELECT p.*, SUM(oi.quantity * p.price) FROM products p
JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY p.product_id, p.product_name
HAVING SUM(oi.quantity * p.price) > 5000000;