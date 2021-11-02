--1.jones 보다 많은 봉급을 받는 사원명, 직급 검색
select ename, sal
from emp
where sal > any (select sal from emp where ename = 'JONES');

--2. 직속상사가 'jones'인 사원의 사원명, 입사일, 소속부서명 검색
select ename, hiredate, dname
from emp, dept
where mgr = (select empno from emp where ename = 'JONES') and emp.deptno = dept.deptno;

-- 3. 부서명 RESEARCH에 소속된 사원명, 봉급 검색(서브쿼리, exists 사용)
select ename, sal
from emp e
where exists (select * from dept d 
                        where e.deptno = d.deptno
                        and d.dname = 'RESEARCH');

-- 4. 30번에 근무하는 사원들의 모든 급여보다 많은 급여를 받는 사원명
select ename
from emp
where sal > all (select sal from emp where deptno = 30);

-- 5. 직급별 최소봉급을 받는 사원명, 봉급 검색
select ename, sal
from emp
where (job, sal) in (select job, min(sal) from emp group by job);