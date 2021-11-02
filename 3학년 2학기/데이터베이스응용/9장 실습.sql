-- ���� ������ ����
-- �����, �����ڸ�, �ҼӺμ���
-- �����, �����ڸ�
select e.ename �����, m.ename �����ڸ�
from emp e, emp m
where e.mgr = m.empno;
-- +
select ename, dname
from emp, dept
where emp.deptno = dept.deptno;

select e.ename �����, m.ename �����ڸ�, dname �ҼӺμ���
from emp e, emp m, dept
where e.mgr = m.empno and e.deptno = dept.deptno;

select e.ename �����, m.ename �����ڸ�, dname �ҼӺμ���
from emp e join emp m on e.mgr = m.empno
            join dept on e.deptno = dept.deptno;
            
-- 'SALESMAN'�� ����� ���Ͽ�
select e.ename �����, m.ename �����ڸ�, dname �ҼӺμ���
from emp e, emp m, dept
where e.mgr = m.empno and e.deptno = dept.deptno and e.job = 'SALESMAN';

select e.ename �����, m.ename �����ڸ�, dname �ҼӺμ���
from emp e join emp m on e.mgr = m.empno
            join dept on e.deptno = dept.deptno
where e.job = 'SALESMAN';

-- �ܺ�����
select e.ename �����, m.ename �����ڸ�, dname �ҼӺμ���
from emp e, emp m, dept
where e.mgr = m.empno(+) and e.deptno(+) = dept.deptno;

select e.ename �����, m.ename �����ڸ�, dname �ҼӺμ���
from emp e left outer join emp m on e.mgr = m.empno
            right outer join dept on e.deptno = dept.deptno;
            
-- �ҼӺμ��� ���� ������� �߰� ��
INSERT INTO emp(empno, ename, job, mgr, hiredate, sal)
VALUES(7777, 'MKCHOI', 'ANALYST', 7782, '88/10/10', 3000);

-- ��� �����, ��� �μ��� �˻�(�ҼӺμ��� ���� �����, �Ҽӻ���� ���� �μ��� �˻�)
select ename �����, dname �ҼӺμ���
from emp full outer join dept
on emp.deptno = dept.deptno;

select e.ename �����, m.ename �����ڸ�, dname �ҼӺμ���
from emp e left outer join emp m on e.mgr = m.empno
            full outer join dept on e.deptno = dept.deptno;
            
-- ��������: �ϳ��� SELECT ������ �� �ȿ� ���Ե� �� �ϳ��� SELECT ����
-- (��������-outer ����, ��������-inner ����)

-- ��ü������� ��պ��޺��� ���� ������ �޴� �����, ���� �˻�
select avg(sal)
from emp;

select ename, sal
from emp
where sal > 2209;

select ename, sal
from emp
where sal > (select avg(sal) from emp);

-- ������ ��������: ���������� �������� 1�� ������ ��������
-- ������ �񱳿�����(=, <, <=, >, >=, <>)�� �Բ� ���
-- ������ ��������: ���������� �������� ���� ���� ��������
-- ������ �񱳿�����(in, any, all, some, exists)

-- 'SCOTT'�� ������ ������ ���� �����, ����
select ename, sal
from emp
where job = (select job from emp where ename='SCOTT');

-- �ڽ��� ���ӻ�簡 'KING'�� �����, �޿� �˻�
select ename, sal
from emp
where mgr = 7839;

-- IN ������
-- 'CHICAGO', 'DALLAS'�� ��ġ�� �μ��� �Ҽӵ� ����� �˻�
select ename
from emp
where deptno in (select deptno from dept where loc in ('CHICAGO', 'DALLAS'));

-- ANY ������
-- ������ SALESMAN�� ������� ��� �޿����� ���� �޿��� �޴� ����� �˻�
select ename, sal
from emp
where sal >= any (select sal from emp where job = 'SALESMAN');

-- ����
select ename, sal
from emp
where sal >= any (select min(sal) from emp where job = 'SALESMAN');

select sal
from emp
where job = 'SALESMAN';

-- ALL ������
-- ������ SALESMAN�� ������� ��� �޿�(1600, 1500, 1250)���� ���� �޿��� �޴� ����� �˻�
select ename, sal
from emp
where sal >= all (select sal from emp where job = 'SALESMAN');

-- EXISTS ������ (��ȣ��������)
select ename, job
from emp o
where exists (select * from emp where mgr = o.empno);

-- �������(��������)�� �ִ� ����̸�(�����ڸ�), ���� �˻�
select ename, job
from emp
where empno in (select distinct mgr from emp);

select ename, job
from emp
where empno = any (select distinct mgr from emp);

-- ������ ��ȣ �˻�
select distinct mgr
from emp;

-- �Ҽӻ���� �ִ� �μ��� �˻�
select dname
from dept
where deptno in (select deptno from emp);

select dname
from dept -- (10, 20, 30, 40)
where exists (select * from emp where deptno = dept.deptno);

-- �Ҽӻ���� ���� �μ��� �˻�
select dname
from dept
where deptno not in (select deptno from emp where deptno is not null);

select dname
from dept -- (10, 20, 30, 40)
where not exists (select * from emp where deptno = dept.deptno);

-- 'SCOTT'�� ������ �μ����� �ٹ��ϰ� ������ ������ ����� �˻�
select ename
from emp
where (deptno, job) = (select deptno, job from emp where ename = 'SCOTT') and ename <> 'SCOTT';

-- 'SCOTT'�� ������ ������ ���� ����� �˻�
select ename
from emp o
where exists (select * from emp i where i.ename = 'SCOTT'
                                  and i.job = o.job);
                                  
-- 'SCOTT'�� ������ �μ��� ���� ����� �˻�
select ename
from emp o
where exists (select * from emp i where i.ename = 'SCOTT'
                                  and i.deptno = o.deptno);

select ename
from emp
where deptno = (select deptno from emp where ename = 'SCOTT');

-- ���� �÷� ��������

-- �ִ������ �޴� �����
select ename
from emp
where sal = (select max(sal) from emp);

-- �μ��� �ִ������ �޴� �����
select deptno, ename
from emp
where (deptno, sal) in (select deptno, max(sal) from emp group by deptno);

select deptno, ename
from emp o
where sal = (select max(sal) from emp i where o.deptno = i.deptno);