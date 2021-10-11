-- 부서별 급여 총액
select deptno, sum(sal)
from emp
group by deptno
order by deptno;

-- 부서별 급여 총액 (가로로 출력: decode() 함수)
select sum(decode(deptno, 10, sal)) "10번부서총봉급",
       sum(decode(deptno, 20, sal)) "20번부서총봉급",
       sum(decode(deptno, 30, sal)) "30번부서총봉급"
from emp;

-- 부서별 급여 총액 (가로로 출력: pivot() 함수)
select *
from (select deptno, sal from emp)
pivot (sum(sal) for deptno in (10, 20, 30));

-- 부서별/직급별 인원 수 검색 (decode())
select deptno, count(decode(job, 'SALESMAN', empno)) salseman,
               count(decode(job, 'CLERK', empno)) clerk,
               count(decode(job, 'MANAGER', empno)) manager
from emp
group by deptno
order by deptno;

-- 부서별/직급별 인원 수 검색 (pivot())
select *
from (select deptno, job from emp)
pivot (count(*) for job in ('SALESMAN', 'CLERK', 'MANAGER', 'PRESIDENT', 'ANALYST'))
order by deptno;

-- 그룹함수 (집단함수, 집계함수) - sum, count, max, min, avg...
-- 그룹함수는 하나의 값

-- 분석함수 (윈도함수) over()
-- 분석함수는 행 단위로
-- 그룹 내 순위 관련: rank(), dense_rank(), row_number()
-- 그룹 내 집계 관련: sum, count, max, min, avg
-- 그룹 내 순서 관련: lag(), lead()
-- 그룹 내 비율 관련: ratio_to_report()

select sum(sal)
from emp;

-- 사원명, 봉급순위
select ename, sal, hiredate,
                   rank() over(order by sal desc) 봉급순위1,
                   dense_rank() over(order by sal desc) 봉급순위2,
                   row_number() over(order by sal desc, hiredate) 봉급순위3
from emp;

-- 동일부서내 봉급순위
select ename, sal, hiredate, deptno,
                   rank() over(order by sal desc) 봉급순위,
                   rank() over(partition by deptno order by sal desc) 부서내봉급순위
from emp
order by deptno;

-- 사원명, 봉급, 전체봉급
select ename, sal, deptno,
                   sum(sal) over() 전체봉급, 
                   sum(sal) over (order by empno) 누적봉급,
                   sum(sal) over (partition by deptno) 부서별봉급총액,
                   round(avg(sal) over (partition by deptno)) 평균
from emp
order by deptno;

-- lag(): 이전 행의 값 출력
-- lead(): 다음 행의 값 출력

select ename, hiredate, lag(sal, 1, 0) over (order by hiredate),
                        lead(sal, 2, 0) over (order by hiredate)
from emp;

-- 사원명, 봉급, 봉급총액, 비율(봉급/전체봉급합계)
select ename, sal, sum(sal) over (),
                   round(sal / sum(sal) over()*100, 3) || '%' 비율,
                   round(ratio_to_report(sal) over(), 3) 비율
from emp;

-- 사원명, 봉급, 봉급총액, 비율(봉급/동일부서내봉급총액)
select ename, sal, deptno,
                   sum(sal) over() 전체봉급총액,
                   sum(sal) over(partition by deptno) 부서별봉급총액,
                   round(sal / sum(sal) over(partition by deptno)*100, 3) || '%' 부서별비율,
                   round(ratio_to_report(sal) over(partition by deptno), 3) 부서별비율
from emp
order by deptno;

-- 부서별 직원급여총액 비율(group by절 사용)
select deptno, sum(sal) 부서별봉급총액, sum(sum(sal)) over() 봉급총액,
               round(sum(sal) / sum(sum(sal)) over(), 3) "2",
               round(ratio_to_report(sum(sal)) over(), 3) "3"
from emp
group by deptno;