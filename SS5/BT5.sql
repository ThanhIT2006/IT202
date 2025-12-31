create database SS5_BT5;
use SS5_BT5;

CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id int,
    total_amount decimal(10,2),
	order_date date,
    status enum('pending','completed','cancelled')
);
INSERT INTO orders (customer_id, total_amount, order_date, status) 
VALUES(1, 1500000.00, '2024-12-01', 'completed'),
(2,  750000.00, '2024-12-02', 'pending'),
(3, 23000000.50, '2024-12-03', 'completed'),
(1,  4050000.00, '2024-12-04', 'cancelled'),
(4,  5980000.00, '2024-12-05', 'completed'),
(5, 12000000.00, '2024-12-06', 'pending'),
(2,  660000.00, '2024-12-07', 'completed'),
(3, 3100000.00, '2024-12-08', 'completed'),
(4,  520000.00, '2024-12-09', 'cancelled'),
(5, 5750000.00, '2024-12-10', 'pending');

select * from orders
where status = 'completed';

select * from orders
where total_amount > 5000000;

select * from orders
order by order_date desc
limit 5;

select * from orders
where status = 'completed'
order by total_amount desc;

select * from orders
where status <> 'cancelled'
order by order_date desc
limit 5 offset 0;

select * from orders
where status <> 'cancelled'
order by order_date desc
limit 5 offset 5;

select * from orders
where status <> 'cancelled'
order by order_date desc
limit 5 offset 10;