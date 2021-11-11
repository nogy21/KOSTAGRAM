select * from member;

CREATE TABLE member (
    member_id VARCHAR2(100) PRIMARY KEY,
    password VARCHAR2(100) NOT NULL,
    email VARCHAR2(100) NOT NULL,
    name VARCHAR2(100) NOT NULL,
    profile_img VARCHAR2(500),
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

insert into post(post_id, member_id, img, org_img, post_content,post_date)
values(post_seq.nextval, 'java', 'pic01.jpg', 'pic01.jpg','이른 아침 작은 새들 노랫소리 들려오면 언제나 그랬듯 아쉽게 잠을 깬다 창문 하나 햇살 가득 눈부시게 비쳐오고 서늘한 냉기에 재채기할까 말까 음', sysdate);

select * from post;

CREATE TABLE likes
(
    likes_id NUMBER  PRIMARY KEY,
    member_id VARCHAR2(100)  NOT NULL,
    post_id  NUMBER  NOT NULL,
    constraint likes_member_fk foreign key(member_id) references member(member_id),
    constraint likes_post_fk foreign key(post_id) references post(post_id)
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
    constraint comment_post_fk foreign key(post_id) references post(post_id)
);

CREATE sequence comment_seq;

insert into post(post_id, member_id, img, org_img, post_content,post_date)
values(post_seq.nextval, 'java', 'pic01.jpg', 'pic01.jpg','text context', sysdate);

delete from post where post_id between 54 and 55; 

SELECT * FROM post WHERE member_id = 'java' and post_id = (select max(post_id) from post);

select max(post_id) from post;

SELECT * FROM post WHERE member_id = 'java' and post_id = (select max(post_id) from post where member_id = 'java');

SELECT * FROM post WHERE member_id = 'java' and post_id = (select max(post_id) from post where member_id = 'java');



