delimiter //
create procedure calculatepostlikes(in p_post_id int, out total_likes int)
begin
    select count(*) into total_likes
    from likes
    where post_id = p_post_id;
end //
delimiter ;

set @likes_count = 0;
call calculatepostlikes(5, @likes_count);
select @likes_count as tong_like;

drop procedure if exists calculatepostlikes;