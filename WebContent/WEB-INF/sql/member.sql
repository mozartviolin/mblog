member purge;

drop table member

create table member(
id				varchar(10) 		not null,
passwd			varchar(20)			not null,
mname			varchar(20) 		not null,
tel				varchar(14)			not null,
email			varchar(50)			not null unique, --중복안대
zipcode			varchar(7)			null,
address1		varchar(150)		null,
address2		varchar(50)			null,
job				varchar(20)			not null,
mdate			date				not null,
fname			varchar(50)			default 'member.jpg',
grade			char(1)				default 'H', -- 일반회원 H, 정지 Y 손님 Z
primary key(id)
)

select fname from MEMBER

insert into member(id, passwd, mname, tel, email, zipcode,
address1, address2, job, mdate, fname, grade)
values('user1', '1234', '개발자1', '123-1234', 'email1@mail.com',
'123-123', '인천시', '남동구','A01',sysdate, 'man.jpg', 'H')

INSERT INTO member(id, passwd, mname, tel, email, zipcode,  
address1,address2, job, mdate, fname, grade) 
VALUES('user2', '1234', '개발자2', '123-1234', 'email2@mail.com',  
'123-123','광명시','남동구' ,'A01', sysdate, 'man.jpg', 'H')
 
INSERT INTO member(id, passwd, mname, tel, email, zipcode,  
address1,address2, job, mdate, fname, grade) 
VALUES('admin', '1', '관리자2', '123-1234', 'admin@mail.com',  
'123-123','용인시','남동구' ,'A01', sysdate, 'myface.jpg', 'A')

select * from member

--중복 아이디 검사 관련 SQL
-- 0: 중복아님, 1:중복
select count(id)
from member
where id='user1'

--이메일 중복확인
select count(email) as cnt
from member
where email='email3@mail.com'

--user1 회원 정보 보기
select id,passwd,mname,tel,email,zipcode,address1,address2,
	job,mdate,fname,grade
from member
where id='user1'

--회원 이미지 수정
update member
set fname='x.jpg'
where id='user1'

--패스워드 변경
update member
set passwd='1234'
where id = 'user2';

--회원 정보 수정
update member 
set passwd='TEST',
	tel='123-123',
	email='email10',
	zipcode='TEST',
	address1='수원',
	address2='팔달구',
	job='TEST'
where id = 'user3'

--user3 회원 삭제
delete from member where id='ttt'

--로그인 관련 SQL bb 
select count(id) as cnt
from member
where id='user1' and passwd = '1234'

--list
select id,mname,tel,email,zipcode,address1,address2,
fname,r
	from(
	select id,mname,tel,email,zipcode,address1,address2,fname,
	rownum as r
		from( 
		select id,mname,tel,email,zipcode,address1,
		address2,fname
		from member
		where mname like '%개발%'
		order by mdate desc
)
)where r>=1 and r<=5


--회원 목록 SQL

select id, mname, tel, email, zipcode, address1,
	address2, fname, r	
from(
	select id, mname, tel, email, zipcode, address1,
			address2, fname, rownum as r	
	from(	
		select id, mname, tel, email, zipcode, address1,
			address2, fname
		from member
		order by id asc
	)
)where r>=1 and r<=5

select * from member

select count(passwd)
from member
where passwd = '1234'
and id='user1' 


