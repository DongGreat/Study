-- 13����_�ǽ�Ȱ��

-- 1. �ε��� ����
-- - emp���̺��� job Į���� �ε����� ���� (����ڰ� �ε����� ����)
create index idx_empi_job
on emp(job);

-- - ������ �ε��� ���� Ȯ��
create index idx_empi_job
on emp(job);

-- - ������ ������ �ε��� ����
drop index idx_empi_job;

-- 2. ���� �ּҰ��� �˻��ϱ� ���� ���ǹ��� ����(order by ��)�� ������� �ʰ� �ε����� Ȱ���Ͽ� �˻�
select ename from emp where job > '0' and rownum=1;

-- 3. ������ ����
-- - emp ���̺��� empno���� ������ ���� �����ؼ� �����ϱ� ���� ������ ���� 
/*
���۰� : 2107001
������ : 1
�ִ밪 : 2107100
nocycle 
*/
create sequence emp_empno_seq
increment by 1
start with 2107001
maxvalue 2107100
nocycle;

drop sequence emp_empno_seq;

-- - �������� �̿��Ͽ� emp ���̺� ���ο� ���� ����
alter table emp
modify empno number(7);

insert into emp
values(emp_empno_seq.nextval, 'DONG', 'MANAGER', 9999, '98/11/25', 1000, null, 20);

-- - ������� ������ ������ �� ��ȸ
select *
from user_sequences;

-- 4. ������ ����
-- - jones ����� �������� ���� ���� ��� �˻� (sys_connect_by_path Ȱ��)
/*
�����               ������� 
----------------------------------
JONE	       	/JONES
   SCOTT	    /JONES/SCOTT
    FORD	    /JONES/FORD
       SMITH	/JONES/FORD/SMITH
*/
select lpad(ename, level*4, ' ') �����, sys_connect_by_path(ename, '/') �������
from emp
start with ename = 'JONES'
connect by prior empno = mgr;

-- - smith�� �������� ��� ��� �˻�
/*
�����               ������� 
----------------------------------
SMIT	            /SMITH
    FORD	        /SMITH/FORD
       JONES	    /SMITH/FORD/JONES
            KING	/SMITH/FORD/JONES/KING
*/
select lpad(ename, level*4, ' ') �����, sys_connect_by_path(ename, '/') �������
from emp
start with ename = 'SMITH'
connect by empno = prior mgr;

-- - ���� �����Ϳ��� LEAF ���(��������� �ִ� ����鿡 ���Ͽ�)�� �ƴ� ������� �����, ���� �˻� (king�� �������� ������ ����)
-- - connect_by_isleaf ���
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

-- - ������ ������ Ȱ���Ͽ� �����, �����ڸ��� �˻�(���� ���������� ename������ ��µǵ���)            
/*
�����             �����ڸ�
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
select lpad(ename, level*4, ' ') �����, prior ename �����ڸ�
from emp
start with ename = 'KING'
connect by prior empno = mgr
order siblings by ename;