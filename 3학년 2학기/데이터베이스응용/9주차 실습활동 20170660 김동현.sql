--1.jones ���� ���� ������ �޴� �����, ���� �˻�
select ename, sal
from emp
where sal > any (select sal from emp where ename = 'JONES');

--2. ���ӻ�簡 'jones'�� ����� �����, �Ի���, �ҼӺμ��� �˻�
select ename, hiredate, dname
from emp, dept
where mgr = (select empno from emp where ename = 'JONES') and emp.deptno = dept.deptno;

-- 3. �μ��� RESEARCH�� �Ҽӵ� �����, ���� �˻�(��������, exists ���)
select ename, sal
from emp e
where exists (select * from dept d 
                        where e.deptno = d.deptno
                        and d.dname = 'RESEARCH');

-- 4. 30���� �ٹ��ϴ� ������� ��� �޿����� ���� �޿��� �޴� �����
select ename
from emp
where sal > all (select sal from emp where deptno = 30);

-- 5. ���޺� �ּҺ����� �޴� �����, ���� �˻�
select ename, sal
from emp
where (job, sal) in (select job, min(sal) from emp group by job);