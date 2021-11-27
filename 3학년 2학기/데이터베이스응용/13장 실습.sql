-- 1) �ε����� Ȱ���Ͽ� ������ ȿ���� ���� ���

-- ���� ���̺� ����
create table empindex
as
select empno, ename, sal
from emp
where deptno in (10, 20);

commit;

select * from empindex;

-- ename ���� index ����
create index idx_empi_ename
on empindex(ename);

desc user_indexs;

-- �ε��� ����
drop index idx_empi_ename;

-- �ε��� ������� �ʴ� �Ϲ����� SQL��
select ename from empindex;

-- �ε��� ��� SQL�� - ������ ���ĵ� ������ �˻� (������������ ���ĵ� �̸�)
select ename from empindex
where ename > '0';

-- 2) �ε����� Ȱ���Ͽ� �ּҰ�(MIN)/�ִ밪(MAX)�� ���ϴ� ���
select min(ename) from empindex; -- ���� �߻�

select ename from empindex where ename > '0' and rownum=1; -- stopkey

select max(ename) from empindex; -- ���� �߻�, ���� ������

select ename from empindex where ename > '0' and rownum=1;

-- ������
create sequence ��������
start with N
increment by N
maxvalue N | nomaxvalue
minvalue N | nominvalue
cycle | nocycle
cache N | nocache;

-- ������ ����
create sequence dept_deptno_seq
increment by 10
start with 10
maxvalue 50
minvalue 10
cycle
cache 2;

drop sequence dept_deptno_seq;

-- ������ ���� ������ ��ųʸ�
desc user_sequences;

-- sequence ��ȸ �� ����
select sequence_name, min_value, max_value, increment_by, cycle_flag, order_flag,
        cache_size, last_number
from user_sequences;

-- ���� ���̺� ����
create table dept01
as
select * from dept
where 1=2;

-- �������� ���̺��� �⺻ Ű�� ����
insert into dept01
values(dept_deptno_seq.nextval, 'AAA', 'BBB');

select * from dept01;

-- ������ ����
drop sequence dept_deptno_seq;

-- ������ ����
alter sequence dept_deptno_seq
maxvalue 1000;

-- ���� �������� �� currval, ���� ���� �˾Ƴ� �� nextval ���
-- step 1. nextval�� ���ο� �� ����
select dept_deptno_seq.nextval from dual;
-- step 2. �������� ���簪 �˾ƺ���
select dept_deptno_seq.currval from dual;

-- king ����� ���� ����� ��ȸ
select level, lpad(ename, level*4, '-'), empno, mgr
from emp
start with ename = 'KING'
connect by prior empno = mgr; -- �ڽ� �ʿ� prior

select level, lpad(ename, level*5, ' '), empno, mgr
from emp
start with ename = 'SMITH'
connect by empno = prior mgr; -- �θ� �ʿ� prior

-- �����, �����ڸ� : ���� �̿�

-- prior�� �����ڸ� �˻�
select ename �����, prior ename �����ڸ�,
        level,
        lpad(' ', (level-1)*2, ' ') || ename levelname,
        sys_connect_by_path(ename, '/') enamepath
from emp
start with mgr is null
connect by prior empno=mgr
order siblings by ename; -- ���� ���� �ȿ��� ������ ����

-- ������������ �Ϻκи� ����ȭ
select empno, ename �����, prior ename �����ڸ�,
        level,
        lpad(' ', (level-1)*2, ' ') || ename level_ename,
        sys_connect_by_path(ename, '/') path_ename
from emp
start with mgr is null
connect by prior empno = mgr
        and ename <> 'JONES' -- ���� ���� ���� ���� // �̸��� JONES�� �ƴ�
order siblings by ename;

-- ���
-- where�� �׻� �������� ���ͷ� ó��
select empno, ename �����, prior ename �����ڸ�,
        level,
        lpad(' ', (level-1)*2, ' ') || ename level_ename,
        sys_connect_by_path(ename, '/') path_ename
from emp
where ename <> 'JONES'
start with mgr is null
connect by prior empno = mgr
order siblings by ename;

select connect_by_root(ename) ��Ʈ���, sys_connect_by_path(ename, '\') path,
        empno �����ȣ, mgr ������
from emp
start with mgr is null
connect by prior empno = mgr;

select connect_by_root(ename) ��Ʈ���, sys_connect_by_path(ename, '\') path,
        empno �����ȣ, mgr ������, connect_by_isleaf
from emp
start with mgr is null
connect by prior empno = mgr;

select lpad(ename, level*5, '*') ename,
        sys_connect_by_path(ename, '/') path
from emp
where connect_by_isleaf=0
start with empno = 7369
connect by empno = prior mgr;

-- level ���� �޿� �հ�� ������� ��ȸ
select level, avg(sal) total, count(empno) cnt
from emp
start with mgr is null
connect by prior empno = mgr
group by level
order by level;