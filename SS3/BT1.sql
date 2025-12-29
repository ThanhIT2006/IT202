create database SS3_BT1;
use SS3_BT1;
create table student(
	student_id int primary key,
    full_name varchar(20),
    date_of_birth date,
    email varchar(40) unique
);

insert into student(student_id,full_name,date_of_birth,email)
value(1,'Nguyen Van A','2000-01-01','NguyenVanA@gmail.com'),
(2,'Nguyen Van B','2000-02-02','NguyenVanB@gmail.com'),
(3,'Nguyen Van C','2000-03-03','NguyenVanC@gmail.com');

select * from student;

select student_id, full_name from student;