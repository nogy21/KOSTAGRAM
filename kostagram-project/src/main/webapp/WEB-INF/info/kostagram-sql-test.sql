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