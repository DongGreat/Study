-- 12주차_실습활동

-- 1. emp 테이블와 동일한 구조로 된 테이블 복사(empcp)
-- dept 테이블와 동일한 구조로 된 테이블 복사(deptcp)
create table empcp
as
select * from emp where 1=2;

create table deptcp
as
select * from dept where 1=2;

-- 2. emp 테이블에서 dept가 10, 20인 데이터  empcp 테이블에 삽입
--   모든 dept 데이터 deptcp 테이블에 삽입
insert into empcp
select * from emp
where deptno in (10, 20);

insert into deptcp
select * from dept;

-- 3. empcp 테이블 empno에 기본키 제약 조건, deptno에 deptcp 테이블의 deptno를 참조하는 외래키 제약   조건 추가
--   (오류 발생 시 원인 이유 설명 및 해결)
alter table empcp
add constraint empcp_empno_pk primary key(empno);

alter table empcp
add constraint empcp_deptno_fk foreign key(deptno) references deptcp(deptno)
on delete cascade;
-- 외래키를 설정하기 위해 참조하는 키는 반드시 고유키 또는 기본키여야 하는데 그렇지 않아 오류가 발생함
-- deptcp 테이블의 deptno에 기본키 제약 조건을 설정하여 해결한다
alter table deptcp
add constraint deptcp_deptno_pk primary key(deptno);

-- 4. empcp 테이블의 ename에 not null 제약 조건 지정
alter table empcp
modify ename constraint emp_ename_nn not null;
-- not null 제약 조건은 add 대신 modify 명령문을 사용

-- 5. 사용자 소유의 테이블 목록 조회
select *
from user_tables;

-- 6. 생성된 제약 조건 정보 조회
select constraint_name, constraint_type, table_name, R_CONSTRAINT_NAME
from user_constraints;

-- 7. empcp 테이블에 새로운 데이터 삽입
-- (7777,'hyupsung','CLERK',7782,'2000-01-23',1300,500,50);
-- 삽입 가능 한가? 오류가 발생했다면 오류 원인은?
insert into empcp values (7777, 'hyupsung', 'CLERK', 7782, '2000-01-23', 1300, 500, 50);
-- 삽입이 불가능, deptno에 값을 넣으려고 했지만 deptno가 참조하는 parent key에 50이 없어서 오류가 난다

-- 8. exceptions 테이블 생성(@?/rdbms/admin/utlexcpt.sql)
--    sql command line에서 실행
-- SQL> conn
-- Enter user-name: scott
-- Enter password:
-- Connected.
-- SQL> @?/rdbms/admin/utlexcpt.sql

-- Table created.

-- 9. empcp 테이블 deptno에 지정된 외래키 제약 조건 비활성화
alter table empcp
disable constraint empcp_deptno_fk;

-- 10. 다시 empcp 테이블에 새로운 데이터 삽입
-- (7777,'hyupsung','CLERK',7782,'2000-01-23',1300,500,50);
-- 삽입 가능한가?
insert into empcp values (7777, 'hyupsung', 'CLERK', 7782, '2000-01-23', 1300, 500, 50);
-- 삽입 가능하다

-- 11. empcp 테이블 deptno에 지정된 외래키 제약 조건 다시 활성화
-- (제약조건에 위배되는 데이터 행은 exceptions 테이블에 저장하도록 지정)
alter table empcp
enable validate constraint empcp_deptno_fk
exceptions into exceptions;

-- 12. exceptions 테이블 내용 조회
select * from exceptions;

-- 13. empcp 테이블에서 exceptions 테이블에 기록된 행과 일치하는 데이터(rowid, empno, deptno)을 조회
select rowid, empno, deptno
from empcp
where rowid in (select row_id from exceptions);

-- 14.위에서 조회된 데이터를 참고하여 무결성 제약조건에 위배되는 데이터 수정 
update empcp
set deptno = 20
where rowid = 'AAAFryAABAAALD5AAH';

-- 15. deptcp 테이블의 기본키 제약 조건 삭제 (참조하는 테이블이 존재할 경우 마지막에 cascade 옵션 사용)
alter table deptcp
drop constraint DEPTCP_DEPTNO_PK cascade;

-- 16. empcp, deptcp 테이블의 모든 데이터 삭제, exceptions 테이블 데이터도 삭제
truncate table empcp;
truncate table deptcp;
truncate table exceptions;

-- 17. empcp, deptcp 테이블 삭제
drop table empcp;
drop table deptcp;