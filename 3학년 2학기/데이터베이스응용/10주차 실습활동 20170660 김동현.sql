--10th_�ǽ�Ȱ��
-- 1.�����, �ҼӺμ���, ����, ������ �˻��ϴ� view(view_ed) ����
create or replace VIEW view_ed
as
select ename, dname, job, sal
from emp, dept
where emp.deptno = dept.deptno;

-- 2.������ ���� Ȱ���Ͽ� 3���̻� �Ҽӻ���� �ִ� �μ����� �μ���, �����, ��ձ޿� �˻� 
select dname, count(*), round(avg(sal), 1)
from view_ed
group by dname
having count(dname) >= 3;

-- 3. ����ڰ� ������ �� ���� ��ȸ
desc user_views;

select view_name, text, read_only
from user_views;

select *
from view_ed;

-- 4. 1���� ������ �� ����
drop view view_ed;

-- 5. ������ �並 ���� ���ο� ��� ����(�̸�, ����, ����)�� �Է��غ���, ���԰����Ѱ�?
insert into view_ed(ename, sal, job) values('KIM', 1000, 'SALESMAN');
-- ���� ���̱� ������ ������ �Ұ����ϴ�

-- 6. ���� �ֱٿ� �Ի��� ��� 5���� ����(�����, ����, �ҼӺμ���ȣ, �Ի���) �˻�
-- �ζ��� �� ���
select rownum, ename, job, deptno, hiredate
from (select rownum, ename, job, deptno, hiredate
        from emp
        order by hiredate)
where rownum <= 5;

-- 7.1981��뿡 �Ի��� ������� �����, ����, �ҼӺμ���պ��� �˻�
-- ��Į�� �������� ���
select a.ename, a.sal, (select avg(sal) from emp b where a.deptno = b.deptno)
from emp a
where extract(year from hiredate) = 1981;

-- 8. �Ҽӻ���� �ִ� �μ��� �˻�(������ ��������, exists �������� ���) 
select d.dname
from dept d
where exists (select 1 from emp e where d.deptno = e.deptno);