

drop table team

CREATE TABLE team(
	no 			NUMBER 			NOT NULL, 
	name		VARCHAR(30) 	NOT NULL,  
	gender 		VARCHAR(6) 		not null,
	skills		VARCHAR(300) 	not null,  
	hobby		VARCHAR(300) 	not null,
	phone 		VARCHAR(30) 	NOT NULL,  
	zipcode		VARCHAR(5),  	-- null 허용
	address 	VARCHAR(800), 
	address2 	VARCHAR(1000), 
	primary key(no)   
);

alter table team
add(refnum      number     default 0)

delete from team

select count(refnum) from team where refnum=0

select * from team order by grpno desc, ansnum;

-- no
select nvl(max(no),0) + 1 from team

-- create
insert into team(no, name, gender, skills, hobby, phone,
			zipcode, address, address2)
values(
(select nvl(max(no),0)+ 1 from team), '홍길동', '남자', 
		'Java,JSP',	'영화감상',	'010-1111-2222','12345', 
		'서울시 종로구 관철동 젊음의 거리', '종로코아 빌딩 5층')
		
insert into team(no, name, gender, skills, hobby, phone,
			zipcode, address, address2)
values(
(select nvl(max(no),0)+ 1 from team), '이재우', '남자', 'JAVA',
		'독서',	'010-7165-8528','13589', '경기도 성남시', 
		'분당구 서현동')
			
-- read
select * from team
order by no 
where no =1


-- update 
update team
set skills 	= '게임' 			,
	hobby 	= 'JAVA,JSP,MVC' 	,
	phone	= '010-0000-0000'	,
	zipcode	= '00000'			,
	address = '서울시 서초구 방배동',
	address2= '푸르지오12345'
where no = 1

-- delete
delete from team
where no = 1

-- list
-- 0808-06 리스트 갱신
select no, name, gender, skills, phone, grpno, indent, ansnum, r
from(
	select no, name, gender, skills, phone, grpno, indent, ansnum, rownum as r
	from(
		select no, name, gender, skills, phone, grpno, indent, ansnum 
		from team 
		where name like '%22%'
		order by grpno desc,ansnum       
		)
)where r>=1 and r<=2


alter table team
add(grpno number default 0,
	indent number default 0,
	ansnum number default 0)

select * from team;
	
delete from team;

insert


