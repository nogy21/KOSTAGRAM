select b.comment_content, to_char(b.comment_date,'YYYY-MM-DD') as date2, b.member_id, b.comment_id, m.org_profile_img
from (select comment_content, comment_date, comment_id, c.member_id
from post_comment c, post p
where c.post_id=1 and p.post_id=1) b, member m
where b.member_id = m.member_id
order by b.comment_id desc;

select * from post;
select * from post_comment;

insert into post values(
post_seq.nextval, 'yang1762', 'pic01.jpg', 'pic01.jpg', 'ㅎㅇ', sysdate
);