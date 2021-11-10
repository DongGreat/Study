-- 서브 쿼리

-- 1) 스칼라 서브쿼리(한 행, 한 컬럼만을 반환하는 서브쿼리 - SELECT 부속질의)
-- 2) 인라인 뷰(동적뷰) - FROM 부속질의
-- 3) 중첩질의: WHERE 부속질의 (상관 또는 비상관 형태)

-- 사원명, 봉급, 소속부서의 평균급여 검색
-- scott 사원의 소속부서 평균급여
select avg(sal)
from emp
where deptno = (select deptno from emp where ename = 'SCOTT');

-- 모든 사원의 이름, 봉급, 그 사원이 속한 부서의 평균봉급
select ename, sal, (select avg(sal) from emp where deptno = o.deptno)
from emp o;

-- 분석함수로
select ename, sal, avg(sal) over(partition by deptno)
from emp;

-- 부서명별 사원수
select dname, count(*)
from emp join dept
on emp.deptno (+) = dept.deptno
group by dname;

-- 부서번호별 사원수
select deptno, (select dname from dept where deptno = emp.deptno), count(*)
from emp
group by deptno;

-- 가장 많은 봉급을 받은 사원 5명 검색
-- top - n
select rownum, ename, sal
from (select ename, sal
        from emp
        order by sal desc)
where rownum <= 5;

select ename, sal
from emp
order by sal desc;

select rownum, ename
from emp
order by sal desc;

-- 소속부서 평균봉급보다 많은 봉급을 받는 사원명, 봉급, 평균봉급
-- 부서번호별 평균봉급 inline view
select ename, sal, asal
from emp a, (select deptno, avg(sal) asal
            from emp
            group by deptno) b
where a.deptno = b.deptno and sal > asal;

select deptno, avg(sal)
from emp
group by deptno;

select rownum, ename, sal
from emp
order by sal desc;

-- View: 가상 테이블
----------------------------
-- 단순 뷰                         복합 뷰
-- 하나의 테이블로 생성              여러개의 테이블로 생성
-- 그룹 함수 사용 불가능             그룹 함수 사용 가능
-- distinct 사용 불가능             사용 가능
-- dml (데이터 조작어) 사용 가능     사용 불가능
----------------------------

-- 뷰 생성 시 권한 불충분한 경우 권한 부여
-- SQL> conn / as sysdba;
-- GRANT CREATE VIEW to scott;

CREATE [or replace] [force | noforce] VIEW emp_dno30
as
SELECT empno, ename, job, deptno
FROM emp
WHERE deptno = 30
[with check option]
[with read only];

-- [or replace] 옵션: 뷰 수정 가능
-- [force] 옵션: 기본 테이블 존재 여부에 상관없이 뷰 생성 / 강제적으로 뷰를 만들어라
-- [noforce] 옵션: 기본 테이블이 존재할 경우에만 생성 (기본값)
-- [with check option] 옵션: 주어진 제약 조건에 맞는 데이터만 입력 및 수정 허용
-- [with read only] 옵션: select만 가능한 읽기 전용 뷰 생성

-- 뷰 생성
CREATE or replace VIEW emp_dno30
as
SELECT ename, job, sal, deptno
FROM emp
WHERE deptno = 30
with read only;

insert into emp_dno30 values('mkchoi', 'AN', 1000, 20);

select * from emp;

-- 오류 발생
update emp_dno30
set deptno = 10
where sal > 1000;

update emp_dno30
set sal = sal * 2
where sal > 1000;

rollback;

delete;

-- 뷰 조회
select *
from emp_dno30;

-- 뷰 정보 조회
desc user_views;

select view_name, text
from user_views;

데이터언어:
데이터정의어: 객체 생성(create), 수정(alter), 삭제(drop)
데이터조작어: 삽입(insert), 삭제(delete), 갱신(update)
데이터제어어:
데이터검색어: select

-- 사원명, 소속부서명, 직속상사명, 봉급, 입사일 검색
create or replace view emd(ename, dname, mname, sal, hiredate)
as
select e.ename, dname, m.ename, e.sal, e.hiredate
from emp e, emp m, dept
where e.mgr = m.empno (+) and e.deptno = dept.deptno;

-- 복합 뷰라서 수정은 불가능
select view_name, text, view_type, read_only
from user_views;

desc user_views;

select ename, mname
from emd
order by 2 desc;

select *
from emd;

select dname, count(*), avg(sal)
from emd
group by dname;

create view empsal
as
select ename, sal, job
from emp
order by sal desc;

select ename, sal
from empsal
where rownum <= 3;

select ename, sal
from (select ename, sal, job from emp order by sal desc)
where rownum <= 3;

-- 뷰 삭제
drop view empsal;
drop view emp_dno30;

-- Materialized View (MVIEW) - 구체화된 뷰 / 실체화된 뷰
SCOTT> CONN / AS SYSDBA;
SYS> GRANT query rewrite to scott;
SYS> GRANT create materialized view to scott;

-- MView 생성
CREATE MATERIALIZED VIEW m_emp
build immediate
refresh on demand
-- enable query rewrite
as
select deptno, count(*)
from emp
group by deptno;

-- MView 삭제
drop materialized view m_emp;