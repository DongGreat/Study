-- 데이터 언어
-- 데이터 정의어
-- 데이터 조작어
-- 데이터 제어어
-- 데이터 검색어(select)

-- 테이블 구조 생성, 변경 및 삭제하는 DDL(Data Definition Language)

-- 테이블 구조 생성
create table emp01 (
empno number(4),
ename varchar2(20),
sal number(7,2)
);

desc emp01;
select * from emp01;

-- 서브 쿼리로 테이블 생성(제약 조건 없이 생성)
create table emp01
as
select * from emp;

-- 레코드 없는 테이블 구조만 복사
create table emp01
as
select * from emp
where 1 = 2;

create table emp01
as
select ename, job, sal
from emp
where deptno = 10;

select * from emp01;

-- 테이블 구조 삭제
drop table emp01;

-- 테이블 구조 변경(alter table)
-- 새로운 컬럼 추가(add)
alter table emp01
add (memo varchar2(20));

desc emp01;

-- 기존 컬럼 수정(modify)
alter table emp01
modify (memo varchar2(30));

desc emp01;

-- 기존 컬럼 삭제(drop)
alter table emp01
-- drop (memo);
drop column memo;

-- 컬럼명 변경
alter table emp01
rename column memo to bigo;

-- 읽기 전용 테이블로 변경
alter table emp01
read only;

-- 읽고 쓰기
alter table emp01
read write;

-- 테이블의 내용을 추가, 수정, 삭제하는 DML(Data Manipulation Language)
-- 데이터 조작어

-- 새로운 행 삽입
create table emp01
as
select * from emp where 1=2;

select * from emp01;

insert into emp01(empno, ename, sal, hiredate, deptno)
values (7777, 'mkchoi', 3000, '2021/12/31', 10);

insert into emp01
values (8888, 'mkchoi', 'top', 7832, '2021/12/31', 5000, null, 20);

-- 기존 테이블 데이터를 기반으로 삽입
-- 서브쿼리로 다중 행 삽입
insert into emp01(empno, ename)
select empno, ename
from emp
where job = 'MANAGER';

insert into emp01
select *
from emp
where deptno in (10, 20);

-- 다중 테이블에 다중 행 입력
create table empmgr
as
select empno, ename, mgr, hiredate
from emp
where 1=2;

create table emphire
as
select empno, ename, hiredate, sal
from emp
where 1=2;

insert all
into empmgr values(empno, ename, mgr)
into emphire values(empno, ename, hiredate)
select empno, ename, mgr, hiredate
from emp
where deptno = 10;

select * from empmgr;
select * from emphire;

drop table empmgr;
drop table emphire;
truncate table empmgr;
truncate table emphire;

insert all
when hiredate >= '1985/1/1' then
into empmgr values(empno, ename, mgr, hiredate)
when sal >= 2000 then
into emphire values(empno, ename, hiredate, sal)
select empno, ename, mgr, hiredate, sal
from emp;

-- insert all vs first
create table empsal1 -- empsal2, empsal3 생성
as
select empno, ename, sal, job
from emp
where 1=2;

insert first
when sal >= 3000 then
        into empsal1 values(empno, ename, sal, job)
when sal >= 2000 then
        into empsal2 values(empno, ename, sal)
else
        into empsal3 values(empno, ename, sal)
select empno, ename, sal, job
from emp;

select * from empsal1;
select * from empsal2;
select * from empsal3;

delete from empsal1;
delete from empsal2;
delete from empsal3;

-- 테이블 내용을 수정하기 위한 update문

-- 모든 행 변경
-- 모든 사원의 봉급을 10% 인상된 값으로 수정
update empsal1
set sal = sal * 1.1;

-- 특정 행만 변경
-- 직급이 'MANAGER'인 사원의 봉급을 10% 인상된 값으로 수정
update empsal1
set sal = sal * 1.1
where job = 'MANAGER';

-- 'DALLAS'에 위치한 부서에 근무하는 사원들의 커미션을 50으로 변경
create table emp01
as
select *
from emp;

select * from emp01;

update emp01
set comm = 50
where deptno = (select deptno from dept where loc = 'DALLAS');

-- 다중 컬럼값 변경
update emp01
set hiredate = sysdate, sal = 10000, comm = 500
where ename = 'SCOTT';

-- 모든 사원의 급여, 입사일을 'KING' 사원의 급여, 입사일과 동일한 값으로 변경
update emp01
set (sal, hiredate) = (select sal, hiredate from emp where ename = 'KING');

-- 테이블의 데이터를 삭제하기 위한 Delete문
delete from emp01;

-- 조건에 맞는 특정행만 삭제
delete from emp01 where deptno = 10;

-- 서브쿼리 사용
-- 부서명이 'SALES'인 부서에서 근무하는 사원 정보 삭제
delete from emp01
where deptno = (select deptno from dept where dname = 'SALES');

-- 테이블 데이터 병합하기 위한 merge문 (update + insert)
create table empcp
as
select * from emp;

create table emp20
as
select * from emp
where deptno = 20;

select * from empcp;
select * from emp20;

-- empc 테이블의 데이터를 원본으로 emp20에 데이터가 이미 있으면 sal값 10% 인상(update), 없으면 새로 insert
merge into emp20
using empcp
    on (emp20.empno = empcp.empno)
when matched then
    update set emp20.sal = empcp.sal*1.1
when not matched then
    insert (empno, ename, sal) values(empcp.empno, empcp.ename, empcp.sal);

select * from empcp;
select * from emp20;