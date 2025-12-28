create database ss2_BT1;
use ss2_BT1;
create table class(
	class_id int primary key auto_increment,
    class_name varchar(20) not null unique,
    study_year int not null
);
create table student(
	student_id int primary key auto_increment,
    student_name varchar(30) not null,
    birth date not null,
	class_id int,
    foreign key(class_id) references class(class_id)
);
