-- 4) kiểm tra kế hoạch thực thi trước khi có chỉ mục
explain analyze select u.user_id, u.username, p.post_id, p.content from users u
join posts p on p.user_id = u.user_id
where u.hometown = 'Hà Nội'
order by u.username desc
limit 10;

create index idx_hometown on users (hometown);

explain analyze select u.user_id, u.username, p.post_id, p.content from users u
join posts p on p.user_id = u.user_id
where u.hometown = 'Hà Nội'
order by u.username desc
limit 10;

select u.user_id, u.username, p.post_id, p.content from users u
join posts p on p.user_id = u.user_id
where u.hometown = 'Hà Nội'
order by u.username desc
limit 10;