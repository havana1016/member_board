# member_board

db 내용
테이블명 및 컬럼이름 상이로 인해 기록
create table member(
id bigint auto_increment,
mid varchar(20),
mpw varchar(15),
mname varchar(15),
memail varchar(30),
mphone varchar(15),
mdate datetime,
mfname varchar(100),

constraint primary key(id),
constraint unique (mid)
);
insert into member (mid,mpw) values('admin',1);
select * from member;
create table board(
bid bigint auto_increment,
btitle varchar(50),
mid varchar(20),
btext varchar(500),
bhit int default 0,
bdate datetime,
bfname varchar(100),
constraint primary key(bid),
constraint foreign key(mid) references member(mid) on delete cascade

);
drop table board;
select * from board;
create table comment(
cid int auto_increment,
bid bigint,
mid varchar(20),
ctext varchar(200),
cdate datetime,
constraint primary key(cid),
constraint foreign key(bid) references board(bid) on delete cascade,
constraint foreign key(mid) references member(mid) on delete cascade

);
drop table comment;
select * from comment;
