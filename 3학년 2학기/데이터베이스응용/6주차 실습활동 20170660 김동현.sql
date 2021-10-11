
--6th_�ǽ�Ȱ��
----------------

-- 1. �޿�+Ŀ�̼�  ���� �ִ�/�ּ�/��հ� �˻�
-- Ŀ�̼��� ���� ��� 0���� ���, ��� �ݾ��� ��� �Ҽ� ù°�ڸ����� ���
select round(max(sal + nvl(comm, 0)), 1) �ִ�, 
       round(min(sal + nvl(comm, 0)), 1) �ּ�,
       round(avg(sal + nvl(comm, 0)), 1) ���
from emp;


-- 2. �μ���/�⵵�� �Ի��� ����� �˻� (group by��,���η� ��� pivot �̿�)
select deptno, extract(year from hiredate) �⵵, count(*) �����
from emp 
group by deptno, extract(year from hiredate)
order by deptno;


-- 3. �μ���/�⵵�� �Ի��� ����� �˻� (���η� ���) - pivot �̿�
select *
from (select deptno, to_char(hiredate, 'yyyy') ���� from emp)
pivot (count(*) for ���� in ('1980', '1981', '1982', '1987'))
order by deptno;
-- pivot ������ to_char�� �� �� ����


-- 4. �����, ����, �Ի���, �ҼӺμ���պ���, �Ի����, ���޺���, �����Ի��ѻ���� �˻�
select ename, sal, hiredate,
        round(avg(sal) over (partition by deptno)) �ҼӺμ���պ���,
        rank() over(order by hiredate asc) �Ի����,
        ltrim(round(ratio_to_report(sal) over(), 3)) ���޺���,
        lag(ename, 1) over(order by hiredate) ���ӻ����
from emp;