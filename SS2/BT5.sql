create database ss2_bt5;
use ss2_bt5;
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
);
create table lecturer(
	lecturer_id int primary key auto_increment,
    lecturer_name varchar(30) not null,
    email varchar(40) 
);
alter table subjects
add column lecturer_id int,
add foreign key(lecturer_id) references lecturer(lecturer_id);

create table score (
    student_id int,
    subject_id int,
    diem_qua_trinh float check (diem_qua_trinh between 0 and 10),
    diem_cuoi_ky float check (diem_cuoi_ky between 0 and 10),
    primary key (student_id, subject_id),
    foreign key (student_id) references student(student_id),
    foreign key (subject_id) references subjects(subject_id)
);

