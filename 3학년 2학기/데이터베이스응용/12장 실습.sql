CREATE TABLE empcp(
    EMPNO       NUMBER(4, 0) primary key, -- not null, unique
    ENAME       VARCHAR2(10) unique,
    JOB         VARCHAR2(9) constraint empcp_job_nn not null,
    MGR         NUMBER(4, 0),
    HIREDATE    DATE,
    SAL         NUMBER(7, 2) check (sal > 500),
    COMM        NUMBER(7, 2),
    DEPTNO      NUMBER(2, 0) references dept(deptno));
    
insert into empcp values (8888, 'SMITH2', 'CLERK', 7902, '1980-12-17', 300, null, 20);

-- pk 제약 조건 추가
alter table dept
add constraint dept_deptno_pk primary key(deptno);

desc user_constraints;

-- 제약 조건 조회
select constraint_name, constraint_type, table_name, R_CONSTRAINT_NAME
from user_constraints;

-- 어떤 컬럼에 어떤 제약 조건이 지정되었는지 조회
select *
from user_cons_columns;

create table DEPT (
    DEPTNO      NUMBER(2, 0),
    DNAME       VARCHAR2(14),
    LOC         VARCHAR2(13));
    
-- 외래키 제약 조건
ALTER TABLE empcp
ADD CONSTRAINT empcp_deptno_fk FOREIGN KEY(deptno) REFERENCES dept(deptno)
-- ON DELETE CASCADE;
on delete set null;

ALTER TABLE empcp
ADD CONSTRAINT empcp_mgr_fk FOREIGN KEY(mgr) REFERENCES empcp(empno)
-- ON DELETE CASCADE;
on delete set null;

-- 기존 제약 조건 삭제
alter table empcp
drop CONSTRAINT SYS_C007437;

select * from empcp;
select * from dept;

insert into empcp values (7369, 'SMITH', 'CLERK', 7902, '1980-12-17', 800, null, 20);
insert into empcp values (7499, 'ALLEN', 'SALESMAN', 7698, '1981-02-20', 1600, 300, 30);
insert into empcp values (7521, 'WARD', 'SALESMAN', 7698, '1982-02-22', 1250, 500, 30);
insert into empcp values (9999, 'mkchoi', 'CLERK', 7902, '1980-12-17', 700, null, 20);

delete from dept where deptno = 20;

delete empcp;

-- 제약 조건 비활성화/활성화 (enable/disable)
alter table empcp
disable constraint EMPCP_MGR_FK;

alter table empcp
enable constraint EMPCP_MGR_FK;

insert into empcp values (7788, 'SM', null, 9999, '1980-12-17', 600, null, 30);

-- validate/novalidate (exceptions 테이블 활용)

-- 사용자 테이블 목록
select 'drop table ' || table_name || ' cascade constraints;'
from user_tables;

drop table emp cascade constraints;

drop table EMP cascade constraints;
drop table DEPT cascade constraints;
drop table EMPCP cascade constraints;

-- 제약 조건 조회
select table_name, constraint_name, constraint_type
from user_constraints;

desc user_constraints;

-- 제약 조건 추가 (not null)
alter table emp
modify ename constraint emp_empname_nn not null;

-- 제약 조건 추가 (pk)
alter table emp
add constraint emp_empno_pk primary key(empno);

insert into emp values (7782, 'mkchoi', 'CLERK', 7902, '1980-12-17', 800, null, 20);

-- 제약 조건 비활성화
alter table emp
disable constraint emp_empname_nn;

alter table emp
disable constraint emp_empno_pk;

insert into emp values (1111, null, 'CLERK', 7902, '1980-12-17', 800, null, 20);

select * from emp;

-- 제약 조건 활성화
alter table emp
enable novalidate constraint emp_empname_nn; -- 기존 데이터의 제약 조건 만족 여부 체크 X

alter table emp
enable validate constraint emp_empname_nn; -- 만족하는지 검사

alter table emp
enable validate constraint emp_empno_pk
exceptions into exceptions;

select * from exceptions;

alter table emp
enable validate constraint emp_empname_nn
exceptions into exceptions;

select * from exceptions;

update emp
set ename = 'mkchoi'
where rowid = 'AAAFrUAABAAALCxAAN';

select rowid, ename
from emp
where rowid in (select row_id from exceptions);

select rowid, empno
from emp
where rowid in (select row_id from exceptions);

update emp
set empno = 9977
where rowid = 'AAAFrUAABAAALCxAAP';

select rowid, ename
from emp;

truncate table exceptions;

select * from emp;