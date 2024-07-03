USE cafe;

CREATE TABLE board_comments (
    comment_id INT AUTO_INCREMENT PRIMARY KEY,
    board_id INT NOT NULL,
    user_id VARCHAR(10) NOT NULL,
    comment_text TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (board_id) REFERENCES board(num),
    FOREIGN KEY (user_id) REFERENCES member(id)
) DEFAULT CHARSET=utf8;