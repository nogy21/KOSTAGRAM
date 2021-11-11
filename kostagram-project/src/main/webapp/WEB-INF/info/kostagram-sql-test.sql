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

select * from post;

insert into post(post_id, member_id, img, org_img, post_content,post_date)
values(post_seq.nextval, 'yang1762', 'pic01.jpg', 'pic01.jpg','이른 아침 작은 새들 노랫소리 들려오면 언제나 그랬듯 아쉽게 잠을 깬다 창문 하나 햇살 가득 눈부시게 비쳐오고 서늘한 냉기에 재채기할까 말까 음', sysdate);