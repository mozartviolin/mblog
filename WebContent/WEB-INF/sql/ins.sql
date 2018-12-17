drop table ins purge;

create table ins(
	insno 		number   	not null,
	wname			varchar(20)		not null,
	title			varchar(200)	not null,
	content			varchar(4000)	not null,
	passwd			varchar(20)		not null,
	viewcnt			number(5)		default 0,
	wdate			date			not null, 	-- 등록 날짜, sysdate 
	grpno			number(7)		default 0,	-- 부모글 번호 
	indent			number(2)		default 0,	-- 답변여부,답변의 깊이
	ansnum			number(5)		default 0,  -- 답변 순서 
	refnum   	  number    default 0
	filename 		varchar(200),
	filesize 		number default 0
primary key(insno)	
);

select * from ins;


delete from ins;
where insno = 2;

-- create
select nvl(max(insno),0)+1 as max from ins;

insert into ins(insno, wname, title, content, passwd, wdate,grpno)
values((select nvl(max(insno),0)+1 as insno from ins), 
	   '왕눈이','제목','내용','123',sysdate,
	   (select nvl(max(grpno),0)+1 as insno from ins))

-- list
select insno, wname, title, content, passwd, viewcnt,
	wdate , grpno, indent, ansnum, r
from(
	select insno, wname, title, content, passwd, viewcnt,
	wdate , grpno, indent, ansnum, rownum as r
	from(
		select insno, wname, title, content, passwd, viewcnt,
		to_char(wdate,'yyyy-mm-dd') as wdate , grpno, indent, ansnum 
		from ins
		order by grpno desc, ansnum
	)
)where r>=6 and r<=10



-- 조회수 증가
update ins
set viewcnt = viewcnt + 1
where insno=1

--read
select insno,wname,title,content,viewcnt,wdate,grpno,indent,ansnum
from ins
where insno=1


--update
update ins
set wname='왕눈이', title='비오는날', 
	content='무지개 연못에서 피리를 분다'
where insno=1

-- 패스워드 검사
select count(insno) as cnt
from ins
where insno=1 
and passwd='123'

-- 모든 레코드 삭제
delete from ins;

-- ?번 레코드만 삭제
delete from ins where insno=9

select count(refnum)
from ins
where refnum = ?


select insno, grpno, indent, ansnum from ins
order by grpno desc, ansnum


select insno, grpno,indent, ansnum, refnum
from ins
order by grpno desc, ansnum


select insno, wname, title, content,passwd,viewcnt,wdate,grpno,indent,ansnum
from ins
where wname like '%444%'
order by grpno desc, ansnum asc


