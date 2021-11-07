CREATE TABLE member (
	member_id VARCHAR2(100) PRIMARY KEY,
	password VARCHAR2(100) NOT NULL,
	email VARCHAR2(100) NOT NULL,
	name VARCHAR2(100) NOT NULL,
	profile_img VARCHAR2(500) NULL,
	introduce CLOB NULL,
	register_date DATE NOT NULL
);