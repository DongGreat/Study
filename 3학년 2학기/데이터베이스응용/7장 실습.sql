-- 'smith' ����� ���޼��� �˻�
select ename, rank() over(order by ename desc)
from emp;

-- sal �ȿ��� 2000�̶�� ���� ����
select rank('2000') within group (order by sal)
from emp;

-- �̸������� ���� �� smith ��ġ
select rank('SMITH') within group (order by ename)
from emp;

select ename
from emp
order by ename;

-- ntile()
select ename, sal, ntile(4) over (order by sal)
from emp;

-- keep() �Լ�
-- min/max() keep (dense_rank first/last order by)

-- �μ��� �ִ�޿�, �ּұ޿�
select deptno, max(sal), min(sal)
from emp
group by deptno;

-- �μ���ȣ�� �ִ�޿�, �ִ�޿�������
select deptno, max(sal) �ִ�޿�, 
        min(ename) keep (dense_rank first order by sal desc) �ִ�޿�������
from emp
group by deptno;

-- �ִ�޿�, �ִ�޿�������
select max(sal) �ִ�޿�, max(ename) keep (dense_rank first order by sal desc) �ִ�޿�������
from emp;

-- �μ���ȣ�� �ּұ޿�, �ּұ޿�������
select deptno, min(sal) �ּұ޿�,
        max(ename) keep (dense_rank last order by sal desc) �ּұ޿�������
from emp
group by deptno;

-- keep() + over(): �м��Լ� ��� ������� ���� ������ �м��Լ��� ��� ��
-- ��� ����� �����, ����, �ִ����, �ִ���޼�����, �ҼӺμ����ִ����, �ҼӺμ����ִ���޼�����
-- select ename, sal, max(sal) (�����Լ��� ������ ��, �ϳ��� ���� ����)
select ename �����, sal ����, max(sal) over() �ִ����,
        max(ename) keep(dense_rank first order by sal desc) over() �ִ���޼�����,
        max(sal) over(partition by deptno) �ҼӺμ����ִ����,
        max(ename) keep(dense_rank first order by sal desc) over(partition by deptno) �ҼӺμ����ִ������
from emp;

-- first_value(), last_value() + over()
select ename, sal, deptno,
        max(sal) over(),
        first_value(ename) over(order by sal desc) �ִ���޼�����,
        last_value(job) over(order by sal rows between current row and unbounded following) �ִ���޼�����������,
        max(sal) over(partition by deptno) �μ����ִ����,
        first_value(ename) over(partition by deptno order by sal desc) �μ����ִ���޼�����
from emp
order by deptno;

-- ����
-- �����, �ҼӺμ��� �˻�
-- emp: �����, �ҼӺμ���ȣ
-- dept: �μ���ȣ, �μ���

-- cross ����
select ename, e.deptno, d.deptno, dname
from emp e, dept d;

select ename, e.deptno, d.deptno, dname
from emp e cross join dept d;

-- �����, �ҼӺμ��� �˻�
-- �(equit) ����
select ename, dname
from emp, dept
where emp.deptno = dept.deptno;

-- ANSI ǥ�� ǥ���
select ename, dname
from emp e inner join dept d
on e.deptno = d.deptno;
--
select ename, dname
from emp e natural join dept d;
-- on e.deptno = d.deptno;
--
select ename, dname
from emp e join dept d
using (deptno);

-- self ����
-- �����, �����ڸ� �˻�
select e.ename �����, m.ename �����ڸ�
from emp e, emp m
where e.mgr = m.empno;

select e.ename �����, m.ename �����ڸ�
from emp e join emp m
on e.mgr = m.empno;

-- �����ڸ��� 'KING'�� ������� �̸�, ���� �˻�
select e.ename �����, m.ename �����ڸ�, e.job ����
from emp e, emp m
where e.mgr = m.empno and m.ename='KING';

select e.ename �����, m.ename �����ڸ�
from emp e join emp m on e.mgr = m.empno
where m.ename='KING';

-- �ܺ�����
-- �����, �ҼӺμ��� �˻�, �Ҽ� ����� ���� �μ��� ��µǵ���
select ename, dname
from emp, dept
where emp.deptno(+) = dept.deptno;

10      10
20      20
30      30
        40
left    right
-- outer join: left / right / full
select ename, dname
from emp e right outer join dept d on e.deptno = d.deptno;

-- �����ڸ��� 'KING'�� ������� �̸�, ���� (�����ڰ� ���� ����� ��µǵ���)
select e.ename �����, m.ename �����ڸ�, e.job
from emp e, emp m
where e.mgr = m.empno(+);

select e.ename �����, m.ename �����ڸ�, e.job
from emp e left outer join emp m on e.mgr = m.empno;