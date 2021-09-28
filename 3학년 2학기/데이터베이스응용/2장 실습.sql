-- ���̺� ������ Ȯ���ϱ� ���ؼ� ����ϴ� ��ɾ�
describe emp;

-- ��ü ���̺� ���� ��ȸ
select ename, sal from emp;

-- emp ���̺��� ��� ���ڵ� ��ȸ
select * from emp;

-- ������� ����(job) �˻�
select job from emp;

-- ������� ����(job) �˻� (�ߺ� ����)
select distinct job from emp;

-- �÷� �� ��Ī ���� (as�� �ᵵ �ǰ� �� �ᵵ ��)
select empno as �����ȣ, ename, mgr as �����ڹ�ȣ
from emp;

-- ���ڿ� ���� ������ ||
select empno || '�� ������ ��ȣ�� ' || mgr ���_������
from emp;

-- SMITH(CLERK)�� ���� ��� �ǵ��� �����(����) �˻�
select ename || '(' ||job || ')' "name and job"
from emp;

-- SMITH's sal is $800 ���� ��� �ǵ��� emp ���̺� ��ȸ
select ename || '''s sal is $' || sal "name and sal"
from emp;

-- SQL �⺻ ����
/*
SELECT distinct �÷���1[, �÷���2, ..., �÷���n] * as alias
FROM ���̺��
WHERE �÷��� ������ ��
ORDER BY �÷��� [asc|desc]
*/

-- where ������
-- �� ������ : = !=, <> >= <= > <
-- �� ������ : and, or, not
-- ���� ������ : between a and b
-- ���� ������ : in, not in
-- ���ڿ� ������ : like (%, _)
-- null ���� �Ǻ� ������ : is null, is not null

-- ����(job)�� manager�� ����� �˻�
select ename
from emp
where lower(job) = 'manager';
-- where job = 'MANAGER';

-- 10�� �μ��� �Ҽӵ� ����� �˻�
select ename
from emp
where deptno = 10;

-- 1985�� 1�� 1�� ���� �Ի��� ����� �˻�
select ename, hiredate
from emp
where hiredate >= '85/01/01';

-- ������ 3000 �̻� 5000 ������ ����� �˻�
select ename, sal
from emp
-- where sal >= 3000 and sal <= 5000;
where sal between 3000 and 5000;

-- ������ manager�̰� 10�� �μ��� �Ҽӵ� ����� �˻�
select ename, job, deptno
from emp
where lower(job) = 'manager' and deptno = 10;

-- ������ manager�̰ų� salesman�� ���� ����� �˻�
select ename, job
from emp
-- where lower(job) = 'manager' or lower(job) = 'salesman';
-- where lower(job) in ('manager', 'salesman');
where lower(job) not in ('manager', 'salesman');

-- smith ����� ���� �˻�
select job
from emp
where lower(ename) = 'smith';

-- �̸� �߿� 'S' ���ڸ� �����ϰ� �ִ� ������� ����
select job, ename
from emp
where ename like 'S____'; -- S�� �����ϰ� 4����
-- where ename like '%S%';
-- where ename like 'S%'; S�� ����
-- where ename like '%S'; S�� ��
-- % : 0�� �̻��� ������ ���ڿ�
-- _ : 1���� ������ ����

-- mgr�� null�� ����� ��ȸ (���� ���⿡ �� ����(=)�� �Ұ����ؼ� is �����ڸ� ���
select ename, comm
from emp
where comm is null;

-- and�� or���� �켱������ ����
select ename, comm, sal
from emp
where sal > 1000 and (comm < 100 or comm is null);

-- & : ����ڷκ��� �Ű����� ���� �Է� �ޱ�
select ename
from emp
where deptno = &�μ���ȣ;

-- �Ի����� ����(��������)���� ����� �˻�
select ename, hiredate
from emp
-- order by hiredate asc ��������
order by hiredate desc;

-- �����, ����, ����*12(����) �˻�, ������ �������� ������������ ���� ���
select ename, sal, sal*12 ����
from emp
order by 3 desc;

-- 1��° ���� ���� ������ ��� 2��° ���� ������ ����
select ename, sal, deptno
from emp
order by deptno, sal desc;