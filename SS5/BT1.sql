create database SS5_BT1;
use SS5_BT1;
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