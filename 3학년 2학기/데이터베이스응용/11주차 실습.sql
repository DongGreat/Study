-- ������ ���
-- ������ ���Ǿ�
-- ������ ���۾�
-- ������ �����
-- ������ �˻���(select)

-- ���̺� ���� ����, ���� �� �����ϴ� DDL(Data Definition Language)

-- ���̺� ���� ����
create table emp01 (
empno number(4),
ename varchar2(20),
sal number(7,2)
);

desc emp01;
select * from emp01;

-- ���� ������ ���̺� ����(���� ���� ���� ����)
create table emp01
as
select * from emp;

-- ���ڵ� ���� ���̺� ������ ����
create table emp01
as
select * from emp
where 1 = 2;

create table emp01
as
select ename, job, sal
from emp
where deptno = 10;

select * from emp01;

-- ���̺� ���� ����
drop table emp01;

-- ���̺� ���� ����(alter table)
-- ���ο� �÷� �߰�(add)
alter table emp01
add (memo varchar2(20));

desc emp01;

-- ���� �÷� ����(modify)
alter table emp01
modify (memo varchar2(30));

desc emp01;

-- ���� �÷� ����(drop)
alter table emp01
-- drop (memo);
drop column memo;

-- �÷��� ����
alter table emp01
rename column memo to bigo;

-- �б� ���� ���̺�� ����
alter table emp01
read only;

-- �а� ����
alter table emp01
read write;

-- ���̺��� ������ �߰�, ����, �����ϴ� DML(Data Manipulation Language)
-- ������ ���۾�

-- ���ο� �� ����
create table emp01
as
select * from emp where 1=2;

select * from emp01;

insert into emp01(empno, ename, sal, hiredate, deptno)
values (7777, 'mkchoi', 3000, '2021/12/31', 10);

insert into emp01
values (8888, 'mkchoi', 'top', 7832, '2021/12/31', 5000, null, 20);

-- ���� ���̺� �����͸� ������� ����
-- ���������� ���� �� ����
insert into emp01(empno, ename)
select empno, ename
from emp
where job = 'MANAGER';

insert into emp01
select *
from emp
where deptno in (10, 20);

-- ���� ���̺� ���� �� �Է�
create table empmgr
as
select empno, ename, mgr, hiredate
from emp
where 1=2;

create table emphire
as
select empno, ename, hiredate, sal
from emp
where 1=2;

insert all
into empmgr values(empno, ename, mgr)
into emphire values(empno, ename, hiredate)
select empno, ename, mgr, hiredate
from emp
where deptno = 10;

select * from empmgr;
select * from emphire;

drop table empmgr;
drop table emphire;
truncate table empmgr;
truncate table emphire;

insert all
when hiredate >= '1985/1/1' then
into empmgr values(empno, ename, mgr, hiredate)
when sal >= 2000 then
into emphire values(empno, ename, hiredate, sal)
select empno, ename, mgr, hiredate, sal
from emp;

-- insert all vs first
create table empsal1 -- empsal2, empsal3 ����
as
select empno, ename, sal, job
from emp
where 1=2;

insert first
when sal >= 3000 then
        into empsal1 values(empno, ename, sal, job)
when sal >= 2000 then
        into empsal2 values(empno, ename, sal)
else
        into empsal3 values(empno, ename, sal)
select empno, ename, sal, job
from emp;

select * from empsal1;
select * from empsal2;
select * from empsal3;

delete from empsal1;
delete from empsal2;
delete from empsal3;

-- ���̺� ������ �����ϱ� ���� update��

-- ��� �� ����
-- ��� ����� ������ 10% �λ�� ������ ����
update empsal1
set sal = sal * 1.1;

-- Ư�� �ุ ����
-- ������ 'MANAGER'�� ����� ������ 10% �λ�� ������ ����
update empsal1
set sal = sal * 1.1
where job = 'MANAGER';

-- 'DALLAS'�� ��ġ�� �μ��� �ٹ��ϴ� ������� Ŀ�̼��� 50���� ����
create table emp01
as
select *
from emp;

select * from emp01;

update emp01
set comm = 50
where deptno = (select deptno from dept where loc = 'DALLAS');

-- ���� �÷��� ����
update emp01
set hiredate = sysdate, sal = 10000, comm = 500
where ename = 'SCOTT';

-- ��� ����� �޿�, �Ի����� 'KING' ����� �޿�, �Ի��ϰ� ������ ������ ����
update emp01
set (sal, hiredate) = (select sal, hiredate from emp where ename = 'KING');

-- ���̺��� �����͸� �����ϱ� ���� Delete��
delete from emp01;

-- ���ǿ� �´� Ư���ุ ����
delete from emp01 where deptno = 10;

-- �������� ���
-- �μ����� 'SALES'�� �μ����� �ٹ��ϴ� ��� ���� ����
delete from emp01
where deptno = (select deptno from dept where dname = 'SALES');

-- ���̺� ������ �����ϱ� ���� merge�� (update + insert)
create table empcp
as
select * from emp;

create table emp20
as
select * from emp
where deptno = 20;

select * from empcp;
select * from emp20;

-- empc ���̺��� �����͸� �������� emp20�� �����Ͱ� �̹� ������ sal�� 10% �λ�(update), ������ ���� insert
merge into emp20
using empcp
    on (emp20.empno = empcp.empno)
when matched then
    update set emp20.sal = empcp.sal*1.1
when not matched then
    insert (empno, ename, sal) values(empcp.empno, empcp.ename, empcp.sal);

select * from empcp;
select * from emp20;