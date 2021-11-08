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

insert into KOSTA_MEMBER(member_id, password, email, name, register_date)
values ('java2', 'a', 'test@naver.com', '강하늘', sysdate);





