create database ss2_bt2;
use ss2_bt2;
create table student(
	student_id int primary key auto_increment,
    full_name varchar(30) not null
);
create table subjects(
	subject_id int primary key auto_increment,
    subject_name varchar(30) not null,
    credit_number int check(credit_number >0)
);