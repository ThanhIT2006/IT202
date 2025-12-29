create database SS3_BT2;
use SS3_BT2;
create table student(
	student_id int primary key,
    full_name varchar(20),
    date_of_birth date,
    email varchar(40) unique
);

insert into student(student_id,full_name,date_of_birth,email)
value(1,'Nguyen Van A','2000-01-01','NguyenVanA@gmail.com'),
(2,'Nguyen Van B','2000-02-02','NguyenVanB@gmail.com'),
(3,'Nguyen Van C','2000-03-03','NguyenVanC@gmail.com'),
(4,'Nguyen Van D','2000-04-04','NguyenVanD@gmail.com'),
(5,'Nguyen Van E','2000-05-05','NguyenVanE@gmail.com');

select * from student;

select student_id, full_name from student;

update student
set email='NguyenVanCCapNhat@gmail.com'
where student_id = 3;

update student
set date_of_birth='2000-12-12'
where student_id = 2;

delete from student
where student_id = 5;

select * from student;
