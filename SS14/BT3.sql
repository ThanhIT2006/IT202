use social_network;

create table followers (
    follower_id int not null,
    followed_id int not null,
    primary key (follower_id, followed_id),
    foreign key (follower_id) references users(user_id),
    foreign key (followed_id) references users(user_id)
);

alter table users
add column following_count int default 0;
alter table users 
add column followers_count int default 0;

create table follow_log (
    log_id int primary key auto_increment,
    follower_id int,
    error_message varchar(255),
    created_at datetime default current_timestamp
);

delimiter //
create procedure sp_follow_user (in p_follower_id int, in p_followed_id int)
begin
    start transaction;

    if not exists (select 1 from users where user_id = p_follower_id)
       or not exists (select 1 from users where user_id = p_followed_id) then
        insert into follow_log (follower_id, followed_id, error_message)
        values (p_follower_id, p_followed_id, 'mot trong hai user khong ton tai');
        rollback;
    else
        if p_follower_id = p_followed_id then
            insert into follow_log (follower_id, followed_id, error_message)
            values (p_follower_id, p_followed_id, 'khong the tu follow chinh minh');
            rollback;
        else
            if exists (select 1 from followers where follower_id = p_follower_id and followed_id = p_followed_id) then
                insert into follow_log (follower_id, followed_id, error_message)
                values (p_follower_id, p_followed_id, 'da follow truoc do');
                rollback;
            else
                insert into followers (follower_id, followed_id)
                values (p_follower_id, p_followed_id);

                update users set following_count = following_count + 1
                where user_id = p_follower_id;

                update users set followers_count = followers_count + 1
                where user_id = p_followed_id;

                commit;
            end if;
        end if;
    end if;
end//
delimiter ;

call sp_follow_user(1, 2);

call sp_follow_user(1, 1);

call sp_follow_user(1, 999);

call sp_follow_user(1, 2);