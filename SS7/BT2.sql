create database ss7_BT2;
use ss7_BT2;

create table products (
    id int primary key auto_increment,
    name varchar(100),
    price decimal(10,2) 
);

create table order_items (
    order_id int,
    product_id int,
    quantity int 
);

insert into products (name, price) values
('iphone 15', 25000000),
('samsung galaxy s24', 22000000),
('macbook air m2', 30000000),
('ipad pro', 27000000),
('airpods pro', 6000000),
('apple watch', 12000000),
('sony headphones', 5000000);

insert into order_items (order_id, product_id, quantity) values
(1, 1, 2),
(1, 5, 1),
(2, 2, 1),
(2, 6, 1),
(3, 3, 1),
(4, 4, 2),
(5, 7, 3);

select * from products 
where id in (select product_id from order_items);
