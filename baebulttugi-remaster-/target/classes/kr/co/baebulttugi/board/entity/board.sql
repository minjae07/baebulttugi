create table tugiBoard(
idx number not null,
title varchar2(100) not null,
content varchar2(2000) not null,
writer varchar2(30) not null,
indate date default sysdate,
count number default 0,
primary key(idx)
);
create sequence tugiBoard_idx;

--시퀸스 조회 및 삭제
SELECT * FROM USER_SEQUENCES;
DROP SEQUENCE tugiBoard_idx;

insert into tugiBoard(idx, title, content, writer)
values(board_idx.nextval, '제목','내용','작성자');
insert into tugiBoard(idx, title, content, writer)
values(board_idx.nextval, '스프링게시판','스프링게시판','배민재');
insert into tugiBoard(idx, title, content, writer)
values(board_idx.nextval, '스프링게시판','스프링게시판','손님');
select * from tugiBoard order by idx desc
