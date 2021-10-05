-- 1. 사원명, 봉급, 커미션, 비고 검색
-- 비고열은 comm이 널이 경우 'NO', 널이 아닌 경우 'YES'로 출력 (nvl/nv2함수 사용)
select ename, sal, comm, nvl2(comm, 'YES', 'NO') 비고
from emp;

-- 2. 사원명, 직급, 보너스 검색
-- 보너스는 직급(job)이 CLERK이면 봉급의 5%, SALESMAN이면 봉급의 10%, 그외는 봉급의 3% 지급
-- decode함수, case 문 사용하여 검색
select ename 사원명, job 직급, decode(job, 'CLERK', sal*0.05, 
                                    'SALESMAN', sal*0.1,
                                    sal*0.03) 보너스
from emp;
select ename 사원명, job 직급, case when job='CLERK' then sal*0.05
                                    when job='SALESMAN' then sal*0.1
                                    else sal*0.03
                                    end 보너스
from emp;

--3. 이름이 A,E,I,O,U 중 하나로 시작하는 사원명 검색 (regexp_like() 사용)
select text from reg
where regexp_like(text, '^[A|E|I|O|U]');

-- 4. 이름의 마지막 문자를 '*' 문자로 치환, 입사입의 '/'문자를 '-'문자로 치환하여 출력
-- regexp_replace()함수 사용
select regexp_replace(ename, '[A-Z]$', '*') 사원명, regexp_replace(hiredate, '/', '-') 입사일
from emp;

-- 5. 사원명, 봉급, 이름문자열내에 'S'문자갯수, 봉급값중 0의 갯수 출력
--regexp_count()함수 사용
select ename 사원명, sal 봉급, regexp_count(ename, 'S') "문자 개수", regexp_count(sal, '0') "0의 개수"
from emp;