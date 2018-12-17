drop table memo;

CREATE TABLE memo(
	memono NUMBER(6) NOT NULL, 
	content 	VARCHAR(4000) NOT NULL,  
	wdate 	DATE not null, 
	viewcnt	NUMBER(5) DEFAULT 0,  
	primary key(memono)   
);

alter table memo
add(refnum     number    default 0)	

alter table memo
add(wname    varchar(100)    not null)	
alter table memo
add(passwd    varchar(100)    not null)	

(select nvl(max(memono),0)+1 as memono from memo)

select nvl(max(memono),0)+1 as max from memo;

select memono, wname,grpno,indent, ansnum 
from memo
order by grpno desc, ansnum

select memono,wname,content,wdate,viewcnt,grpno,indent,ansnum, r
from(
	select memono,wname,content,wdate,viewcnt,grpno,indent,ansnum, rownum as r
	from(
		select memono,wname,content,to_char(wdate,'yyyy-mm-dd') as wdate, viewcnt,grpno,indent,ansnum from memo
		where wname like '%3%' order by grpno desc, ansnum)
		)where r>=2 and r<=4

alter table memo
(refnum     number    default 0)	

delete from memo

select * from memo

-- 답변용 컬럼 추가
alter table memo
add(grpno		number 		default 0,
	indent		number		default 0,
	ansnum		number 		default 0)

alter table memo
add(wname	varchar(20),	
	passwd	varchar(15))
	
select wname, passwd from MEMO

	
-- 추가한 컬럼 확인
select memono,grpno,indent,ansnum
from memo

select * from MEMO

delete from memo


	
	
DROP SEQUENCE memo_seq;

select nvl(max(memono),0)+1 as max from memo;

create sequence memo_seq
start with 1
increment by 1
minvalue 0
cache 100;



-- dual: 가상 테이블, SQL형식 맞출경우 임시 테이블 사용, 변경하면 안됨
select memo_seq.nextval FROM dual;

-- 현재 sequence 확인(Run SQL Command Line 에서 실행);
select memo_seq.currval FROM dual;

insert into memo(memono, title, content, wdate)
values(memo_seq.nextval, '오늘의 메모', '이전주 토익 시험 준비', sysdate);

select memono, title, wdate, viewcnt
from memo
order by memono asc;

insert into memo(memono, title, content, wdate)
values(memo_seq.nextval,'읽을 도서','가메출판사 오라클 11g', sysdate);

INSERT INTO memo(memono, title, content, wdate) 
VALUES(memo_seq.nextval, '수업 복습', '메모 제작', sysdate); 
 
INSERT INTO memo 
VALUES(memo_seq.nextval, '도서구입', 'JSP Web Programming', sysdate, 0); 

alter table memo
add(refnum     number    default 0)	


select * from memo;

drop table news;

create table news(
	newsno int not null,
	title varchar(100) not null,
	media varchar(50) not null,
	author varchar(30) not null,
	rdate date not null,
	primary key(newsno)
);

insert into news(newsno, title, media, author, rdate)
values(1, 'MS, 2016년 구형 IE 브라우저 지원 중단', 'ZDNet', '가길동', sysdate);

select newsno, title, media, author, rdate from news;

-- 홑따옴표가 넣고 싶다
-- MySQL 에서는 가능한 2가지   
insert into news(newsno, title, media, author, rdate)
values(1, "MS, 2016년 구형 'IE' 브라우저 지원 중단",'ZDNet','가길동', sysdate);
-- 인식 몬햄ㅜㅜ

INSERT INTO news(newsno, title, media, author, rdate)
VALUES(1, 'MS, 2016년 구형 \'IE\' 브라우저 지원 중단', 'ZDNet', '가길동', sysdate);
-- 역시 인식 몬햄ㅜㅜ

-- Oracle, single quotation의 추가
insert into news(newsno, title, media, author, rdate)
values(5, 'MS, 2016년 구형 "IE" 브라우저 지원 중단','ZDNet', '가길동', sysdate);

SELECT newsno, title, media, author, rdate FROM news;

INSERT INTO news(newsno, title, media, author, rdate)
VALUES(6, 'MS, 2016년 구형 ''IE'' 브라우저 지원 중단', 'ZDNet', '가길동', sysdate);

-- Oracle, double quotation의 추가
insert into news(newsno, title, media, author, rdate)
values(3, '"차량 막무가내 견인한 뒤 요금 과다청구 많아"','연합뉴스','가길동', sysdate);


SELECT newsno, title, media, author, rdate FROM news;

select memono,title,wdate,viewcnt,grpno,indent,ansnum, r
from(
	select memono,title,wdate,viewcnt,grpno,indent,ansnum,rownum as r
	from(
		select memono,title,                  
		to_char(wdate,'yyyy-mm-dd') as wdate, viewcnt,
		grpno,indent,ansnum                   
		from memo 
		--where title like '%제목%'
		order by grpno desc, ansnum          
	)
)where r>=3 and r<=5