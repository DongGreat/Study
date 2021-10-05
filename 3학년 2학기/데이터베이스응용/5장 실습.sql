-- �׷��Լ�(�����Լ�): count, sum, max, min, avg, stddev, variance
-- �����, ��պ���, �ִ����
select count(ename), count(comm), count(*)
from emp;

select round(avg(sal)), sum(sal), max(sal), min(sal), round(stddev(sal)), round(variance(sal))
from emp;

select avg(comm), avg(nvl(comm, 0)), count(comm), count(nvl(comm, 0)) "count(nvl(comm, 0))" -- null�� 0���� ������
from emp;

select max(hiredate), min(hiredate)
from emp;

-- group by ��
-- ��ü ������� ��� ����
select avg(sal)
from emp;

-- 10�� �μ��� �Ҽӵ� ������� ��� ����
select avg(sal)
from emp
where deptno=10;

-- �μ���ȣ�� �������� ����
select deptno, ename
from emp
order by 1, ename; -- asc/desc

-- �μ���ȣ�� ��� ����
select deptno, round(avg(sal)), sum(sal), count(*), max(sal)
from emp
group by deptno
order by 1;

-- �μ���ȣ�� ��� ������ 2000 �̻��� �μ��� ���Ͽ� ��� ���� �˻�
select deptno, round(avg(sal), 5), sum(sal), count(*), max(sal)
from emp
group by deptno
having avg(sal) >= 2000
order by 1;

-- �м� �Լ�(���� �Լ�)
-- rollup(), cube(), grouping sets()
select deptno, count(*)
from emp
group by deptno
order by 1;

-- �μ��� �ο��� + ��ü �ο��� �˻�
select deptno, count(*)
from emp
group by rollup(deptno)
-- group by cube(deptno)
order by 1;

-- �μ��� ���޺� �ο��� �˻�
select deptno, job, count(*)
from emp
group by deptno, job
order by 1;

-- �μ��� ���޺� �ο��� �˻� + �μ��� �ο��� + ��ü �ο���
select deptno, job, count(*)
from emp
group by rollup(deptno, job)
order by 1;

-- �μ��� ���޺� �ο��� �˻� + �μ��� �ο��� + ���޺� �ο��� + ��ü �ο���
select deptno, job, count(*)
from emp
group by cube(deptno, job)
order by 1;

-- grouping sets() �Լ�
-- �μ��� �ο��� + ���޺� �ο���
select deptno, job, count(*)
from emp
group by grouping sets(deptno, job);
-- ����
-- group by grouping sets((deptno), (job));

-- �μ��� �ο��� + ���޺� �ο��� + ��ü �ο���
select deptno, job, count(*)
from emp
group by grouping sets(deptno, job, ());

-- �μ��� ���޺� �ο���
select deptno, job, count(*)
from emp
group by grouping sets((deptno, job))
order by deptno;

-- �μ��� ���޺� �ο��� + ��ü �ο���
select deptno, job, count(*)
from emp
group by grouping sets((deptno, job), ())
order by deptno;

-- �μ���ȣ�� �����
select deptno, ename
from emp
order by deptno;

-- listagg(): �����͸� ���η� ���, group by()�� �ʼ�
select deptno �μ���ȣ, listagg(ename, ',') within group (order by hiredate) �����
from emp
group by deptno;

-- ���տ�����: union, union all, intersect, minus (�÷� ���� ����, �÷� �������� ��ġ)
select deptno, count(*)
from emp
group by deptno
union
select null deptno, count(*)
from emp;

