CREATE TABLE tbl_lookup
(
	id INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(128) NOT NULL COMMENT '数椐项的文本表现形式',
	code INTEGER NOT NULL COMMENT '数椐项的整数表现形式',
	type VARCHAR(128) NOT NULL COMMENT '数椐项的类型',
	position INTEGER NOT NULL COMMENT '同类数椐项中的显示顺序'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE tbl_user
(
	id INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
	username VARCHAR(128) NOT NULL,
	password VARCHAR(128) NOT NULL,
	email VARCHAR(128) NOT NULL,
	profile TEXT
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE tbl_post
(
	id INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
	title VARCHAR(128) NOT NULL,
	content TEXT NOT NULL,
	tags TEXT,
	status INTEGER NOT NULL,
	create_time INTEGER,
	update_time INTEGER,
	author_id INTEGER NOT NULL,
	CONSTRAINT FK_post_author FOREIGN KEY (author_id)
		REFERENCES tbl_user (id) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE tbl_comment
(
	id INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
	content TEXT NOT NULL,
	status INTEGER NOT NULL,
	create_time INTEGER,
	author VARCHAR(128) NOT NULL,
	email VARCHAR(128) NOT NULL,
	url VARCHAR(128),
	post_id INTEGER NOT NULL,
	CONSTRAINT FK_comment_post FOREIGN KEY (post_id)
		REFERENCES tbl_post (id) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE tbl_tag
(
	id INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(128) NOT NULL,
	frequency INTEGER DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO tbl_lookup (name, type, code, position) VALUES ('Draft', 'PostStatus', 1, 1);
INSERT INTO tbl_lookup (name, type, code, position) VALUES ('Published', 'PostStatus', 2, 2);
INSERT INTO tbl_lookup (name, type, code, position) VALUES ('Archived', 'PostStatus', 3, 3);
INSERT INTO tbl_lookup (name, type, code, position) VALUES ('未审核', 'CommentStatus', 1, 1);
INSERT INTO tbl_lookup (name, type, code, position) VALUES ('已审核', 'CommentStatus', 2, 2);

INSERT INTO tbl_user (username, password, email) VALUES ('demo','$2a$10$JTJf6/XqC94rrOtzuF397OHa4mbmZrVTBOQCmYD9U.obZRUut4BoC','webmaster@example.com');
INSERT INTO tbl_post (title, content, status, create_time, update_time, author_id, tags) VALUES ('Welcome!','This blog system is developed using Yii. It is meant to demonstrate how to use Yii to build a complete real-world application. Complete source code may be found in the Yii releases.

Feel free to try this system by writing new posts and posting comments.',2,1230952187,1230952187,1,'yii, blog');
INSERT INTO tbl_post (title, content, status, create_time, update_time, author_id, tags) VALUES ('A Test Post', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 2,1230952187,1230952187,1,'test');

INSERT INTO tbl_comment (content, status, create_time, author, email, post_id) VALUES ('This is a test comment.', 2, 1230952187, 'Tester', 'tester@example.com', 2);

INSERT INTO tbl_tag (name) VALUES ('yii');
INSERT INTO tbl_tag (name) VALUES ('blog');
INSERT INTO tbl_tag (name) VALUES ('test');