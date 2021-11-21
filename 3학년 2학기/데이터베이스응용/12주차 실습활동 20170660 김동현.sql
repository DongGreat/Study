-- 12����_�ǽ�Ȱ��

-- 1. emp ���̺�� ������ ������ �� ���̺� ����(empcp)
-- dept ���̺�� ������ ������ �� ���̺� ����(deptcp)
create table empcp
as
select * from emp where 1=2;

create table deptcp
as
select * from dept where 1=2;

-- 2. emp ���̺��� dept�� 10, 20�� ������  empcp ���̺� ����
--   ��� dept ������ deptcp ���̺� ����
insert into empcp
select * from emp
where deptno in (10, 20);

insert into deptcp
select * from dept;

-- 3. empcp ���̺� empno�� �⺻Ű ���� ����, deptno�� deptcp ���̺��� deptno�� �����ϴ� �ܷ�Ű ����   ���� �߰�
--   (���� �߻� �� ���� ���� ���� �� �ذ�)
alter table empcp
add constraint empcp_empno_pk primary key(empno);

alter table empcp
add constraint empcp_deptno_fk foreign key(deptno) references deptcp(deptno)
on delete cascade;
-- �ܷ�Ű�� �����ϱ� ���� �����ϴ� Ű�� �ݵ�� ����Ű �Ǵ� �⺻Ű���� �ϴµ� �׷��� �ʾ� ������ �߻���
-- deptcp ���̺��� deptno�� �⺻Ű ���� ������ �����Ͽ� �ذ��Ѵ�
alter table deptcp
add constraint deptcp_deptno_pk primary key(deptno);

-- 4. empcp ���̺��� ename�� not null ���� ���� ����
alter table empcp
modify ename constraint emp_ename_nn not null;
-- not null ���� ������ add ��� modify ��ɹ��� ���

-- 5. ����� ������ ���̺� ��� ��ȸ
select *
from user_tables;

-- 6. ������ ���� ���� ���� ��ȸ
select constraint_name, constraint_type, table_name, R_CONSTRAINT_NAME
from user_constraints;

-- 7. empcp ���̺� ���ο� ������ ����
-- (7777,'hyupsung','CLERK',7782,'2000-01-23',1300,500,50);
-- ���� ���� �Ѱ�? ������ �߻��ߴٸ� ���� ������?
insert into empcp values (7777, 'hyupsung', 'CLERK', 7782, '2000-01-23', 1300, 500, 50);
-- ������ �Ұ���, deptno�� ���� �������� ������ deptno�� �����ϴ� parent key�� 50�� ��� ������ ����

-- 8. exceptions ���̺� ����(@?/rdbms/admin/utlexcpt.sql)
--    sql command line���� ����
-- SQL> conn
-- Enter user-name: scott
-- Enter password:
-- Connected.
-- SQL> @?/rdbms/admin/utlexcpt.sql

-- Table created.

-- 9. empcp ���̺� deptno�� ������ �ܷ�Ű ���� ���� ��Ȱ��ȭ
alter table empcp
disable constraint empcp_deptno_fk;

-- 10. �ٽ� empcp ���̺� ���ο� ������ ����
-- (7777,'hyupsung','CLERK',7782,'2000-01-23',1300,500,50);
-- ���� �����Ѱ�?
insert into empcp values (7777, 'hyupsung', 'CLERK', 7782, '2000-01-23', 1300, 500, 50);
-- ���� �����ϴ�

-- 11. empcp ���̺� deptno�� ������ �ܷ�Ű ���� ���� �ٽ� Ȱ��ȭ
-- (�������ǿ� ����Ǵ� ������ ���� exceptions ���̺� �����ϵ��� ����)
alter table empcp
enable validate constraint empcp_deptno_fk
exceptions into exceptions;

-- 12. exceptions ���̺� ���� ��ȸ
select * from exceptions;

-- 13. empcp ���̺��� exceptions ���̺� ��ϵ� ��� ��ġ�ϴ� ������(rowid, empno, deptno)�� ��ȸ
select rowid, empno, deptno
from empcp
where rowid in (select row_id from exceptions);

-- 14.������ ��ȸ�� �����͸� �����Ͽ� ���Ἲ �������ǿ� ����Ǵ� ������ ���� 
update empcp
set deptno = 20
where rowid = 'AAAFryAABAAALD5AAH';

-- 15. deptcp ���̺��� �⺻Ű ���� ���� ���� (�����ϴ� ���̺��� ������ ��� �������� cascade �ɼ� ���)
alter table deptcp
drop constraint DEPTCP_DEPTNO_PK cascade;

-- 16. empcp, deptcp ���̺��� ��� ������ ����, exceptions ���̺� �����͵� ����
truncate table empcp;
truncate table deptcp;
truncate table exceptions;

-- 17. empcp, deptcp ���̺� ����
drop table empcp;
drop table deptcp;