create database ss6_bt3;
use ss6_bt3;
create table customers(
	customer_id int primary key,
    full_name varchar(255),
    city varchar(255)
);
create table orders(
	order_id int primary key,
    customer_id int,
    order_date date,
    status enum('pending','completed','cancelled'),
	foreign key (customer_id) references customers(customer_id)
);
insert into customers (customer_id, full_name, city) value
(1, 'Nguyen Van An', 'Ha Noi'),
(2, 'Tran Thi Binh', 'Da Nang'),
(3, 'Le Van Cuong', 'Ho Chi Minh'),
(4, 'Pham Thi Dao', 'Ha Noi'),
(5, 'Hoang Van Em', 'Can Tho');

insert into orders (order_id, customer_id, order_date, status) value
(101, 1, '2025-01-01', 'completed'),
(102, 1, '2025-01-03', 'completed'),
(103, 2, '2025-01-04', 'pending'),
(104, 3, '2025-01-05', 'completed'),
(105, 4, '2025-01-06', 'cancelled');

alter table orders 
add total_amount decimal(10,2);

update orders 
set total_amount = 1500000 
where order_id = 101;
update orders 
set total_amount = 2300000 
where order_id = 102;
update orders 
set total_amount = 800000  
where order_id = 103;
update orders 
set total_amount = 3200000 
where order_id = 104;
update orders 
set total_amount = 1200000 
where order_id = 105;

SELECT order_date, SUM(total_amount) FROM orders
GROUP BY order_date;

SELECT order_date, COUNT(order_id) FROM orders
GROUP BY order_date;

SELECT order_date, SUM(total_amount), COUNT(order_id) FROM orders
GROUP BY order_date
HAVING SUM(total_amount) > 10000000;