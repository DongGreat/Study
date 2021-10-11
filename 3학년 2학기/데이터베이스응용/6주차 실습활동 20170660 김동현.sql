
--6th_실습활동
----------------

-- 1. 급여+커미션  값의 최대/최소/평균값 검색
-- 커미션이 널인 경우 0으로 계산, 출력 금액은 모두 소수 첫째자리까지 출력
select round(max(sal + nvl(comm, 0)), 1) 최대, 
       round(min(sal + nvl(comm, 0)), 1) 최소,
       round(avg(sal + nvl(comm, 0)), 1) 평균
from emp;


-- 2. 부서별/년도별 입사한 사원수 검색 (group by절,가로로 출력 pivot 이용)
select deptno, extract(year from hiredate) 년도, count(*) 사원수
from emp 
group by deptno, extract(year from hiredate)
order by deptno;


-- 3. 부서별/년도별 입사한 사원수 검색 (가로로 출력) - pivot 이용
select *
from (select deptno, to_char(hiredate, 'yyyy') 연도 from emp)
pivot (count(*) for 연도 in ('1980', '1981', '1982', '1987'))
order by deptno;
-- pivot 절에는 to_char을 쓸 수 없음


-- 4. 사원명, 봉급, 입사일, 소속부서평균봉급, 입사순서, 봉급비율, 먼저입사한사원명 검색
select ename, sal, hiredate,
        round(avg(sal) over (partition by deptno)) 소속부서평균봉급,
        rank() over(order by hiredate asc) 입사순서,
        ltrim(round(ratio_to_report(sal) over(), 3)) 봉급비율,
        lag(ename, 1) over(order by hiredate) 선임사원명
from emp;