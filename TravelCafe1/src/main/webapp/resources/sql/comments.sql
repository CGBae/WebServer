USE cafe;

CREATE TABLE comments (
    comment_id INT AUTO_INCREMENT PRIMARY KEY,
    article_id VARCHAR(50),
    user_name VARCHAR(50),
    comment_text TEXT,
    comment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
)default CHARSET=utf8;