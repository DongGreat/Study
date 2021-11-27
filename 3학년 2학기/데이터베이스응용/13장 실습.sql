-- 1) 인덱스를 활용하여 정렬한 효과를 내는 방법

-- 예제 테이블 생성
create table empindex
as
select empno, ename, sal
from emp
where deptno in (10, 20);

commit;

select * from empindex;

-- ename 열에 index 생성
create index idx_empi_ename
on empindex(ename);

desc user_indexs;

-- 인덱스 삭제
drop index idx_empi_ename;

-- 인덱스 사용하지 않는 일반적인 SQL문
select ename from empindex;

-- 인덱스 사용 SQL문 - 빠르게 정렬된 데이터 검색 (오름차순으로 정렬된 이름)
select ename from empindex
where ename > '0';

-- 2) 인덱스를 활용하여 최소값(MIN)/최대값(MAX)을 구하는 방법
select min(ename) from empindex; -- 정렬 발생

select ename from empindex where ename > '0' and rownum=1; -- stopkey

select max(ename) from empindex; -- 정렬 발생, 성능 떨어짐

select ename from empindex where ename > '0' and rownum=1;

-- 시퀀스
create sequence 시퀀스명
start with N
increment by N
maxvalue N | nomaxvalue
minvalue N | nominvalue
cycle | nocycle
cache N | nocache;

-- 시퀀스 생성
create sequence dept_deptno_seq
increment by 10
start with 10
maxvalue 50
minvalue 10
cycle
cache 2;

drop sequence dept_deptno_seq;

-- 시퀀스 관련 데이터 딕셔너리
desc user_sequences;

-- sequence 조회 및 수정
select sequence_name, min_value, max_value, increment_by, cycle_flag, order_flag,
        cache_size, last_number
from user_sequences;

-- 예제 테이블 생성
create table dept01
as
select * from dept
where 1=2;

-- 시퀀스를 테이블의 기본 키에 적용
insert into dept01
values(dept_deptno_seq.nextval, 'AAA', 'BBB');

select * from dept01;

-- 시퀀스 삭제
drop sequence dept_deptno_seq;

-- 시퀀스 수정
alter sequence dept_deptno_seq
maxvalue 1000;

-- 현재 시퀀스의 값 currval, 다음 값을 알아낼 때 nextval 사용
-- step 1. nextval로 새로운 값 생성
select dept_deptno_seq.nextval from dual;
-- step 2. 시퀀스의 현재값 알아보기
select dept_deptno_seq.currval from dual;

-- king 사원의 관리 사원들 조회
select level, lpad(ename, level*4, '-'), empno, mgr
from emp
start with ename = 'KING'
connect by prior empno = mgr; -- 자식 쪽에 prior

select level, lpad(ename, level*5, ' '), empno, mgr
from emp
start with ename = 'SMITH'
connect by empno = prior mgr; -- 부모 쪽에 prior

-- 사원명, 관리자명 : 조인 이용

-- prior로 관리자명 검색
select ename 사원명, prior ename 관리자명,
        level,
        lpad(' ', (level-1)*2, ' ') || ename levelname,
        sys_connect_by_path(ename, '/') enamepath
from emp
start with mgr is null
connect by prior empno=mgr
order siblings by ename; -- 같은 레벨 안에서 순서를 지정

-- 계층구조에서 일부분만 계층화
select empno, ename 사원명, prior ename 관리자명,
        level,
        lpad(' ', (level-1)*2, ' ') || ename level_ename,
        sys_connect_by_path(ename, '/') path_ename
from emp
start with mgr is null
connect by prior empno = mgr
        and ename <> 'JONES' -- 계층 구조 전개 조건 // 이름이 JONES가 아닌
order siblings by ename;

-- 비고
-- where절 항상 마지막에 필터로 처리
select empno, ename 사원명, prior ename 관리자명,
        level,
        lpad(' ', (level-1)*2, ' ') || ename level_ename,
        sys_connect_by_path(ename, '/') path_ename
from emp
where ename <> 'JONES'
start with mgr is null
connect by prior empno = mgr
order siblings by ename;

select connect_by_root(ename) 루트사원, sys_connect_by_path(ename, '\') path,
        empno 사원번호, mgr 관리자
from emp
start with mgr is null
connect by prior empno = mgr;

select connect_by_root(ename) 루트사원, sys_connect_by_path(ename, '\') path,
        empno 사원번호, mgr 관리자, connect_by_isleaf
from emp
start with mgr is null
connect by prior empno = mgr;

select lpad(ename, level*5, '*') ename,
        sys_connect_by_path(ename, '/') path
from emp
where connect_by_isleaf=0
start with empno = 7369
connect by empno = prior mgr;

-- level 별로 급여 합계와 사원수를 조회
select level, avg(sal) total, count(empno) cnt
from emp
start with mgr is null
connect by prior empno = mgr
group by level
order by level;