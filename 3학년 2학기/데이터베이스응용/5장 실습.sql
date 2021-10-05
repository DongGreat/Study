-- 그룹함수(집단함수): count, sum, max, min, avg, stddev, variance
-- 사원수, 평균봉급, 최대봉급
select count(ename), count(comm), count(*)
from emp;

select round(avg(sal)), sum(sal), max(sal), min(sal), round(stddev(sal)), round(variance(sal))
from emp;

select avg(comm), avg(nvl(comm, 0)), count(comm), count(nvl(comm, 0)) "count(nvl(comm, 0))" -- null을 0으로 간주함
from emp;

select max(hiredate), min(hiredate)
from emp;

-- group by 절
-- 전체 사원들의 평균 봉급
select avg(sal)
from emp;

-- 10번 부서에 소속된 사원들의 평균 봉급
select avg(sal)
from emp
where deptno=10;

-- 부서번호를 기준으로 정렬
select deptno, ename
from emp
order by 1, ename; -- asc/desc

-- 부서번호별 평균 봉급
select deptno, round(avg(sal)), sum(sal), count(*), max(sal)
from emp
group by deptno
order by 1;

-- 부서번호별 평균 봉급이 2000 이상인 부서에 한하여 평균 봉급 검색
select deptno, round(avg(sal), 5), sum(sal), count(*), max(sal)
from emp
group by deptno
having avg(sal) >= 2000
order by 1;

-- 분석 함수(윈도 함수)
-- rollup(), cube(), grouping sets()
select deptno, count(*)
from emp
group by deptno
order by 1;

-- 부서별 인원수 + 전체 인원수 검색
select deptno, count(*)
from emp
group by rollup(deptno)
-- group by cube(deptno)
order by 1;

-- 부서별 직급별 인원수 검색
select deptno, job, count(*)
from emp
group by deptno, job
order by 1;

-- 부서별 직급별 인원수 검색 + 부서별 인원수 + 전체 인원수
select deptno, job, count(*)
from emp
group by rollup(deptno, job)
order by 1;

-- 부서별 직급별 인원수 검색 + 부서별 인원수 + 직급별 인원수 + 전체 인원수
select deptno, job, count(*)
from emp
group by cube(deptno, job)
order by 1;

-- grouping sets() 함수
-- 부서별 인원수 + 직급별 인원수
select deptno, job, count(*)
from emp
group by grouping sets(deptno, job);
-- 동일
-- group by grouping sets((deptno), (job));

-- 부서별 인원수 + 직급별 인원수 + 전체 인원수
select deptno, job, count(*)
from emp
group by grouping sets(deptno, job, ());

-- 부서별 직급별 인원수
select deptno, job, count(*)
from emp
group by grouping sets((deptno, job))
order by deptno;

-- 부서별 직급별 인원수 + 전체 인원수
select deptno, job, count(*)
from emp
group by grouping sets((deptno, job), ())
order by deptno;

-- 부서번호별 사원명
select deptno, ename
from emp
order by deptno;

-- listagg(): 데이터를 가로로 출력, group by()절 필수
select deptno 부서번호, listagg(ename, ',') within group (order by hiredate) 사원명
from emp
group by deptno;

-- 집합연산자: union, union all, intersect, minus (컬럼 갯수 동일, 컬럼 데이터형 일치)
select deptno, count(*)
from emp
group by deptno
union
select null deptno, count(*)
from emp;

