create database SS5_BT4;
use SS5_BT4;
CREATE TABLE products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(255),
    price DECIMAL(10,2),
    stock INT,
    status enum('ACTIVE','INACTIVE')
);

insert into Products(product_name,price,stock,status)
value('Laptop', 1500000, 10, 'ACTIVE'),
('Mouse', 2000000, 100, 'ACTIVE'),
('Keyboard', 500000, 50, 'ACTIVE'),
('Monitor', 30000000, 20, 'ACTIVE'),
('Printer', 2000000, 0, 'INACTIVE'),
('USB Cable', 100000, 200, 'ACTIVE'),
('Webcam', 8000000, 15, 'ACTIVE'),
('Headphone', 1200000, 0, 'INACTIVE'),
('Tablet', 6000000, 8, 'ACTIVE'),
('Speaker', 1500000, 12, 'ACTIVE');

select * from Products;

select * from products
where status='active';

select * from products
where price > 1000000;

select * from products
where status='active'
order by price ASC;

alter table products
add column sold_quantity int;

UPDATE products SET sold_quantity = 50 WHERE product_name = 'Laptop';
UPDATE products SET sold_quantity = 120 WHERE product_name = 'Mouse';
UPDATE products SET sold_quantity = 80 WHERE product_name = 'Keyboard';
UPDATE products SET sold_quantity = 30 WHERE product_name = 'Monitor';
UPDATE products SET sold_quantity = 5 WHERE product_name = 'Printer';
UPDATE products SET sold_quantity = 200 WHERE product_name = 'USB Cable';
UPDATE products SET sold_quantity = 60 WHERE product_name = 'Webcam';
UPDATE products SET sold_quantity = 10 WHERE product_name = 'Headphone';
UPDATE products SET sold_quantity = 40 WHERE product_name = 'Tablet';
UPDATE products SET sold_quantity = 70 WHERE product_name = 'Speaker';

select * from products
order by sold_quantity desc
limit 10;

select * from products
order by sold_quantity desc
limit 5 offset 10;



