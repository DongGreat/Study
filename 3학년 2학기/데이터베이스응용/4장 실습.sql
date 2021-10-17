-- 일반함수 (nvl, nvl2)
-- 사원명, 봉급, 커미션, 연봉(sal*12+comm), comm이 null인 경우 0으로 계산
select ename, sal, comm, sal*12+nvl(comm, 0) 연봉, sal*12+nvl2(comm, comm, 0) 연봉
from emp;

-- nvl(comm, 50) 동일 nvl2(comm, comm, 50) nvl comm이 null이면 50, nvl2 comm이 null이 아니면 comm이 null이면 50
select ename, comm, nvl(to_char(comm), 'no_comm'), nvl2(comm, 'O', 'X')
from emp;

-- 사원번호, 관리자번호 검색(관리자번호가 null인 경우 'CEO'로 출력)
select empno, nvl(to_char(mgr), 'CEO'), nvl2(to_char(mgr), 'job', 'CEO')
from emp;

-- decode
-- 사원명, 소속부서명
select ename, deptno, decode(deptno, 10, '10번부서소속', 20, '20번부서소속', '그외부서소속') 소속부서명
from emp;

-- case문
select ename, deptno, case when deptno=10 then '10번부서소속'
                            when deptno=20 then '20번부서소속'
                            else '그외부서소속'
                        end 소속부서명
from emp;

-- 사원번호 홀수/짝수 'odd'/'even' 0이면 even 아니면 odd
select ename, empno, decode(mod(empno, 2), 0, 'even', 'odd') 비고1,
                        case when mod(empno, 2)=0 then 'even'
                        else 'odd'
                        end 비고2
from emp;

-- 사원명, 입사일, 입사시기(분기)
-- 1~3월: 1분기, 4~6월: 2분기, 7~9월: 3분기, 10~12월: 4분기
select ename, hiredate, case when extract(month from hiredate) >=1 and extract(month from hiredate) <=3 then '1분기'
                            when extract(month from hiredate) between 4 and 6 then '2분기'
                            when extract(month from hiredate) between 7 and 9 then '3분기'
                            when extract(month from hiredate) between 10 and 12 then '4분기'
                            end 분기
from emp;

-- 정규식예제테이블.sql 실행
-- 테이블 삭제 명령어
drop table reg;

-- 테이블 생성 명령어
CREATE TABLE reg
(text varchar2(10));

INSERT INTO reg VALUES('ABC123');
INSERT INTO reg VALUES('XYZ123');
INSERT INTO reg VALUES('xyz123');
INSERT INTO reg VALUES('ABC 123');
INSERT INTO reg VALUES('ABC  123');
INSERT INTO reg VALUES('abc 123');
INSERT INTO reg VALUES('abc  123');
INSERT INTO reg VALUES('a1b2c3');
INSERT INTO reg VALUES('aabbcc123');
INSERT INTO reg VALUES('?/!@#$*&');
INSERT INTO reg VALUES('\~*();.,');
INSERT INTO reg VALUES(123123);
INSERT INTO reg VALUES('123abc');
INSERT INTO reg VALUES('123ABC');
INSERT INTO reg VALUES('abc');
INSERT INTO reg VALUES('ABC');

select * from reg;

-- regexp_like 함수
select text
from reg
where regexp_like(text, '[A-Z]');

-- 'a' 문자를 포함하고 있는 행 검색
select text from reg
where regexp_like(text, 'a');

-- 대/소문자를 포함하는 행 검색
select text from reg
-- where regexp_like(text, '[a-zA-Z]');
where regexp_like(text, '[[:alpha:]]');

-- 소문자로 뒤에 공백을 포함하는 행 검색
select text from reg
where regexp_like(text, '[a-z] ');

-- 소문자로 시작하는 행 검색
select text from reg
where regexp_like(text, '^[a-z]');

-- 소문자로 끝나는 행 검색
select text from reg
where regexp_like(text, '[a-z]$');

-- 공백을 포함하고 있는 행 검색
select text from reg
where regexp_like(text, '[[:space:]]'); -- alpha [a-zA-Z] digit[0-9]

-- 대문자가 연속으로 3글자 이상 있는 행
select text from reg
where regexp_like(text, '[A-Z]{3}');

-- 첫번째 문자가 대문자이거나 숫자인 행
select text from reg
where regexp_like(text, '^[A-Z0-9]');

-- 대문자로 시작하지 않는 행 검색
select text from reg
-- where regexp_like(text, '^[^A-Z]');
where not regexp_like(text, '^[A-Z]');

-- ? 0 또는 1번, * 0개 이상의 문자, . 1개의 문자
-- '!' 특수문자를 포함하는 행 검색
select text from reg
where regexp_like(text, '\!');
-- '?' 특수문자를 포함하는 행 검색
select text from reg
where regexp_like(text, '\?');

--------------------
-- regexp_replace(): 정규식 패턴을 검색하여 대체 문자열로 치환
--------------------
-- 모든 숫자를 '*'기호로 변경
select text, regexp_replace(text, '[0-9]', '*'), replace(text, '1', '*'), 
        regexp_replace(text, '[[:digit:]]', '*')
from reg;

select regexp_replace('127.0.0.1', '\.', '/'),
        regexp_replace('127.0.0.1', '\.', '/', 1, 1)
from dual;

select regexp_replace('aaa    bb bb', '( ){2,}', '')
from dual;

-- 특정 문자열 형태를 다른 형태로 변환
select regexp_replace('20211122',
                '([[:digit:]]{4})([[:digit:]]{2})([[:digit:]]{2})',
                '\1-\2-\3')
from dual;

------------------
-- regexp_count(): 정규식패턴을 검색하여 특정 문자의 갯수를 반환
------------------
select text, regexp_count(text, '[0-9]'), regexp_count(text, 'A'), 
                regexp_count(text, 'A', 1, 'i')
from reg;