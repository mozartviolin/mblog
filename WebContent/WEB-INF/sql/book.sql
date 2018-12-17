create table book(
 num number(7) not null,
 name varchar (50),
 email varchar (30),
 home varchar (30),
 contents nvarchar2(2000),
 constraint book_num_ok primary key(num)
);

 

create sequence book_num
 start with 1
 increment by 1
 nomaxvalue;


