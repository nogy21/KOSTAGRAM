CREATE TABLE member (
	member_id VARCHAR2(100) PRIMARY KEY,
	password VARCHAR2(100) NOT NULL,
	email VARCHAR2(100) NOT NULL,
	name VARCHAR2(100) NOT NULL,
	profile_img VARCHAR2(500),
	introduce CLOB,
	register_date DATE NOT NULL
);
insert into MEMBER (member_id, password, email, name, profile_img, introduce, register_date) values ('jw', 'a','b','지원',null,null, sysdate);

update MEMBER set password='123456' where member_id='jw';

select password from member where member_id='jw';