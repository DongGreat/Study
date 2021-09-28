-- 1. 사원들의 이름, 년봉(봉급sal *12)-천단위구분기호/$기호표시, 세금(년봉의 3.3%)
select ename 사원명, to_char(sal*12, '$999,999') 연봉, to_char(round(sal*12*0.033), '$999,999') 세금
from emp;

-- 2. 입사일이 1,2,3월인 사원들의
-- 입사일을 기준으로 현재까지 사원들의 사원명, 입사일, 근무일수, 근무개월수, 근무년수 출력
select ename 사원명, hiredate 입사일, trunc(sysdate-hiredate, 0) 근무일수, 
        trunc(months_between(sysdate, hiredate), 0) 근무개월수, trunc((sysdate-hiredate)/365, 0) 근무년수
from emp
where to_char(hiredate, 'mm') between '01' and '03';

-- 3. 사원명의 마지막 글자를 '*' 문자로 치환, 입사일의 일(day)를 '*'으로 변경해서 출력하시오.
select replace(ename, substr(ename, -1, 1), '*') 사원명, replace(hiredate, substr(hiredate, -2, 2), '**') 입사일
from emp;

-- 4. 사원번호가 짝수인 사원들의 
-- 사원명을 10자리로 출력하되 왼쪽 빈자리는 '*'기호로 채워 출력하고,
-- 사원명 마지막 문자'S'는 제거 후 출력
select lpad(ename, 10, '*') 사원명1, rtrim(ename, 'S') 사원명2
from emp
where mod(empno, 2) = 0;