drop table bbs purge;


create table bbs(
	bbsno			number(7) 		not null,
	wname			varchar(20)		not null,
	title			varchar(100)	not null,
	content			varchar(4000)	not null,
	passwd			varchar(15)		not null,
	viewcnt			number(5)		default 0,
	wdate			date			not null, 	-- 등록 날짜, sysdate 
	grpno			number(7)		default 0,	-- 부모글 번호 
	indent			number(2)		default 0,	-- 답변여부,답변의 깊이
	ansnum			number(5)		default 0,  -- 답변 순서 
	primary key(bbsno)
)

alter table bbs
add(refnum     number    default 0)	

-- filename filesize
alter table bbs
add(filename varchar(1000),
	filesize number default 0)

select * from bbs

delete from BBS

-- create
select nvl(max(bbsno),0)+1 as max from bbs;

insert into bbs(bbsno, wname, title, content, passwd, wdate,grpno)
values((select nvl(max(bbsno),0)+1 as bbsno from bbs), 
	   '왕눈이','제목','내용','123',sysdate-5,
	   (select nvl(max(grpno),0)+1 as bbsno from bbs))

-- list
select bbsno, wname, title, content, passwd, viewcnt,
	wdate , grpno, indent, ansnum, rownum from bbs
from(
	select bbsno, wname, title, content, passwd, viewcnt,
	wdate , grpno, indent, ansnum, rownum as r
	from(
		select bbsno, wname, title, content, passwd, viewcnt,
		to_char(wdate,'yyyy-mm-dd') as wdate , grpno, indent, ansnum 
		from bbs
		order by grpno desc, ansnum
	)
)where r>=6 and r<=10



-- 조회수 증가
update bbs
set viewcnt = viewcnt + 1
where bbsno=1

--read
select bbsno,wname,title,content,viewcnt,wdate,grpno,indent,ansnum
from bbs
where bbsno=1


--update
update bbs
set wname='왕눈이', title='비오는날', 
	content='무지개 연못에서 피리를 분다'
where bbsno=1

-- 패스워드 검사
select count(bbsno) as cnt
from bbs
where bbsno=1 
and passwd='123'

-- 모든 레코드 삭제
delete from bbs;

-- ?번 레코드만 삭제
delete from bbs where bbsno=9


select bbsno, grpno, indent, ansnum from bbs
order by grpno desc, ansnum


select bbsno, grpno,indent, ansnum, refnum
from bbs
order by grpno desc, ansnum


select bbsno, wname, title, content,passwd,viewcnt,wdate,grpno,indent,ansnum
from bbs
where wname like '%444%'
order by grpno desc, ansnum asc



