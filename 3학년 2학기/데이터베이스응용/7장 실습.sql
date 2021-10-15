-- 'smith' 사원의 봉급순위 검색
select ename, rank() over(order by ename desc)
from emp;

-- sal 안에서 2000이라는 값의 순위
select rank('2000') within group (order by sal)
from emp;

-- 이름순으로 정렬 후 smith 위치
select rank('SMITH') within group (order by ename)
from emp;

select ename
from emp
order by ename;

-- ntile()
select ename, sal, ntile(4) over (order by sal)
from emp;

-- keep() 함수
-- min/max() keep (dense_rank first/last order by)

-- 부서별 최대급여, 최소급여
select deptno, max(sal), min(sal)
from emp
group by deptno;

-- 부서번호별 최대급여, 최대급여수급자
select deptno, max(sal) 최대급여, 
        min(ename) keep (dense_rank first order by sal desc) 최대급여수급자
from emp
group by deptno;

-- 최대급여, 최대급여수급자
select max(sal) 최대급여, max(ename) keep (dense_rank first order by sal desc) 최대급여수급자
from emp;

-- 부서번호별 최소급여, 최소급여수급자
select deptno, min(sal) 최소급여,
        max(ename) keep (dense_rank last order by sal desc) 최소급여수급자
from emp
group by deptno;

-- keep() + over(): 분석함수 모든 사원들의 값을 보려면 분석함수를 써야 함
-- 모든 사원들 사원명, 봉급, 최대봉급, 최대봉급수급자, 소속부서내최대봉급, 소속부서내최대봉급수급자
-- select ename, sal, max(sal) (집계함수라 오류가 남, 하나의 값만 리턴)
select ename 사원명, sal 봉급, max(sal) over() 최대봉급,
        max(ename) keep(dense_rank first order by sal desc) over() 최대봉급수급자,
        max(sal) over(partition by deptno) 소속부서내최대봉급,
        max(ename) keep(dense_rank first order by sal desc) over(partition by deptno) 소속부서내최대봉급자
from emp;

-- first_value(), last_value() + over()
select ename, sal, deptno,
        max(sal) over(),
        first_value(ename) over(order by sal desc) 최대봉급수급자,
        last_value(job) over(order by sal rows between current row and unbounded following) 최대봉급수급자의직급,
        max(sal) over(partition by deptno) 부서내최대봉급,
        first_value(ename) over(partition by deptno order by sal desc) 부서내최대봉급수급자
from emp
order by deptno;

-- 조인
-- 사원명, 소속부서명 검색
-- emp: 사원명, 소속부서번호
-- dept: 부서번호, 부서명

-- cross 조인
select ename, e.deptno, d.deptno, dname
from emp e, dept d;

select ename, e.deptno, d.deptno, dname
from emp e cross join dept d;

-- 사원명, 소속부서명 검색
-- 등가(equit) 조인
select ename, dname
from emp, dept
where emp.deptno = dept.deptno;

-- ANSI 표준 표기법
select ename, dname
from emp e inner join dept d
on e.deptno = d.deptno;
--
select ename, dname
from emp e natural join dept d;
-- on e.deptno = d.deptno;
--
select ename, dname
from emp e join dept d
using (deptno);

-- self 조인
-- 사원명, 관리자명 검색
select e.ename 사원명, m.ename 관리자명
from emp e, emp m
where e.mgr = m.empno;

select e.ename 사원명, m.ename 관리자명
from emp e join emp m
on e.mgr = m.empno;

-- 관리자명이 'KING'인 사원들의 이름, 직급 검색
select e.ename 사원명, m.ename 관리자명, e.job 직급
from emp e, emp m
where e.mgr = m.empno and m.ename='KING';

select e.ename 사원명, m.ename 관리자명
from emp e join emp m on e.mgr = m.empno
where m.ename='KING';

-- 외부조인
-- 사원명, 소속부서명 검색, 소속 사원이 없는 부서명도 출력되도록
select ename, dname
from emp, dept
where emp.deptno(+) = dept.deptno;

10      10
20      20
30      30
        40
left    right
-- outer join: left / right / full
select ename, dname
from emp e right outer join dept d on e.deptno = d.deptno;

-- 관리자명이 'KING'인 사람들의 이름, 직급 (관리자가 없는 사원명도 출력되도록)
select e.ename 사원명, m.ename 관리자명, e.job
from emp e, emp m
where e.mgr = m.empno(+);

select e.ename 사원명, m.ename 관리자명, e.job
from emp e left outer join emp m on e.mgr = m.empno;