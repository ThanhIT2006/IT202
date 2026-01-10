create index idx_user_gender on users (gender);

create view view_popular_posts as
select p.post_id, u.username, p.content, count(distinct l.user_id) as total_likes, count(distinct c.comment_id) as total_comments from posts p
join users u on u.user_id = p.user_id
join likes l on l.post_id = p.post_id
join comments c on c.post_id = p.post_id
group by p.post_id;

select post_id, username, content, total_likes, total_comments
from view_popular_posts;

select post_id, username, content, total_likes, total_comments, (total_likes + total_comments) from view_popular_posts
where (total_likes + total_comments) > 10
order by (total_likes + total_comments) desc;