select * from users
where hometown = 'hà nội';

explain analyze select * from users
where hometown = 'hà nội';

create index idx_hometown on users (hometown);

explain analyze select * from users
where hometown = 'hà nội';

drop index idx_hometown on users;