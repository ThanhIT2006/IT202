create table post_history (
    history_id int primary key auto_increment,
    post_id int,
    old_content text,
    new_content text,
    changed_at datetime,
    changed_by_user_id int,
    foreign key (post_id) references posts(post_id)
);

insert into posts (user_id, content, created_at) values
(1, 'alice original post for history test', '2025-01-14 09:00:00');

delimiter //
create trigger before_post_update
before update on posts
for each row
begin
    if old.content <> new.content then
        insert into post_history (post_id, old_content, new_content, changed_at, changed_by_user_id)
        values (old.post_id, old.content, new.content, now(), old.user_id);
    end if;
end //
delimiter ;

update posts
set content = 'alice updated her post content'
where post_id = 6; 

update posts
set content = 'bob updated his first post'
where post_id = 3; 

select * from post_history;

insert into likes (user_id, post_id, liked_at) values (2, 6, now());

select * from posts where post_id = 6;

select * from user_statistics;