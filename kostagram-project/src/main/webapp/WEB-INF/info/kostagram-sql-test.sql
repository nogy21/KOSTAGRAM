select * from kosta_member;

CREATE TABLE kosta_member (
    member_id VARCHAR2(100) PRIMARY KEY,
    password VARCHAR2(100) NOT NULL,
    email VARCHAR2(100) NOT NULL,
    name VARCHAR2(100) NOT NULL,
    profile_img VARCHAR2(500),
    introduce CLOB,
    register_date DATE NOT NULL
);

select * from likes;
select * from post;

insert into likes(likes_id, member_id, post_id) values(likes_seq.nextval,'jw','3');

delete from likes where post_id=3 and member_id='jw';

SELECT COUNT(member_id) as likecnt FROM likes where post_id=3;



