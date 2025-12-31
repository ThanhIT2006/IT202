create database SS5_BT2;
use SS5_BT2;
CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(255),
    email VARCHAR(255),
	city VARCHAR(255),
    status enum('ACTIVE','INACTIVE')
);
INSERT INTO customers (full_name, email, city, status) 
VALUES('Nguyen Van An', 'an.nguyen@gmail.com', 'Hà Nội', 'ACTIVE'),
('Tran Thi Binh', 'binh.tran@gmail.com', 'TP.HCM', 'ACTIVE'),
('Le Minh Chau', 'chau.le@gmail.com', 'Đà Nẵng', 'ACTIVE'),
('Pham Quoc Dung', 'dung.pham@gmail.com', 'Hải Phòng', 'INACTIVE'),
('Vo Thi Hoa', 'hoa.vo@gmail.com', 'TP.HCM', 'ACTIVE'),
('Dang Van Kien', 'kien.dang@gmail.com', 'Huế', 'INACTIVE'),
('Bui Thi Lan', 'lan.bui@gmail.com', 'Nha Trang', 'ACTIVE'),
('Do Thanh Minh', 'minh.do@gmail.com', 'Vũng Tàu', 'ACTIVE'),
('Hoang Van Nam', 'nam.hoang@gmail.com', 'Biên Hòa', 'INACTIVE'),
('Nguyen Thi Phuong', 'phuong.nguyen@gmail.com', 'TP.HCM', 'ACTIVE');


select * from customers;

select * from customers
where city like '%TP.HCM%';

select * from customers
where status='active' and city ='Hà Nội';

select * from customers
order by full_name ASC;

