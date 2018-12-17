
drop table img


create table img(

no				number				not null,
title			varchar(90)			not null,
name			varchar(20)			not null,
img				varchar(100)			not null,
grpno			number				default 0,
indent			number				default 0,
ansnum			number				default 0,
passwd			varchar(30)			not null,
viewcnt			number				default 0,
mdate			date				not null,

primary key(no)
)

update img 
set ansnum = ansnum + 1
where grpno = 0
and ansnum > 0


SELECT no, name, title, mdate, img from img
WHERE no=2

select * from img

delete from img


select no, title, name, img, grpno, indent, 
		ansnum, passwd, viewcnt, mdate, r		
from(
	select no, title, name, img, grpno, indent, 
		ansnum, passwd, viewcnt, mdate, rownum as r		
	from(
		select no, title, name, img, grpno, indent, 
		ansnum, passwd, viewcnt, 
		to_char(mdate,'yyyy-mm-dd') as mdate
		from img
		where title like '%ge%'
		order by grpno desc, ansnum
	)
) where r>=6 and r<=10

update img
set title = '3333', 
name = '3333',
img = '333.gif'
where no = 4


update img
set ansnum = ansnum + 1
 where grpno = 
and ansnum > ?

update img
set viewcnt = viewcnt + 1
where no=1

insert into img(no, title, name, img, grpno, passwd, mdate)
values ((select nvl(max(no),0)+ 1 from img), '이미지', 'user1', 'img', 
		(select nvl(max(grpno),0)+ 1 from img), '1234', sysdate)