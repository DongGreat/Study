-- 테이블 구조를 확인하기 위해서 사용하는 명령어
describe emp;

-- 전체 테이블 내용 조회
select ename, sal from emp;

-- emp 테이블의 모든 레코드 조회
select * from emp;

-- 사원들의 직급(job) 검색
select job from emp;

-- 사원들의 직급(job) 검색 (중복 제거)
select distinct job from emp;

-- 컬럼 명에 별칭 설정 (as를 써도 되고 안 써도 됨)
select empno as 사원번호, ename, mgr as 관리자번호
from emp;

-- 문자열 결합 연산자 ||
select empno || '의 관리자 번호는 ' || mgr 사원_관리자
from emp;

-- SMITH(CLERK)와 같이 출력 되도록 사원명(직급) 검색
select ename || '(' ||job || ')' "name and job"
from emp;

-- SMITH's sal is $800 같이 출력 되도록 emp 테이블 조회
select ename || '''s sal is $' || sal "name and sal"
from emp;

-- SQL 기본 구문
/*
SELECT distinct 컬럼명1[, 컬럼명2, ..., 컬럼명n] * as alias
FROM 테이블명
WHERE 컬럼명 연산자 값
ORDER BY 컬럼명 [asc|desc]
*/

-- where 연산자
-- 비교 연산자 : = !=, <> >= <= > <
-- 논리 연산자 : and, or, not
-- 범위 연산자 : between a and b
-- 포함 연산자 : in, not in
-- 문자열 연산자 : like (%, _)
-- null 여부 판별 연산자 : is null, is not null

-- 직급(job)이 manager인 사원명 검색
select ename
from emp
where lower(job) = 'manager';
-- where job = 'MANAGER';

-- 10번 부서에 소속된 사원명 검색
select ename
from emp
where deptno = 10;

-- 1985년 1월 1일 이후 입사한 사원명 검색
select ename, hiredate
from emp
where hiredate >= '85/01/01';

-- 봉급이 3000 이상 5000 이하인 사원명 검색
select ename, sal
from emp
-- where sal >= 3000 and sal <= 5000;
where sal between 3000 and 5000;

-- 직급이 manager이고 10번 부서에 소속된 사원명 검색
select ename, job, deptno
from emp
where lower(job) = 'manager' and deptno = 10;

-- 직급이 manager이거나 salesman을 가진 사원명 검색
select ename, job
from emp
-- where lower(job) = 'manager' or lower(job) = 'salesman';
-- where lower(job) in ('manager', 'salesman');
where lower(job) not in ('manager', 'salesman');

-- smith 사원의 직급 검색
select job
from emp
where lower(ename) = 'smith';

-- 이름 중에 'S' 문자를 포함하고 있는 사원들의 직급
select job, ename
from emp
where ename like 'S____'; -- S로 시작하고 4글자
-- where ename like '%S%';
-- where ename like 'S%'; S로 시작
-- where ename like '%S'; S로 끝
-- % : 0개 이상의 임의의 문자열
-- _ : 1개의 임의의 문자

-- mgr이 null인 사원명 조회 (값이 없기에 비교 연산(=)이 불가능해서 is 연산자를 사용
select ename, comm
from emp
where comm is null;

-- and가 or보다 우선순위가 높다
select ename, comm, sal
from emp
where sal > 1000 and (comm < 100 or comm is null);

-- & : 사용자로부터 매개변수 값을 입력 받기
select ename
from emp
where deptno = &부서번호;

-- 입사일을 기준(오름차순)으로 사원명 검색
select ename, hiredate
from emp
-- order by hiredate asc 오름차순
order by hiredate desc;

-- 사원명, 봉급, 봉급*12(연봉) 검색, 연봉을 기준으로 내림차순으로 정렬 출력
select ename, sal, sal*12 연봉
from emp
order by 3 desc;

-- 1번째 기준 값이 동일할 경우 2번째 기준 값으로 정렬
select ename, sal, deptno
from emp
order by deptno, sal desc;