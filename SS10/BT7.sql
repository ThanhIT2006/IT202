create view view_user_activity_status as
select u.user_id, u.username, u.gender, u.created_at,
  case 
    when exists (select 1 from posts p where p.user_id = u.user_id)
      or exists (select 1 from comments c where c.user_id = u.user_id)
    then 'Active'
    else 'Inactive'
  end status from users u;

select user_id, username, gender, created_at, status from view_user_activity_status;

select status, count(*) as user_count from view_user_activity_status
group by status
order by user_count desc;