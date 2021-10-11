-- �μ��� �޿� �Ѿ�
select deptno, sum(sal)
from emp
group by deptno
order by deptno;

-- �μ��� �޿� �Ѿ� (���η� ���: decode() �Լ�)
select sum(decode(deptno, 10, sal)) "10���μ��Ѻ���",
       sum(decode(deptno, 20, sal)) "20���μ��Ѻ���",
       sum(decode(deptno, 30, sal)) "30���μ��Ѻ���"
from emp;

-- �μ��� �޿� �Ѿ� (���η� ���: pivot() �Լ�)
select *
from (select deptno, sal from emp)
pivot (sum(sal) for deptno in (10, 20, 30));

-- �μ���/���޺� �ο� �� �˻� (decode())
select deptno, count(decode(job, 'SALESMAN', empno)) salseman,
               count(decode(job, 'CLERK', empno)) clerk,
               count(decode(job, 'MANAGER', empno)) manager
from emp
group by deptno
order by deptno;

-- �μ���/���޺� �ο� �� �˻� (pivot())
select *
from (select deptno, job from emp)
pivot (count(*) for job in ('SALESMAN', 'CLERK', 'MANAGER', 'PRESIDENT', 'ANALYST'))
order by deptno;

-- �׷��Լ� (�����Լ�, �����Լ�) - sum, count, max, min, avg...
-- �׷��Լ��� �ϳ��� ��

-- �м��Լ� (�����Լ�) over()
-- �м��Լ��� �� ������
-- �׷� �� ���� ����: rank(), dense_rank(), row_number()
-- �׷� �� ���� ����: sum, count, max, min, avg
-- �׷� �� ���� ����: lag(), lead()
-- �׷� �� ���� ����: ratio_to_report()

select sum(sal)
from emp;

-- �����, ���޼���
select ename, sal, hiredate,
                   rank() over(order by sal desc) ���޼���1,
                   dense_rank() over(order by sal desc) ���޼���2,
                   row_number() over(order by sal desc, hiredate) ���޼���3
from emp;

-- ���Ϻμ��� ���޼���
select ename, sal, hiredate, deptno,
                   rank() over(order by sal desc) ���޼���,
                   rank() over(partition by deptno order by sal desc) �μ������޼���
from emp
order by deptno;

-- �����, ����, ��ü����
select ename, sal, deptno,
                   sum(sal) over() ��ü����, 
                   sum(sal) over (order by empno) ��������,
                   sum(sal) over (partition by deptno) �μ��������Ѿ�,
                   round(avg(sal) over (partition by deptno)) ���
from emp
order by deptno;

-- lag(): ���� ���� �� ���
-- lead(): ���� ���� �� ���

select ename, hiredate, lag(sal, 1, 0) over (order by hiredate),
                        lead(sal, 2, 0) over (order by hiredate)
from emp;

-- �����, ����, �����Ѿ�, ����(����/��ü�����հ�)
select ename, sal, sum(sal) over (),
                   round(sal / sum(sal) over()*100, 3) || '%' ����,
                   round(ratio_to_report(sal) over(), 3) ����
from emp;

-- �����, ����, �����Ѿ�, ����(����/���Ϻμ��������Ѿ�)
select ename, sal, deptno,
                   sum(sal) over() ��ü�����Ѿ�,
                   sum(sal) over(partition by deptno) �μ��������Ѿ�,
                   round(sal / sum(sal) over(partition by deptno)*100, 3) || '%' �μ�������,
                   round(ratio_to_report(sal) over(partition by deptno), 3) �μ�������
from emp
order by deptno;

-- �μ��� �����޿��Ѿ� ����(group by�� ���)
select deptno, sum(sal) �μ��������Ѿ�, sum(sum(sal)) over() �����Ѿ�,
               round(sum(sal) / sum(sum(sal)) over(), 3) "2",
               round(ratio_to_report(sum(sal)) over(), 3) "3"
from emp
group by deptno;