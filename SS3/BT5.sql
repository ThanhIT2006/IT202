create database SS3_BT5;
use SS3_BT5;
create table subjects(
	subject_id int primary key,
    subject_name varchar(30),
    credit int check(credit >0)
);

insert into subjects(subject_id,subject_name,credit)
value(1,'CSDL',3),
(2,'Frontend với React',5);

update subjects
set credit=4
where subject_id = 2;

update subjects
set subject_name='Agile/scrum'
where subject_id = 2;

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

update student
set email='NguyenVanCCapNhat@gmail.com'
where student_id = 3;

update student
set date_of_birth='2000-12-12'
where student_id = 2;

delete from student
where student_id = 5;

create table enrollment (
    student_id int,
    subject_id int,
    enroll_date date,
    primary key (student_id, subject_id),
    foreign key (student_id) references student(student_id),
    foreign key (subject_id) references subjects(subject_id)
);
insert into enrollment(student_id, subject_id, enroll_date)
values
(1, 1, '2025-12-20'),
(1, 2, '2025-12-21'), 
(2, 1, '2025-12-22'); 

select * from enrollment;

select * from enrollment
where student_id = 1;

create table score (
    student_id int,
    subject_id int,
    mid_score decimal(3,1) check(mid_score >= 0 and mid_score <= 10),
    final_score decimal(3,1) check(final_score >= 0 and final_score <= 10),
    primary key (student_id, subject_id),
    foreign key (student_id) references student(student_id),
    foreign key (subject_id) references subjects(subject_id)
);

insert into score(student_id, subject_id, mid_score, final_score)
values(1, 1, 7.5, 8.0),
(1, 2, 6.0, 7.0),
(2, 1, 8.5, 9.0);

update score
set final_score = 8.5
where student_id = 1 and subject_id = 2;

select * from score;

select student_id, subject_id, final_score
from score
where final_score >= 8;