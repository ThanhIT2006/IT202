create view view_user_post as
select  u.user_id, count(p.post_id) as total_user_post from users u
join posts p on u.user_id = p.user_id
group by u.user_id;

select * from view_user_post;

select u.full_name, v.total_user_post from users u
join view_user_post v on u.user_id = v.user_id;

