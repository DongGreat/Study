-- 다중 데이터 조인
-- 사원명, 관리자명, 소속부서명
-- 사원명, 관리자명
select e.ename 사원명, m.ename 관리자명
from emp e, emp m
where e.mgr = m.empno;
-- +
select ename, dname
from emp, dept
where emp.deptno = dept.deptno;

select e.ename 사원명, m.ename 관리자명, dname 소속부서명
from emp e, emp m, dept
where e.mgr = m.empno and e.deptno = dept.deptno;

select e.ename 사원명, m.ename 관리자명, dname 소속부서명
from emp e join emp m on e.mgr = m.empno
            join dept on e.deptno = dept.deptno;
            
-- 'SALESMAN'인 사원에 한하여
select e.ename 사원명, m.ename 관리자명, dname 소속부서명
from emp e, emp m, dept
where e.mgr = m.empno and e.deptno = dept.deptno and e.job = 'SALESMAN';

select e.ename 사원명, m.ename 관리자명, dname 소속부서명
from emp e join emp m on e.mgr = m.empno
            join dept on e.deptno = dept.deptno
where e.job = 'SALESMAN';

-- 외부조인
select e.ename 사원명, m.ename 관리자명, dname 소속부서명
from emp e, emp m, dept
where e.mgr = m.empno(+) and e.deptno(+) = dept.deptno;

select e.ename 사원명, m.ename 관리자명, dname 소속부서명
from emp e left outer join emp m on e.mgr = m.empno
            right outer join dept on e.deptno = dept.deptno;
            
-- 소속부서가 없는 사원정보 추가 행
INSERT INTO emp(empno, ename, job, mgr, hiredate, sal)
VALUES(7777, 'MKCHOI', 'ANALYST', 7782, '88/10/10', 3000);

-- 모든 사원명, 모든 부서명 검색(소속부서가 없는 사원명, 소속사원이 없는 부서도 검색)
select ename 사원명, dname 소속부서명
from emp full outer join dept
on emp.deptno = dept.deptno;

select e.ename 사원명, m.ename 관리자명, dname 소속부서명
from emp e left outer join emp m on e.mgr = m.empno
            full outer join dept on e.deptno = dept.deptno;
            
-- 서브쿼리: 하나의 SELECT 문장의 절 안에 포함된 또 하나의 SELECT 문장
-- (메인쿼리-outer 쿼리, 서브쿼리-inner 쿼리)

-- 전체사원들의 평균봉급보다 많은 봉급을 받는 사원명, 봉급 검색
select avg(sal)
from emp;

select ename, sal
from emp
where sal > 2209;

select ename, sal
from emp
where sal > (select avg(sal) from emp);

-- 단일행 서브쿼리: 서브쿼리의 실행결과가 1건 이하인 서브쿼리
-- 단일행 비교연산자(=, <, <=, >, >=, <>)와 함께 사용
-- 다중행 서브쿼리: 서브쿼리의 실행결과가 여러 개인 서브쿼리
-- 다중행 비교연산자(in, any, all, some, exists)

-- 'SCOTT'과 동일한 직급을 가진 사원명, 봉급
select ename, sal
from emp
where job = (select job from emp where ename='SCOTT');

-- 자신의 직속상사가 'KING'인 사원명, 급여 검색
select ename, sal
from emp
where mgr = 7839;

-- IN 연산자
-- 'CHICAGO', 'DALLAS'에 위치한 부서에 소속된 사원명 검색
select ename
from emp
where deptno in (select deptno from dept where loc in ('CHICAGO', 'DALLAS'));

-- ANY 연산자
-- 직급이 SALESMAN인 사원들의 어떠한 급여보다 많은 급여를 받는 사원명 검색
select ename, sal
from emp
where sal >= any (select sal from emp where job = 'SALESMAN');

-- 동일
select ename, sal
from emp
where sal >= any (select min(sal) from emp where job = 'SALESMAN');

select sal
from emp
where job = 'SALESMAN';

-- ALL 연산자
-- 직급이 SALESMAN인 사원들의 모든 급여(1600, 1500, 1250)보다 많은 급여를 받는 사원명 검색
select ename, sal
from emp
where sal >= all (select sal from emp where job = 'SALESMAN');

-- EXISTS 연산자 (상호연관쿼리)
select ename, job
from emp o
where exists (select * from emp where mgr = o.empno);

-- 관리사원(부하직원)이 있는 사원이름(관리자명), 직급 검색
select ename, job
from emp
where empno in (select distinct mgr from emp);

select ename, job
from emp
where empno = any (select distinct mgr from emp);

-- 관리자 번호 검색
select distinct mgr
from emp;

-- 소속사원이 있는 부서명 검색
select dname
from dept
where deptno in (select deptno from emp);

select dname
from dept -- (10, 20, 30, 40)
where exists (select * from emp where deptno = dept.deptno);

-- 소속사원이 없는 부서명 검색
select dname
from dept
where deptno not in (select deptno from emp where deptno is not null);

select dname
from dept -- (10, 20, 30, 40)
where not exists (select * from emp where deptno = dept.deptno);

-- 'SCOTT'과 동일한 부서에서 근무하고 직급이 동일한 사원명 검색
select ename
from emp
where (deptno, job) = (select deptno, job from emp where ename = 'SCOTT') and ename <> 'SCOTT';

-- 'SCOTT'과 동일한 직급을 가진 사원명 검색
select ename
from emp o
where exists (select * from emp i where i.ename = 'SCOTT'
                                  and i.job = o.job);
                                  
-- 'SCOTT'과 동일한 부서에 속한 사원명 검색
select ename
from emp o
where exists (select * from emp i where i.ename = 'SCOTT'
                                  and i.deptno = o.deptno);

select ename
from emp
where deptno = (select deptno from emp where ename = 'SCOTT');

-- 다중 컬럼 서브쿼리

-- 최대봉급을 받는 사원명
select ename
from emp
where sal = (select max(sal) from emp);

-- 부서별 최대봉급을 받는 사원명
select deptno, ename
from emp
where (deptno, sal) in (select deptno, max(sal) from emp group by deptno);

select deptno, ename
from emp o
where sal = (select max(sal) from emp i where o.deptno = i.deptno);