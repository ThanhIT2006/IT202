create database ss6_bt1;
use ss6_bt1;
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

select o.*, c.full_name from orders o
join customers c on o.customer_id = c.customer_id;

select c.*, count(o.order_id) from customers c
left join orders o on c.customer_id = o.customer_id
group by c.customer_id;

select c.*, count(o.order_id) from customers c
join orders o on c.customer_id = o.customer_id
group by c.customer_id
having count(o.order_id) >= 1;


