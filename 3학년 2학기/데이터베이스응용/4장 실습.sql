-- �Ϲ��Լ� (nvl, nvl2)
-- �����, ����, Ŀ�̼�, ����(sal*12+comm), comm�� null�� ��� 0���� ���
select ename, sal, comm, sal*12+nvl(comm, 0) ����, sal*12+nvl2(comm, comm, 0) ����
from emp;

-- nvl(comm, 50) ���� nvl2(comm, comm, 50) nvl comm�� null�̸� 50, nvl2 comm�� null�� �ƴϸ� comm�� null�̸� 50
select ename, comm, nvl(to_char(comm), 'no_comm'), nvl2(comm, 'O', 'X')
from emp;

-- �����ȣ, �����ڹ�ȣ �˻�(�����ڹ�ȣ�� null�� ��� 'CEO'�� ���)
select empno, nvl(to_char(mgr), 'CEO'), nvl2(to_char(mgr), 'job', 'CEO')
from emp;

-- decode
-- �����, �ҼӺμ���
select ename, deptno, decode(deptno, 10, '10���μ��Ҽ�', 20, '20���μ��Ҽ�', '�׿ܺμ��Ҽ�') �ҼӺμ���
from emp;

-- case��
select ename, deptno, case when deptno=10 then '10���μ��Ҽ�'
                            when deptno=20 then '20���μ��Ҽ�'
                            else '�׿ܺμ��Ҽ�'
                        end �ҼӺμ���
from emp;

-- �����ȣ Ȧ��/¦�� 'odd'/'even' 0�̸� even �ƴϸ� odd
select ename, empno, decode(mod(empno, 2), 0, 'even', 'odd') ���1,
                        case when mod(empno, 2)=0 then 'even'
                        else 'odd'
                        end ���2
from emp;

-- �����, �Ի���, �Ի�ñ�(�б�)
-- 1~3��: 1�б�, 4~6��: 2�б�, 7~9��: 3�б�, 10~12��: 4�б�
select ename, hiredate, case when extract(month from hiredate) >=1 and extract(month from hiredate) <=3 then '1�б�'
                            when extract(month from hiredate) between 4 and 6 then '2�б�'
                            when extract(month from hiredate) between 7 and 9 then '3�б�'
                            when extract(month from hiredate) between 10 and 12 then '4�б�'
                            end �б�
from emp;

-- ���ԽĿ������̺�.sql ����
-- ���̺� ���� ��ɾ�
drop table reg;

-- ���̺� ���� ��ɾ�
CREATE TABLE reg
(text varchar2(10));

INSERT INTO reg VALUES('ABC123');
INSERT INTO reg VALUES('XYZ123');
INSERT INTO reg VALUES('xyz123');
INSERT INTO reg VALUES('ABC 123');
INSERT INTO reg VALUES('ABC  123');
INSERT INTO reg VALUES('abc 123');
INSERT INTO reg VALUES('abc  123');
INSERT INTO reg VALUES('a1b2c3');
INSERT INTO reg VALUES('aabbcc123');
INSERT INTO reg VALUES('?/!@#$*&');
INSERT INTO reg VALUES('\~*();.,');
INSERT INTO reg VALUES(123123);
INSERT INTO reg VALUES('123abc');
INSERT INTO reg VALUES('123ABC');
INSERT INTO reg VALUES('abc');
INSERT INTO reg VALUES('ABC');

select * from reg;

-- regexp_like �Լ�
select text
from reg
where regexp_like(text, '[A-Z]');

-- 'a' ���ڸ� �����ϰ� �ִ� �� �˻�
select text from reg
where regexp_like(text, 'a');

-- ��/�ҹ��ڸ� �����ϴ� �� �˻�
select text from reg
-- where regexp_like(text, '[a-zA-Z]');
where regexp_like(text, '[[:alpha:]]');

-- �ҹ��ڷ� �ڿ� ������ �����ϴ� �� �˻�
select text from reg
where regexp_like(text, '[a-z] ');

-- �ҹ��ڷ� �����ϴ� �� �˻�
select text from reg
where regexp_like(text, '^[a-z]');

-- �ҹ��ڷ� ������ �� �˻�
select text from reg
where regexp_like(text, '[a-z]$');

-- ������ �����ϰ� �ִ� �� �˻�
select text from reg
where regexp_like(text, '[[:space:]]'); -- alpha [a-zA-Z] digit[0-9]

-- �빮�ڰ� �������� 3���� �̻� �ִ� ��
select text from reg
where regexp_like(text, '[A-Z]{3}');

-- ù��° ���ڰ� �빮���̰ų� ������ ��
select text from reg
where regexp_like(text, '^[A-Z0-9]');

-- �빮�ڷ� �������� �ʴ� �� �˻�
select text from reg
-- where regexp_like(text, '^[^A-Z]');
where not regexp_like(text, '^[A-Z]');

-- ? 0 �Ǵ� 1��, * 0�� �̻��� ����, . 1���� ����
-- '!' Ư�����ڸ� �����ϴ� �� �˻�
select text from reg
where regexp_like(text, '\!');
-- '?' Ư�����ڸ� �����ϴ� �� �˻�
select text from reg
where regexp_like(text, '\?');

--------------------
-- regexp_replace(): ���Խ� ������ �˻��Ͽ� ��ü ���ڿ��� ġȯ
--------------------
-- ��� ���ڸ� '*'��ȣ�� ����
select text, regexp_replace(text, '[0-9]', '*'), replace(text, '1', '*'), 
        regexp_replace(text, '[[:digit:]]', '*')
from reg;

select regexp_replace('127.0.0.1', '\.', '/'),
        regexp_replace('127.0.0.1', '\.', '/', 1, 1)
from dual;

select regexp_replace('aaa    bb bb', '( ){2,}', '')
from dual;

-- Ư�� ���ڿ� ���¸� �ٸ� ���·� ��ȯ
select regexp_replace('20211122',
                '([[:digit:]]{4})([[:digit:]]{2})([[:digit:]]{2})',
                '\1-\2-\3')
from dual;

------------------
-- regexp_count(): ���Խ������� �˻��Ͽ� Ư�� ������ ������ ��ȯ
------------------
select text, regexp_count(text, '[0-9]'), regexp_count(text, 'A'), 
                regexp_count(text, 'A', 1, 'i')
from reg;