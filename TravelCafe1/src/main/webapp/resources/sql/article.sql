USE cafe;

CREATE TABLE IF NOT EXISTS article(
	a_id VARCHAR(10) NOT NULL,
	a_name VARCHAR(20),
	a_writer VARCHAR(20),
	a_description TEXT,
	a_releaseDate VARCHAR(20),
	a_filename VARCHAR(20),
	PRIMARY KEY (a_id)
); default CHARSET=utf8