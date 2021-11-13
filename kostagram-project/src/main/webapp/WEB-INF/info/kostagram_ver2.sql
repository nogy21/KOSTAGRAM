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

drop table member;

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

drop table post

CREATE sequence post_seq;

CREATE TABLE likes
(
	likes_id NUMBER  PRIMARY KEY,
	member_id VARCHAR2(100)  NOT NULL,
	post_id  NUMBER  NOT NULL,
	constraint likes_member_fk foreign key(member_id) references member(member_id),
	constraint likes_post_fk foreign key(post_id) references post(post_id) on delete cascade
);

drop table likes

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

drop table post_comment;

CREATE sequence post_comment_seq;


drop table post_comment;

CREATE sequence comment_seq;

select * from post_comment;

select * from post p,member m where p.member_id=m.member_id and post_content like '%이%';



-- 멤버
insert into member values('westkite92', 'westkite92!', 'westkite92@gmail.com', '김서연', 'westkite92-profile.jpeg', 'ksy-profile.jpeg', '안녕하세요. 김서연입니다.', sysdate);
insert into member values('ksy92', 'ksyksy92!', 'ksy92@gmail.com', '홍길동', 'ksy-profile.png', 'ksy-profile.png', '안녕하세요. 홍길동입니다.', sysdate);
insert into member values('khj92', 'khjkhj92!', 'khj92@gmail.com', '김철수', 'khj-profile.png', 'khj-profile.png', '안녕하세요. 김철수입니다.', sysdate);

-- 게시물
insert into post values(post_seq.nextval, 'westkite92', 'westkite92-post1.jpeg', 'westkite92-post1.jpeg', '첫 번째 포스트', sysdate);
insert into post values(post_seq.nextval, 'westkite92', 'westkite92-post2.jpg', 'westkite92-post2.jpg', '세미 프로젝트 기간 2주일 실화인가요', sysdate);
insert into post values(post_seq.nextval, 'westkite92', 'westkite92-post3.jpg', 'westkite92-post3.jpg', '프로젝트 기간이 끝나갈 때쯤의 모습', sysdate);
insert into post values(post_seq.nextval, 'westkite92', 'westkite92-post4.jpg', 'westkite92-post1.jpeg', '집에 보내주세요', sysdate);

insert into post values(post_seq.nextval, 'ksy92', 'ksy92-post1.jpg', 'ksy92-post1.jpg', '첫 번째 포스트', sysdate);
insert into post values(post_seq.nextval, 'ksy92', 'ksy92-post2.jpg', 'ksy92-post1.jpg', '두 번째 포스트', sysdate);

insert into post values(post_seq.nextval, 'khj92', 'khj92-post1.jfif', 'ksy92-post1.jpg', '첫 번째 포스트', sysdate);
insert into post values(post_seq.nextval, 'khj92', 'khj92-post2.jfif', 'ksy92-post1.jpg', '첫 번째 포스트', sysdate);


-- 좋아요
insert into likes values(likes_seq.nextval, 'westkite', );
-- 좋아요하는 id, 좋아요할 게시물 id

insert into post_comment values(post_comment_seq.nextval, 'westkite', , sysdate, );
-- 댓글 다는 id, 댓글 달리는 게시물 id, 날짜, 댓글내용



-- 멤버
insert into member values('hihid', 'sungwon0309!@', 'hihid@gamil.com', '송중기', 'jungi.jpg', 'jungi.jpg', '나는 송중기다.', sysdate);
insert into member values('americano','americano@','ame@gmail.com','권정열','10cm.png' , '10cm.png','봄이좋냐',sysdate);
insert into member values('latte','lattetalk@','latte@naver.com','하지원','jiwon.jpg','jiwon.jpg','오스카짱',sysdate);
insert into member values('sojulub','sojulub@','sj@gmail.com','지상열','jisang.png','jisang.png','소주는한짝부터',sysdate);
insert into member values('howmuch','howmuch@','hm@naver.com','원빈','wonbin.jpg','wonbin.jpg','얼마면돼',sysdate);
insert into member values('javaking','javaking@','javak@naver.com','서정우','javaking.png','javaking.png','자여러분QR하세용',sysdate);

-- 게시물
insert into post values(post_seq.nextval, 'hihid', 'jungipost.jpg', 'jungipost.jpg', '어제 화보촬영', sysdate);
insert into post values(post_seq.nextval,'americano','spring-10cm.png','spring-10cm.png','봄이그렇게도좋냐',sysdate);
insert into post values(post_seq.nextval,'americano','americano-sing.jpg','americano-sing.jpg','아써! 아써!',sysdate);
insert into post values(post_seq.nextval,'americano','mudo-10cm.png','mudo-10cm.png','양치했는데 힝',sysdate);
insert into post values(post_seq.nextval,'latte','secret-garden.jpg','secret-garden.jpg','너무아파서 소리도 안나온다',sysdate);
insert into post values(post_seq.nextval,'latte','jiwon1.jpg','jiwon1.jpg','딱걸렸어',sysdate);
insert into post values(post_seq.nextval,'latte','jiwon2.jpg','jiwon2.jpg','재벌인줄 알았더니 스파이였다.....',sysdate);
insert into post values(post_seq.nextval,'sojulub','sam.png','sam.png','삼겹살엔소주징',sysdate);
insert into post values(post_seq.nextval,'sojulub','soju1.jpg','soju1.jpg','ㄴr는 오늘도 달린ㄷr...',sysdate);
insert into post values(post_seq.nextval,'sojulub','soju2.jpg','soju2.jpg','모닝소주>_<',sysdate);
insert into post values(post_seq.nextval,'javaking','bread.jpg','bread.jpg','오늘도 빵터지는 회의',sysdate);
insert into post values(post_seq.nextval,'javaking','hand.jpg','hand.jpg','손잡고가면 천리도 한걸음에',sysdate);



-- 좋아요
insert into likes values(likes_seq.nextval, 'hihid', );
insert into likes values(likes_seq.nextval, 'americano', );
insert into likes values(likes_seq.nextval, 'latte', );
insert into likes values(likes_seq.nextval, 'sojulub', );
insert into likes values(likes_seq.nextval, 'howmuch', );
insert into likes values(likes_seq.nextval, 'javaking', );
-- 좋아요하는 id, 좋아요할 게시물 id

insert into post_comment values(post_comment_seq.nextval, 'hihid', , sysdate, '별로네요');
insert into post_comment values(post_comment_seq.nextval, 'americano', , sysdate, '오늘도 아메리카노~~~');
insert into post_comment values(post_comment_seq.nextval, 'americano', , sysdate, '아메리카노 좋아좋아좋아');
insert into post_comment values(post_comment_seq.nextval, 'americano', , sysdate, '벚꽃이그렇게좋냐');
insert into post_comment values(post_comment_seq.nextval, 'americano', , sysdate, '커피는 아메리카노지');
insert into post_comment values(post_comment_seq.nextval, 'latte', , sysdate, '안녕하세요');
insert into post_comment values(post_comment_seq.nextval, 'latte', , sysdate, '이쁘다');
insert into post_comment values(post_comment_seq.nextval, 'latte', , sysdate, '좋네');
insert into post_comment values(post_comment_seq.nextval, 'sojulub', , sysdate, '오늘 한잔고?');
insert into post_comment values(post_comment_seq.nextval, 'sojulub', , sysdate, '오늘도 한잔고?');
insert into post_comment values(post_comment_seq.nextval, 'sojulub', , sysdate, '오늘은 양주고?');
insert into post_comment values(post_comment_seq.nextval, 'sojulub', , sysdate, '숙취해소에는 해장술');
insert into post_comment values(post_comment_seq.nextval, 'sojulub', , sysdate, '맛있는 음식엔 맛있는 술과 함께');
insert into post_comment values(post_comment_seq.nextval, 'sojulub', , sysdate, '달려달려~~~');
insert into post_comment values(post_comment_seq.nextval, 'javaking', , sysdate, '4시 QR 하세용');
insert into post_comment values(post_comment_seq.nextval, 'javaking', , sysdate, '자 여러분~ 점심식사 뭐드셨나용');
insert into post_comment values(post_comment_seq.nextval, 'javaking', , sysdate, '자 여러분~ 쉬었다가 오세용');
-- 댓글 다는 id, 댓글 달리는 게시물 id, 날짜, 댓글내용





-- 멤버
insert into member values('yang1762', 'sungwon0309!@', 'yang1762@gmail.com', '양성원', 'yang1762.jpg', 'yang1762.jpg', '안녕하세요!', sysdate);
insert into member values('hihid', 'sungwon0309!@', 'hihid@gamil.com', '송중기', 'jungi.jpg', 'jungi.jpg', '나는 송중기다.', sysdate);
insert into member values('ronaldo', 'sungwon0309!@', 'honaldo@gamil.com', ' 호날두', 'ronaldo.jpg', 'ronaldo.jpg', '세계 최고의 축구선수.', sysdate);
insert into member values('jiwon_0930', 'sungwon0309!@', 'jiwon@gamil.com', ' 임지원', 'jiwon_0930.jpg', 'jiwon_0930.jpg', '사실 인스타 안해요.', sysdate);


-- 게시물
insert into post values(post_seq.nextval, 'hihid', 'jungipost.jpg', 'jungipost.jpg', '어제 화보촬영', sysdate);
insert into post values(post_seq.nextval, 'ronaldo', 'ronaldopost.jpg', 'ronaldopost.jpg', '발롱도르 감사합니다.', sysdate);
insert into post values(post_seq.nextval, 'yang1762', 'yang1762post1.jpg', 'yang1762post1.jpg', '즐거운 세미 프로젝트ㅎㅎ.', sysdate);
insert into post values(post_seq.nextval, 'yang1762', 'yang1762post2.jpg', 'yang1762post2.jpg', '드디어 졸업!@', sysdate);
insert into post values(post_seq.nextval, 'yang1762', 'yang1762post3.jpg', 'yang1762post3.jpg', '제주도 도두봉입니다!', sysdate);
insert into post values(post_seq.nextval, 'yang1762', 'yang1762post4.jpg', 'yang1762post4.jpg', '귀여운 우리 라봉이', sysdate);
insert into post values(post_seq.nextval, 'jiwon_0930', 'jw-everland.jpg', 'jw-everland.jpg', '칭구들이랑 케베', sysdate);
insert into post values(post_seq.nextval, 'jiwon_0930', 'jw-dog.jpg', 'jw-dog.jpg', '내사랑 바비♡', sysdate);
insert into post values(post_seq.nextval, 'jiwon_0930', 'jw-busan.jpg', 'jw-busan.jpg', '해운대ㅐㅐㅐ', sysdate);

insert into post values(post_seq.nextval, 'jiwon_0930', 'jw-mom1.jpg', 'jw-mom1.jpg', '제일예쁜 우리엄마♥', sysdate);
insert into post values(post_seq.nextval, 'jiwon_0930', 'jw-withmom.jpg', 'jw-withmom.jpg', '엄마랑나', sysdate);
insert into post values(post_seq.nextval, 'jiwon_0930', 'jw-sis.jpg', 'jw-sis.jpg', '그냥,, 그냥 동생', sysdate);
insert into post values(post_seq.nextval, 'jiwon_0930', 'jw-surf.jpg', 'jw-surf.jpg', '첫 서핑 성공', sysdate);
insert into post values(post_seq.nextval, 'jiwon_0930', 'jw-waff.jpg', 'jw-waff.jpg', '새들러 크로플 중독', sysdate);



-- 좋아요
insert into likes values(likes_seq.nextval, 'hihid', );
insert into likes values(likes_seq.nextval, 'ronaldo', );
insert into likes values(likes_seq.nextval, 'yang1762', );
insert into likes values(likes_seq.nextval, 'jiwon_0930', );

-- 좋아요하는 id, 좋아요할 게시물 id

-- 댓글
insert into post_comment values(post_comment_seq.nextval, 'hihid', , sysdate, '별로네요');
insert into post_comment values(post_comment_seq.nextval, 'ronaldo', , sysdate, '별로네요');
insert into post_comment values(post_comment_seq.nextval, 'yang1762', , sysdate, '별로네요');
insert into post_comment values(post_comment_seq.nextval, 'jiwon_0930', , sysdate, '별로네요');
-- 댓글 다는 id, 댓글 달리는 게시물 id, 날짜, 댓글내용





