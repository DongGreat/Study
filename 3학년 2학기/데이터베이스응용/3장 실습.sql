-- 문자 함수
select ename, initcap(ename), upper(ename), lower(ename) -- 앞 글자만 대문자로 출력, 대문자, 소문자
from emp;

select ename, length(ename), lengthb(ename) -- 문자의 길이, 문자의 길이의 바이트 값
from emp;

select length('김동현'), lengthb('김동현')
from dual; -- 더미 테이블

-- concap() 문자열 결합
select concat(ename, sal), ename || sal
from emp;

select ename, substr(ename, 1, 3), substr(hiredate, 1, 2) year, substr(hiredate, 4, 2) month,
        substr(hiredate, -2, 2) day
--ename의 1번째 값부터 3개 출력, hiredate 4번째 값부터 2개 출력
from emp;

select substr('김동현', 2, 2)
from dual;

-- instr('문자열' 또는 컬럼, 찾는 문자, 시작 위치, 몇 번째인지(1))
select instr('a-b-c-d-e', 'c', 1), instr('a-b-c-d-e', '-', 1, 2)
from dual;

select instr(hiredate, '/', 1, 2)
from emp;

-- lpad('문자열' 또는 컬럼, '자릿수', '채울문자')
select lpad('dhkim', 10, '*'), rpad('dhkim', 10, '#')
from dual;

-- ltrim('문자열' 또는 '컬럼', '제거할 문자')
select ltrim('      dhkim      d', ' '), rtrim('      dhkim      d', ' ')
from dual;

-- replace('문자열' 또는 컬럼, '문자1', '문자2')
select replace('dhkim', 'kim', 'lee')
from dual;

select replace(ename, substr(ename, 1, 1), '*')
from emp;


-- 숫자 함수
select round(123.456, 0), round(123.456, 1), round(123.456, -1) -- 반올림
from dual;

select trunc(123.456, 0), trunc(123.456, 1), trunc(123.456, -1) -- 버림
from dual;

select 10+2, 10-2, 10*2, 10/2
from dual;

select mod(10, 2) 나머지, ceil(123.456) 가장가까운큰정수, floor(123.456) 가장가까운작은정수
from dual;

select power(2, 8) -- 2의 8승
from dual;


-- 날짜 함수
select sysdate 현재날짜, sysdate+100, sysdate-100
from dual;

-- 사원명, 입사일(hiredate), 근무일수
select ename, hiredate 입사일, round(sysdate-hiredate, 0) 근무일수, 
        round((sysdate-hiredate)/365, 0) 근무년수
from emp;

select ename, round(months_between(sysdate, hiredate), 0) 근무개월수
from emp;

select add_months(sysdate, 27), last_day(sysdate), next_day(sysdate, '금')
        -- 오늘 날짜를 기준으로 27개월 뒤, 오늘 날짜를 기준으로 달의 마지막에 해당하는 날짜, 다음으로 오는 날짜
from dual;

select sysdate, round(sysdate), trunc(sysdate) -- 오후에 작업했다면 round에서 다음 날짜가 나옴
from dual;

-- 형변환 함수
desc emp;

-- 오라클이 문자를 자동으로 숫자로 변환 묵시적으로 형변환
select 2 + '3'
from dual;

-- 명시적으로 형변환 (TO_CHAR, TO_NUMBER, TO_DATE)
select 2 + to_number('10')
from dual;

-- to_char(날짜 -> 문자)
-- yyyy/year/yy, mm/month, day(요일), dd/ddth, hh/hh24, mi, ss
select sysdate, to_char(sysdate, 'yyyy'), to_char(sysdate, 'mm'), to_char(sysdate, 'dd')
from dual;

select ename, to_char(hiredate, 'yyyy'), to_char(hiredate, 'mm'), to_char(hiredate, 'day')
from emp;

-- to_char(숫자 -> 문자)
select to_char(1234.56, '9,999'), to_char(1234.56, '$9,999.9'), to_char(1234.56, 'l9,999') -- L = 원
from dual;

select ename, sal, to_char(sal, '9,999')
from emp;

-- to_number()
select 2 + to_number('3')
from dual;

-- to_date()
select to_date('21/10/10'), extract(year from to_date('21/10/10'))
from dual;

select ename, hiredate, extract(year from hiredate), extract(month from hiredate),
        extract(day from hiredate)
from emp;

-- 1981년도에 입사한 사원명 검색
select ename, hiredate
from emp
-- where hiredate between '81/01/01' and '81/12/31';
-- where extract(year from hiredate) = 1981;
where to_char(hiredate, 'yyyy') = '1981';