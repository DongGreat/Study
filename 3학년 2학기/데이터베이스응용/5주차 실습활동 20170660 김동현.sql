-- 1. ���޺� ����� 3�� �̻��� ���޿� ���Ͽ� ���޺� �ִ�޿�, �ο��� �˻�
select job, max(sal) �ִ�޿�, count(*) �ο���
from emp
group by job
having count(job) >= 3;

select count(ename), count(comm), count(*)
from emp;

-- 2. ���޺� ��պ���, �μ���ȣ�� ��պ���, ��ü ��պ��� �˻�
select job ����, deptno �μ���ȣ, round(avg(sal)) ��պ���
from emp
group by grouping sets(job, deptno, ());

-- 3. ���޺� �μ��� ��պ���, ���޺� ��պ���, �μ���ȣ�� ��պ���, ��ü ��պ��� �˻�
select job ����, deptno �μ���ȣ, round(avg(sal)) ��պ���
from emp
group by cube(job, deptno)
order by job;

-- 4. ���޺� ������� �Ի������� ���η� ��� 
select job ����, listagg(ename, ',') within group (order by hiredate) �����
from emp
group by job;