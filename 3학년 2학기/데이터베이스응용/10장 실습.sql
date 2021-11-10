-- ���� ����

-- 1) ��Į�� ��������(�� ��, �� �÷����� ��ȯ�ϴ� �������� - SELECT �μ�����)
-- 2) �ζ��� ��(������) - FROM �μ�����
-- 3) ��ø����: WHERE �μ����� (��� �Ǵ� ���� ����)

-- �����, ����, �ҼӺμ��� ��ձ޿� �˻�
-- scott ����� �ҼӺμ� ��ձ޿�
select avg(sal)
from emp
where deptno = (select deptno from emp where ename = 'SCOTT');

-- ��� ����� �̸�, ����, �� ����� ���� �μ��� ��պ���
select ename, sal, (select avg(sal) from emp where deptno = o.deptno)
from emp o;

-- �м��Լ���
select ename, sal, avg(sal) over(partition by deptno)
from emp;

-- �μ��� �����
select dname, count(*)
from emp join dept
on emp.deptno (+) = dept.deptno
group by dname;

-- �μ���ȣ�� �����
select deptno, (select dname from dept where deptno = emp.deptno), count(*)
from emp
group by deptno;

-- ���� ���� ������ ���� ��� 5�� �˻�
-- top - n
select rownum, ename, sal
from (select ename, sal
        from emp
        order by sal desc)
where rownum <= 5;

select ename, sal
from emp
order by sal desc;

select rownum, ename
from emp
order by sal desc;

-- �ҼӺμ� ��պ��޺��� ���� ������ �޴� �����, ����, ��պ���
-- �μ���ȣ�� ��պ��� inline view
select ename, sal, asal
from emp a, (select deptno, avg(sal) asal
            from emp
            group by deptno) b
where a.deptno = b.deptno and sal > asal;

select deptno, avg(sal)
from emp
group by deptno;

select rownum, ename, sal
from emp
order by sal desc;

-- View: ���� ���̺�
----------------------------
-- �ܼ� ��                         ���� ��
-- �ϳ��� ���̺�� ����              �������� ���̺�� ����
-- �׷� �Լ� ��� �Ұ���             �׷� �Լ� ��� ����
-- distinct ��� �Ұ���             ��� ����
-- dml (������ ���۾�) ��� ����     ��� �Ұ���
----------------------------

-- �� ���� �� ���� ������� ��� ���� �ο�
-- SQL> conn / as sysdba;
-- GRANT CREATE VIEW to scott;

CREATE [or replace] [force | noforce] VIEW emp_dno30
as
SELECT empno, ename, job, deptno
FROM emp
WHERE deptno = 30
[with check option]
[with read only];

-- [or replace] �ɼ�: �� ���� ����
-- [force] �ɼ�: �⺻ ���̺� ���� ���ο� ������� �� ���� / ���������� �並 ������
-- [noforce] �ɼ�: �⺻ ���̺��� ������ ��쿡�� ���� (�⺻��)
-- [with check option] �ɼ�: �־��� ���� ���ǿ� �´� �����͸� �Է� �� ���� ���
-- [with read only] �ɼ�: select�� ������ �б� ���� �� ����

-- �� ����
CREATE or replace VIEW emp_dno30
as
SELECT ename, job, sal, deptno
FROM emp
WHERE deptno = 30
with read only;

insert into emp_dno30 values('mkchoi', 'AN', 1000, 20);

select * from emp;

-- ���� �߻�
update emp_dno30
set deptno = 10
where sal > 1000;

update emp_dno30
set sal = sal * 2
where sal > 1000;

rollback;

delete;

-- �� ��ȸ
select *
from emp_dno30;

-- �� ���� ��ȸ
desc user_views;

select view_name, text
from user_views;

�����;��:
���������Ǿ�: ��ü ����(create), ����(alter), ����(drop)
���������۾�: ����(insert), ����(delete), ����(update)
�����������:
�����Ͱ˻���: select

-- �����, �ҼӺμ���, ���ӻ���, ����, �Ի��� �˻�
create or replace view emd(ename, dname, mname, sal, hiredate)
as
select e.ename, dname, m.ename, e.sal, e.hiredate
from emp e, emp m, dept
where e.mgr = m.empno (+) and e.deptno = dept.deptno;

-- ���� ��� ������ �Ұ���
select view_name, text, view_type, read_only
from user_views;

desc user_views;

select ename, mname
from emd
order by 2 desc;

select *
from emd;

select dname, count(*), avg(sal)
from emd
group by dname;

create view empsal
as
select ename, sal, job
from emp
order by sal desc;

select ename, sal
from empsal
where rownum <= 3;

select ename, sal
from (select ename, sal, job from emp order by sal desc)
where rownum <= 3;

-- �� ����
drop view empsal;
drop view emp_dno30;

-- Materialized View (MVIEW) - ��üȭ�� �� / ��üȭ�� ��
SCOTT> CONN / AS SYSDBA;
SYS> GRANT query rewrite to scott;
SYS> GRANT create materialized view to scott;

-- MView ����
CREATE MATERIALIZED VIEW m_emp
build immediate
refresh on demand
-- enable query rewrite
as
select deptno, count(*)
from emp
group by deptno;

-- MView ����
drop materialized view m_emp;