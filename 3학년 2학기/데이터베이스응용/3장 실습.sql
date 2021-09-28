-- ���� �Լ�
select ename, initcap(ename), upper(ename), lower(ename) -- �� ���ڸ� �빮�ڷ� ���, �빮��, �ҹ���
from emp;

select ename, length(ename), lengthb(ename) -- ������ ����, ������ ������ ����Ʈ ��
from emp;

select length('�赿��'), lengthb('�赿��')
from dual; -- ���� ���̺�

-- concap() ���ڿ� ����
select concat(ename, sal), ename || sal
from emp;

select ename, substr(ename, 1, 3), substr(hiredate, 1, 2) year, substr(hiredate, 4, 2) month,
        substr(hiredate, -2, 2) day
--ename�� 1��° ������ 3�� ���, hiredate 4��° ������ 2�� ���
from emp;

select substr('�赿��', 2, 2)
from dual;

-- instr('���ڿ�' �Ǵ� �÷�, ã�� ����, ���� ��ġ, �� ��°����(1))
select instr('a-b-c-d-e', 'c', 1), instr('a-b-c-d-e', '-', 1, 2)
from dual;

select instr(hiredate, '/', 1, 2)
from emp;

-- lpad('���ڿ�' �Ǵ� �÷�, '�ڸ���', 'ä�﹮��')
select lpad('dhkim', 10, '*'), rpad('dhkim', 10, '#')
from dual;

-- ltrim('���ڿ�' �Ǵ� '�÷�', '������ ����')
select ltrim('      dhkim      d', ' '), rtrim('      dhkim      d', ' ')
from dual;

-- replace('���ڿ�' �Ǵ� �÷�, '����1', '����2')
select replace('dhkim', 'kim', 'lee')
from dual;

select replace(ename, substr(ename, 1, 1), '*')
from emp;


-- ���� �Լ�
select round(123.456, 0), round(123.456, 1), round(123.456, -1) -- �ݿø�
from dual;

select trunc(123.456, 0), trunc(123.456, 1), trunc(123.456, -1) -- ����
from dual;

select 10+2, 10-2, 10*2, 10/2
from dual;

select mod(10, 2) ������, ceil(123.456) ���尡���ū����, floor(123.456) ���尡�����������
from dual;

select power(2, 8) -- 2�� 8��
from dual;


-- ��¥ �Լ�
select sysdate ���糯¥, sysdate+100, sysdate-100
from dual;

-- �����, �Ի���(hiredate), �ٹ��ϼ�
select ename, hiredate �Ի���, round(sysdate-hiredate, 0) �ٹ��ϼ�, 
        round((sysdate-hiredate)/365, 0) �ٹ����
from emp;

select ename, round(months_between(sysdate, hiredate), 0) �ٹ�������
from emp;

select add_months(sysdate, 27), last_day(sysdate), next_day(sysdate, '��')
        -- ���� ��¥�� �������� 27���� ��, ���� ��¥�� �������� ���� �������� �ش��ϴ� ��¥, �������� ���� ��¥
from dual;

select sysdate, round(sysdate), trunc(sysdate) -- ���Ŀ� �۾��ߴٸ� round���� ���� ��¥�� ����
from dual;

-- ����ȯ �Լ�
desc emp;

-- ����Ŭ�� ���ڸ� �ڵ����� ���ڷ� ��ȯ ���������� ����ȯ
select 2 + '3'
from dual;

-- ��������� ����ȯ (TO_CHAR, TO_NUMBER, TO_DATE)
select 2 + to_number('10')
from dual;

-- to_char(��¥ -> ����)
-- yyyy/year/yy, mm/month, day(����), dd/ddth, hh/hh24, mi, ss
select sysdate, to_char(sysdate, 'yyyy'), to_char(sysdate, 'mm'), to_char(sysdate, 'dd')
from dual;

select ename, to_char(hiredate, 'yyyy'), to_char(hiredate, 'mm'), to_char(hiredate, 'day')
from emp;

-- to_char(���� -> ����)
select to_char(1234.56, '9,999'), to_char(1234.56, '$9,999.9'), to_char(1234.56, 'l9,999') -- L = ��
from dual;

select ename, sal, to_char(sal, '9,999')
from emp;

-- to_number()
select 2 + to_number('3')
from dual;

-- to_date()
select to_date('21/10/10'), extract(year from to_date('21/10/10'))
from dual;

select ename, hiredate, extract(year from hiredate), extract(month from hiredate),
        extract(day from hiredate)
from emp;

-- 1981�⵵�� �Ի��� ����� �˻�
select ename, hiredate
from emp
-- where hiredate between '81/01/01' and '81/12/31';
-- where extract(year from hiredate) = 1981;
where to_char(hiredate, 'yyyy') = '1981';