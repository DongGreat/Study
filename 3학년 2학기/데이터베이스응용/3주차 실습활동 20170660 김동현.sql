-- 1. ������� �̸�, ���(����sal *12)-õ�������б�ȣ/$��ȣǥ��, ����(����� 3.3%)
select ename �����, to_char(sal*12, '$999,999') ����, to_char(round(sal*12*0.033), '$999,999') ����
from emp;

-- 2. �Ի����� 1,2,3���� �������
-- �Ի����� �������� ������� ������� �����, �Ի���, �ٹ��ϼ�, �ٹ�������, �ٹ���� ���
select ename �����, hiredate �Ի���, trunc(sysdate-hiredate, 0) �ٹ��ϼ�, 
        trunc(months_between(sysdate, hiredate), 0) �ٹ�������, trunc((sysdate-hiredate)/365, 0) �ٹ����
from emp
where to_char(hiredate, 'mm') between '01' and '03';

-- 3. ������� ������ ���ڸ� '*' ���ڷ� ġȯ, �Ի����� ��(day)�� '*'���� �����ؼ� ����Ͻÿ�.
select replace(ename, substr(ename, -1, 1), '*') �����, replace(hiredate, substr(hiredate, -2, 2), '**') �Ի���
from emp;

-- 4. �����ȣ�� ¦���� ������� 
-- ������� 10�ڸ��� ����ϵ� ���� ���ڸ��� '*'��ȣ�� ä�� ����ϰ�,
-- ����� ������ ����'S'�� ���� �� ���
select lpad(ename, 10, '*') �����1, rtrim(ename, 'S') �����2
from emp
where mod(empno, 2) = 0;