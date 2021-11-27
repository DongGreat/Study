-- 13주차_실습활동

-- 1. 인덱스 생성
-- - emp테이블의 job 칼럼에 인덱스를 생성 (사용자가 인덱스명 지정)
create index idx_empi_job
on emp(job);

-- - 생성된 인덱스 정보 확인
create index idx_empi_job
on emp(job);

-- - 위에서 생성된 인덱스 삭제
drop index idx_empi_job;

-- 2. 봉급 최소값을 검색하기 위한 질의문을 정렬(order by 절)을 사용하지 않고 인덱스를 활용하여 검색
select ename from emp where job > '0' and rownum=1;

-- 3. 시퀀스 생성
-- - emp 테이블의 empno열에 유일한 값을 생성해서 삽입하기 위한 시퀀스 생성 
/*
시작값 : 2107001
증가값 : 1
최대값 : 2107100
nocycle 
*/
create sequence emp_empno_seq
increment by 1
start with 2107001
maxvalue 2107100
nocycle;

drop sequence emp_empno_seq;

-- - 시퀀스를 이용하여 emp 테이블에 새로운 행을 삽입
alter table emp
modify empno number(7);

insert into emp
values(emp_empno_seq.nextval, 'DONG', 'MANAGER', 9999, '98/11/25', 1000, null, 20);

-- - 현재까지 생성된 시퀀스 값 조회
select *
from user_sequences;

-- 4. 계층형 질의
-- - jones 사원을 시작으로 부하 직원 목록 검색 (sys_connect_by_path 활용)
/*
사원명               사원명경로 
----------------------------------
JONE	       	/JONES
   SCOTT	    /JONES/SCOTT
    FORD	    /JONES/FORD
       SMITH	/JONES/FORD/SMITH
*/
select lpad(ename, level*4, ' ') 사원명, sys_connect_by_path(ename, '/') 사원명경로
from emp
start with ename = 'JONES'
connect by prior empno = mgr;

-- - smith를 기준으로 상사 목록 검색
/*
사원명               사원명경로 
----------------------------------
SMIT	            /SMITH
    FORD	        /SMITH/FORD
       JONES	    /SMITH/FORD/JONES
            KING	/SMITH/FORD/JONES/KING
*/
select lpad(ename, level*4, ' ') 사원명, sys_connect_by_path(ename, '/') 사원명경로
from emp
start with ename = 'SMITH'
connect by empno = prior mgr;

-- - 계층 데이터에서 LEAF 노드(관리사원이 있는 사원들에 한하여)가 아닌 사원들의 사원명, 봉급 검색 (king을 기준으로 순방향 전개)
-- - connect_by_isleaf 사용
/*
ename           	sal
--------------------------
KING	        	5000
   JONES	    	2975
        FORD	    3000
   BLAKE	    	2850
   CLARK	   	    2450
*/
select lpad(ename, level*4, ' ') ename, sal sal
from emp
where connect_by_isleaf = 0
start with ename = 'KING'
connect by prior empno = mgr;

-- - 계층형 쿼리를 활용하여 사원명, 관리자명을 검색(동일 레벨에서는 ename순으로 출력되도록)            
/*
사원명             관리자명
---------------------------
KING	
   BLAKE	        KING
       ALLEN	    BLAKE
       JAMES	    BLAKE
      MARTIN	    BLAKE
      TURNER	    BLAKE
        WARD	    BLAKE
   CLARK	        KING
      MILLER	    CLARK
   JONES	        KING
        FORD	    JONES
           SMITH	FORD
       SCOTT	    JONES
*/
select lpad(ename, level*4, ' ') 사원명, prior ename 관리자명
from emp
start with ename = 'KING'
connect by prior empno = mgr
order siblings by ename;