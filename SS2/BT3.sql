create database ss2_bt3;
use ss2_bt3;
create table student(
	student_id int primary key auto_increment,
    full_name varchar(30) not null
);
create table subjects(
	subject_id int primary key auto_increment,
    subject_name varchar(30) not null,
    credit_number int check(credit_number >0)
);
create table enrollment(
	student_id int,
    subject_id int,
    enroll_date date,
    foreign key(student_id) references student(student_id),
    foreign key(subject_id) references subjects(subject_id)
)