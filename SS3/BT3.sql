create database SS3_BT3;
use SS3_BT3;
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