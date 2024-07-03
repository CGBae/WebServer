use cafe;

CREATE TABLE likes (
    article_id VARCHAR(50),
    user_id VARCHAR(50),
    likes_count INT DEFAULT 0,
    PRIMARY KEY (article_id, user_id)
)default CHARSET=utf8;

desc likes;

drop table likes;

select * from likes;