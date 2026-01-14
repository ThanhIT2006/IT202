delimiter //
create trigger before_like_insert
before insert on likes
for each row
begin
    if new.user_id = (select user_id from posts where post_id = new.post_id) then
        signal sqlstate '45000' set message_text = 'không thể tự like bài đăng của chính mình';
    end if;
end //
delimiter ;

delimiter //
create trigger after_like_insert
after insert on likes
for each row
begin
    update posts
    set like_count = like_count + 1
    where post_id = new.post_id;
end //
delimiter ;

delimiter //
create trigger after_like_delete
after delete on likes
for each row
begin
    update posts
    set like_count = like_count - 1
    where post_id = old.post_id;
end //
delimiter ;

delimiter //
create trigger after_like_update
after update on likes
for each row
begin
    if old.post_id <> new.post_id then
        update posts
        set like_count = like_count - 1
        where post_id = old.post_id;
        update posts
        set like_count = like_count + 1
        where post_id = new.post_id;
    end if;
end //
delimiter ;

insert into likes (user_id, post_id, liked_at) values (4, 5, now());

insert into likes (user_id, post_id, liked_at) values (2, 5, now());

select * from posts where post_id = 5;

update likes set post_id = 1 where like_id = 6; 

select * from posts where post_id in (1,5);

delete from likes where like_id = 6;

select * from posts where post_id in (1,5);

select * from posts;
select * from user_statistics;
