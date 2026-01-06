create database ss7_BT3;
use ss7_BT3;

create table customers (
    customer_id int primary key auto_increment,
    name varchar(100),
    email varchar(100) 
);

create table orders (
    order_id int primary key auto_increment,
    customer_id int,
    order_date date,
    total_amount decimal(10,2),
    foreign key (customer_id) references customers(customer_id)
);

insert into customers (name, email) values
('nguyen van a', 'a@example.com'),
('tran thi b', 'b@example.com'),
('le van c', 'c@example.com'),
('pham thi d', 'd@example.com'),
('hoang van e', 'e@example.com'),
('do thi f', 'f@example.com'),
('vu van g', 'g@example.com');

insert into orders (customer_id, order_date, total_amount) values
(1, '2026-01-01', 500000),
(2, '2026-01-02', 750000),
(3, '2026-01-03', 1200000),
(1, '2026-01-04', 300000),
(4, '2026-01-05', 950000),
(5, '2026-01-06', 1500000),
(2, '2026-01-06', 450000);

select * from orders
where total_amount > (select avg(total_amount) from orders);
