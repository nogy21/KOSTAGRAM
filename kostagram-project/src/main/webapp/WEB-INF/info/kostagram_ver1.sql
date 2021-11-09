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

select * from member;

insert into member values('test1','a','test@gmail.com','테스트','','','',sysdate);
drop table member;

update member set profile_img='', org_profile_img='', introduce='testtest' where member_id='test';