create database SocialLab;
use SocialLab;

create table posts(
    post_id int primary key auto_increment,
    content text,
    author varchar(255),
    likes_count int default 0
);

insert into posts (content, author, likes_count) values
('Hôm nay trời thật đẹp!', 'Thanh', 5),
('Đang học MySQL, khá thú vị.', 'Minh', 3),
('Đi uống cà phê cùng bạn bè.', 'Lan', 8),
('Xem phim mới ra mắt, rất hay.', 'Huy', 12),
('Thử nấu món ăn mới.', 'Mai', 4),
('Chạy bộ buổi sáng, cảm thấy khỏe.', 'An', 6),
('Đọc sách về công nghệ.', 'Phúc', 2),
('Đi du lịch Đà Nẵng.', 'Trang', 10),
('Nghe nhạc thư giãn.', 'Quang', 7),
('Viết blog chia sẻ kinh nghiệm.', 'Hoa', 9);

delimiter //

create procedure sp_CreatePost(in sp_content text, in sp_author varchar(255), out sp_post_id int)
begin
    insert into posts(content, author) values(sp_content, sp_author);
    set sp_post_id = last_insert_id();
end //

create procedure sp_SearchPost(in search varchar(255))
begin
    select * from posts
    where content like concat('%', search, '%') or author like concat('%', search, '%');
end //

create procedure sp_IncreaseLike(in sp_post_id int, inout sp_likes int)
begin
    update posts
    set likes_count = likes_count + 1
    where post_id = sp_post_id;

    select likes_count into sp_likes
    from posts
    where post_id = sp_post_id;
end //

create procedure sp_DeletePost(in sp_post_id int)
begin
    delete from posts where post_id = sp_post_id;
end //

delimiter ;

call sp_CreatePost('Hello world!', 'Tester1', @id1);
select @id1 as NewPost1;

call sp_CreatePost('Say hello to MySQL!', 'Tester2', @id2);
select @id2 as NewPost2;

call sp_SearchPost('hello');

set @likes = 0;
select likes_count into @likes from posts where post_id = @id1;
call sp_IncreaseLike(@id1, @likes);
select @likes as UpdatedLikes;

call sp_DeletePost(@id2);

drop procedure if exists sp_CreatePost;
drop procedure if exists sp_SearchPost;
drop procedure if exists sp_IncreaseLike;
drop procedure if exists sp_DeletePost;