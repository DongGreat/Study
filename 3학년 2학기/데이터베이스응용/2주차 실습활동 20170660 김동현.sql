-- ������� ������ �ߺ����� �ʵ��� �˻�
select distinct job
from emp;

-- 10���̳� 30���� �Ҽӵ� ����� �˻�
select ename, deptno
from emp
where deptno in (10, 30);
-- where deptno = 10 or deptno = 30;

-- �����ڰ� ���� ����� �˻�
select ename
from emp
where mgr is null;

-- �����, �Ի����� �˻�(���� �������� �Ի��� ����� ���� ��µǵ���)
select ename, hiredate
from emp
order by hiredate asc;

-- 1981��� �Ի��� ����� �˻�
select ename, hiredate
from emp
where hiredate like '81%';