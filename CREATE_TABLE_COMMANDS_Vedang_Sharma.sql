	USE blog_website;	

	CREATE TABLE photo(
	photo_id INT AUTO_INCREMENT NOT NULL,
	file_name varchar(250) NOT NULL,
	created_date DATETIME NOT NULL DEFAULT NOW(),
	caption varchar(500),
	CONSTRAINT PK_photo PRIMARY KEY (photo_id)
	);

	CREATE TABLE person(
	person_id INT AUTO_INCREMENT NOT NULL,
	first_name varchar(50) NOT NULL,
	last_name varchar(50) NOT NULL,
	email varchar(150) NOT NULL,
	password_hash varbinary(75),
	profile_photo_id int DEFAULT NULL,
	CONSTRAINT PK_person PRIMARY KEY (person_id),
	CONSTRAINT FK_person FOREIGN KEY (profile_photo_id) REFERENCES photo (photo_id)
	);

	CREATE TABLE post(
	post_id INT AUTO_INCREMENT NOT NULL,
	title varchar(250) NOT NULL,
	description LONGTEXT DEFAULT NULL,
	created_date DATETIME NOT NULL DEFAULT NOW(),
	last_modified_date DATETIME NOT NULL DEFAULT NOW(),
	person_id INT NOT NULL,
	CONSTRAINT PK_post PRIMARY KEY (post_id),
	CONSTRAINT FK_post FOREIGN KEY (person_id) REFERENCES person (person_id)
	);

	CREATE TABLE post_photo(
	post_photo_id INT AUTO_INCREMENT NOT NULL,
	photo_id INT  NULL,
	post_id INT NOT NULL,
	CONSTRAINT PK_post_photo PRIMARY KEY (post_photo_id),
	CONSTRAINT FK_post_photo FOREIGN KEY (photo_id) REFERENCES photo (photo_id),
	CONSTRAINT FK2_post_photo FOREIGN KEY (post_id) REFERENCES post (post_id),
	CONSTRAINT UQ_post_photo UNIQUE (photo_id, post_id)
	); 

	CREATE TABLE tag(
	tag_id INT AUTO_INCREMENT NOT NULL,
	tag_name varchar(50) NOT NULL,
	CONSTRAINT PK_tag PRIMARY KEY (tag_id)
	);

	CREATE TABLE post_tag(
	post_tag_id INT AUTO_INCREMENT NOT NULL,
	post_id INT NOT NULL,
	tag_id INT NULL,
	CONSTRAINT PK_post_tag PRIMARY KEY (post_tag_id),
	CONSTRAINT FK_post_tag FOREIGN KEY (post_id) REFERENCES post (post_id),
	CONSTRAINT FK2_post_tag FOREIGN KEY (tag_id) REFERENCES tag (tag_id),
	CONSTRAINT UQ_post_tag UNIQUE (post_id, tag_id)
	);

	CREATE TABLE post_like(
	post_like_id INT AUTO_INCREMENT NOT NULL,
	post_id INT NOT NULL,
	person_id INT NULL,
	CONSTRAINT PK_post_like PRIMARY KEY (post_like_id),
	CONSTRAINT FK_post_like FOREIGN KEY (post_id) REFERENCES post (post_id),
	CONSTRAINT FK2_post_like FOREIGN KEY (person_id) REFERENCES person (person_id),
	CONSTRAINT UQ_post_like UNIQUE (post_id, person_id)
	);

	CREATE TABLE read_post(
	read_post_id INT AUTO_INCREMENT NOT NULL,
	post_id INT NOT NULL,
	person_id INT NULL,
	created_date DATETIME NOT NULL DEFAULT NOW(),
	CONSTRAINT PK_read_post PRIMARY KEY (read_post_id),
	CONSTRAINT FK_read_post FOREIGN KEY (post_id) REFERENCES post (post_id),
	CONSTRAINT FK2_read_post FOREIGN KEY (person_id) REFERENCES person (person_id),
	CONSTRAINT UQ_read_post UNIQUE (post_id, person_id)
	);

	CREATE TABLE post_comment(
	post_comment_id INT AUTO_INCREMENT NOT NULL,
	post_id INT NOT NULL,
	person_id INT NULL,
	comment LONGTEXT DEFAULT NULL,
	created_date DATETIME NULL DEFAULT NOW(),
	CONSTRAINT PK_post_comment PRIMARY KEY (post_comment_id),
	CONSTRAINT FK_post_comment FOREIGN KEY (post_id) REFERENCES post (post_id),
	CONSTRAINT FK2_post_comment FOREIGN KEY (person_id) REFERENCES person (person_id),
	CONSTRAINT UQ_post_comment UNIQUE (post_id, person_id)
	);


