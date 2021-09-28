-- 사원들의 직급을 중복되지 않도록 검색
select distinct job
from emp;

-- 10번이나 30번에 소속된 사원명 검색
select ename, deptno
from emp
where deptno in (10, 30);
-- where deptno = 10 or deptno = 30;

-- 관리자가 널인 사원명 검색
select ename
from emp
where mgr is null;

-- 사원명, 입사일을 검색(가장 오래전에 입사한 사원이 먼저 출력되도록)
select ename, hiredate
from emp
order by hiredate asc;

-- 1981년대 입사한 사원명 검색
select ename, hiredate
from emp
where hiredate like '81%';