-- 1. �����, ����, Ŀ�̼�, ��� �˻�
-- ����� comm�� ���� ��� 'NO', ���� �ƴ� ��� 'YES'�� ��� (nvl/nv2�Լ� ���)
select ename, sal, comm, nvl2(comm, 'YES', 'NO') ���
from emp;

-- 2. �����, ����, ���ʽ� �˻�
-- ���ʽ��� ����(job)�� CLERK�̸� ������ 5%, SALESMAN�̸� ������ 10%, �׿ܴ� ������ 3% ����
-- decode�Լ�, case �� ����Ͽ� �˻�
select ename �����, job ����, decode(job, 'CLERK', sal*0.05, 
                                    'SALESMAN', sal*0.1,
                                    sal*0.03) ���ʽ�
from emp;
select ename �����, job ����, case when job='CLERK' then sal*0.05
                                    when job='SALESMAN' then sal*0.1
                                    else sal*0.03
                                    end ���ʽ�
from emp;

--3. �̸��� A,E,I,O,U �� �ϳ��� �����ϴ� ����� �˻� (regexp_like() ���)
select text from reg
where regexp_like(text, '^[A|E|I|O|U]');

-- 4. �̸��� ������ ���ڸ� '*' ���ڷ� ġȯ, �Ի����� '/'���ڸ� '-'���ڷ� ġȯ�Ͽ� ���
-- regexp_replace()�Լ� ���
select regexp_replace(ename, '[A-Z]$', '*') �����, regexp_replace(hiredate, '/', '-') �Ի���
from emp;

-- 5. �����, ����, �̸����ڿ����� 'S'���ڰ���, ���ް��� 0�� ���� ���
--regexp_count()�Լ� ���
select ename �����, sal ����, regexp_count(ename, 'S') "���� ����", regexp_count(sal, '0') "0�� ����"
from emp;