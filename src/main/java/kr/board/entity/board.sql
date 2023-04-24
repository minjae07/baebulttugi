screate table board(
	idx number not null,
	memID varchar2(20) not null,  
	title varchar2(100) not null,
	content varchar2(2000) not null,
	writer varchar2(30) not null,
	indate date default sysdate,
	count number default 0,
	primary key(idx)
);
create table board1(
	idx number not null,
	memID varchar2(20) not null,  
	title varchar2(100) not null,
	content varchar2(2000) not null,
	indate date default sysdate,
	count number default 0,
	primary key(idx)
);
create sequence board1_idx;
drop table board;

select * from board;

insert into board1(idx, title, content, memID)
values(board1_idx.nextval, '게시판','test내용','test관리자');

--시퀸스 조회 및 삭제
SELECT * FROM USER_SEQUENCES;
DROP SEQUENCE board_idx;

insert into board(idx, title, content, writer)
	values(board_idx.nextval, '스프링게시판','스프링게시판','관리자');
insert into board(idx, title, content, writer)
	values(board_idx.nextval, '스프링게시판','스프링게시판','배민재');
insert into board(idx, title, content, writer)
	values(board_idx.nextval, '스프링게시판','스프링게시판','손님');
select * from board order by idx desc

--조회 및 삭제
select * from board;
drop table board;


create table member(
  memIdx int, 
  memID varchar(20) not null,  
  memPassword varchar(20) not null,
  memName varchar(20) not null,
  memAge int,
  memGender varchar(20),
  memEmail varchar(50),
  memProfile varchar(50),
  primary key(memIdx)
);

create sequence member_idx;

drop table member;
DROP SEQUENCE member_idx;
delete member;

select * from member;

		select * 
		from tblBoard 
		where content like '%ㅓㅓ%'
		order by boardGroup desc;
SELECT * 
		FROM TBLBOARD 
		WHERE 1=1
			AND content LIKE '%ㅓㅓ%'
		ORDER BY boardGroup DESC;

select *
from (
	select *
	from board
	order by count desc
)
where rownum <=3;

	select *
		from (
			select *
			from board
			order by count desc
		)
	where rownum lte 3

	SELECT memID, COUNT(memID) FROM board
	GROUP BY memID
	HAVING COUNT(memID) >= 0
	
	
SELECT *
FROM TBLBOARD
WHERE content LIKE '%' || 11 || '%'
ORDER BY boardGroup DESC;
	
DELETE TBLBOARD WHERE IDX=11;

select * from TBLBOARD;
delete TBLBOARD;
commit;

SELECT *   
FROM TBLBOARD   
WHERE 1=1         
AND title LIKE '%13%'        
ORDER BY boardGroup DESC;

create sequence TBLBOARD_seq;


    SELECT *
    FROM TBLBOARD
    WHERE 1 = 1
    <choose>
        <when test="searchType == 'writer'">
            AND writer LIKE '%' || :keyword || '%'
        </when>
        <when test="searchType == 'title'">
            AND title LIKE '%' || :keyword || '%'
        </when>
        <when test="searchType == 'content'">
            AND content LIKE '%' || :keyword || '%'
        </when>
    </choose>
    ORDER BY boardGroup DESC;
    
    
    
    select *
    from tblBoard
    where idx = 2;
    
    select * from tblBoard where idx = 2;
    
    
    		SELECT *
		  FROM TBLBOARD;
		 WHERE IDX = 0;
		 
 select *
    from tblBoard
    where count = 4;
    