CREATE TABLE member (
   member_id VARCHAR2(100) PRIMARY KEY,
   password VARCHAR2(100) NOT NULL,
   email VARCHAR2(100) NOT NULL,
   name VARCHAR2(100) NOT NULL,
   profile_img VARCHAR2(500),
   org_profile_img VARCHAR2(500),
   introduce CLOB,
   register_date DATE NOT NULL
);

CREATE TABLE post
(
	post_id NUMBER  PRIMARY KEY,
	member_id VARCHAR2(100)  NOT NULL,
	img VARCHAR2(500)  NOT NULL,
	org_img VARCHAR2(500)  NOT NULL,
	post_content CLOB,
	post_date DATE  NOT NULL, 
	constraint post_member_fk foreign key(member_id) references member(member_id)
);

CREATE sequence post_seq;

CREATE TABLE likes
(
	likes_id NUMBER  PRIMARY KEY,
	member_id VARCHAR2(100)  NOT NULL,
	post_id  NUMBER  NOT NULL,
	constraint likes_member_fk foreign key(member_id) references member(member_id),
	constraint likes_post_fk foreign key(post_id) references post(post_id) on delete cascade
);

CREATE sequence likes_seq;

CREATE TABLE post_comment
(
   comment_id NUMBER  PRIMARY KEY,
   member_id VARCHAR2(100)  NOT NULL,
   post_id  NUMBER  NOT NULL,
   comment_date DATE NOT NULL,
   comment_content CLOB NOT NULL,
   constraint comment_member_fk foreign key(member_id) references member(member_id),
   constraint comment_post_fk foreign key(post_id) references post(post_id) on delete cascade
);

CREATE sequence comment_seq;






