-- ������� ��� ���ν���(%type ������ Ÿ��)
create or replace procedure Emp_Info1(p_empno in emp.empno%type)
    is
        v_empno emp.empno%type;
        v_ename emp.ename%type;
        v_sal   emp.sal%type;
    begin
        DBMS_OUTPUT.enable;
        select empno, ename, sal
        into v_empno, v_ename, v_sal
        from emp
        where empno = p_empno;
        -- ����� ���
        DBMS_OUTPUT.PUT_LINE('�����ȣ : ' || v_empno);
        DBMS_OUTPUT.PUT_LINE('����̸� : ' || v_ename);
        DBMS_OUTPUT.PUT_LINE('����޿� : ' || v_sal);
    end;
    /

-- DBMS_OUTPUT ������� ȭ�鿡 ����ϱ� ����
-- SET SERVEROUTPUT ON;

-- ���� ��� Ȯ��
-- EXECUTE Emp_Info1(7369);
-- �����ȣ : 7369
-- ����̸� : SMITH
-- ����޿� : 800


-- ������� ��ȸ (���յ�����Ÿ�� %ROWTYPE : �ϳ� �̻��� �����Ͱ��� ���� ������ Ÿ������ �迭�� ����� ������ �ϰ� ������ ����)
create or replace procedure Emp_Info2(p_empno in emp.empno%type)
is
        v_emp   emp%ROWTYPE;
    begin
        DBMS_OUTPUT.enable;
        -- %ROWTYPE ���� ���
        select empno, ename, hiredate
        into v_emp.empno, v_emp.ename, v_emp.hiredate
        from emp
        where empno = p_empno;
        -- ����� ���
        DBMS_OUTPUT.PUT_LINE('�����ȣ : ' || v_emp.empno);
        DBMS_OUTPUT.PUT_LINE('����̸� : ' || v_emp.ename);
        DBMS_OUTPUT.PUT_LINE('�� �� �� : ' || v_emp.hiredate);
    end;
    /


-- Ư�� �μ� ��� ���� ��� ���ν��� (PL/SQL ���̺� ������ Ÿ��)
create or replace procedure Emp_Info3(v_deptno in emp.deptno%type)
is
        type empno_table is table of emp.empno%type
        index by binary_integer;
        type ename_table is table of emp.ename%type
        index by binary_integer;
        type sal_table is table of emp.sal%type
        index by binary_integer;
        -- ���̺�Ÿ������ ������ �����ؼ� ���
        empno_tab   empno_table;
        ename_tab   ename_table;
        sal_tab     sal_table;
        i binary_integer := 0;
    begin
        DBMS_OUTPUT.enable;
        for emp_list in(select empno, ename, sal from emp where deptno = v_deptno) loop
            i := i + 1;
            empno_tab(i) := emp_list.empno;
            ename_tab(i) := emp_list.ename;
            sal_tab(i) := emp_list.sal;
        end loop;
        
        for cnt in 1..i loop
            -- TABLE������ ���� ������ �ѷ���
            DBMS_OUTPUT.PUT_LINE('�����ȣ : ' || empno_tab(cnt));
            DBMS_OUTPUT.PUT_LINE('����̸� : ' || ename_tab(cnt));
            DBMS_OUTPUT.PUT_LINE('����޿� : ' || sal_tab(cnt));
            DBMS_OUTPUT.PUT_LINE('------------------');
        end loop;
    end;
    /


-- PL/SQL RECORD ������Ÿ�� : ���� ���� ������ Ÿ���� ���� �������� ����
create or replace procedure Emp_Info4(p_empno in emp.empno%type)
is
        type emp_record is record
        (v_empno number, v_ename varchar2(30), v_hiredate date);
        emp_rec emp_record;
    begin
        DBMS_OUTPUT.enable;
        select empno, ename, hiredate
        into emp_rec.v_empno, emp_rec.v_ename, emp_rec.v_hiredate
        from emp
        where empno = p_empno;
        DBMS_OUTPUT.PUT_LINE('�����ȣ : ' || emp_rec.v_empno);
        DBMS_OUTPUT.PUT_LINE('����̸� : ' || emp_rec.v_ename);
        DBMS_OUTPUT.PUT_LINE('�Ի��� : ' || emp_rec.v_hiredate);
    end;
    /
    
    
-- insert��
-- ��� ��� ���ν���
create or replace procedure Insert_pro
        (v_empno in emp.empno%type,
         v_ename in emp.ename%type,
         v_deptno in emp.deptno%type)
is
    begin
        DBMS_OUTPUT.enable;
        insert into emp(empno, ename, hiredate, deptno)
        values(v_empno, v_ename, sysdate, v_deptno);
        DBMS_OUTPUT.PUT_LINE('�����ȣ : ' || v_empno);
        DBMS_OUTPUT.PUT_LINE('����̸� : ' || v_ename);
        DBMS_OUTPUT.PUT_LINE('����μ� : ' || v_deptno);
        DBMS_OUTPUT.PUT_LINE('������ ���� �Ϸ�');
    end;
    /

-- update
-- ���� : Ư�� ����� �޿��� ���� % �λ�/�����ϴ� ���ν���
create or replace procedure Update_Pro
        (v_empno in emp.empno%type,
         v_rate in number)
is
        v_emp emp%rowtype;
        
        begin
        DBMS_OUTPUT.enable;
        
        update emp
        set sal = sal+(sal * (v_rate/100))
        where empno = v_empno;
        
        DBMS_OUTPUT.PUT_LINE('������ ���� ����');
        
        -- ������ ������ Ȯ���ϱ� ���� �˻�
        select empno, ename, sal
        into v_emp.empno, v_emp.ename, v_emp.sal
        from emp
        where empno = v_empno;
        DBMS_OUTPUT.PUT_LINE(' **** ���� Ȯ�� **** ');
        DBMS_OUTPUT.PUT_LINE('�����ȣ : ' || v_emp.empno);
        DBMS_OUTPUT.PUT_LINE('����̸� : ' || v_emp.ename);
        DBMS_OUTPUT.PUT_LINE('����޿� : ' || v_emp.sal);
    end;
    /


create or replace function Update_fun
        (v_empno in emp.empno%type,
         v_rate in number)
return number
is
        v_emp emp%rowtype;
        
        begin
        DBMS_OUTPUT.enable;
        
        update emp
        set sal = sal+(sal * (v_rate/100))
        where empno = v_empno;
        
        DBMS_OUTPUT.PUT_LINE('������ ���� ����');
        
        -- ������ ������ Ȯ���ϱ� ���� �˻�
        select empno, ename, sal
        into v_emp.empno, v_emp.ename, v_emp.sal
        from emp
        where empno = v_empno;
        DBMS_OUTPUT.PUT_LINE(' **** ���� Ȯ�� **** ');
        DBMS_OUTPUT.PUT_LINE('�����ȣ : ' || v_emp.empno);
        DBMS_OUTPUT.PUT_LINE('����̸� : ' || v_emp.ename);
        DBMS_OUTPUT.PUT_LINE('����޿� : ' || v_emp.sal);
        
        return v_emp.sal;
    end;
    /


-- �Լ� ����
-- 1. ��ȯ�� ������ ���� ����
-- var sal number;
-- 2. �Լ� ����
-- exec :sal := update_fun(7839, 10);
-- 3. ������ Ȯ��
-- print sal;


-- Ư�� �μ��� ��ձ޿��� ������� ���
create or replace procedure ExpCursor(v_deptno dept.deptno%type)
is
        -- Ŀ�� ����
        cursor dept_avg
        is
            select dname, count(empno) cnt, round(avg(sal), 3) salary
            from emp e, dept d
            where e.deptno = d.deptno
                and e.deptno = v_deptno
            group by d.dname;
        
        -- Ŀ���� ��ġ�ϱ� ���� ���� ����
        v_dname dept.dname%type;
        emp_cnt number;
        sal_avg number;
    
        begin
            -- Ŀ���� ����
            open dept_avg;
            -- Ŀ���� ��ġ
            fetch dept_avg into v_dname, emp_cnt, sal_avg;
                DBMS_OUTPUT.PUT_LINE('�μ��� : ' || v_dname);
                DBMS_OUTPUT.PUT_LINE('����� : ' || emp_cnt);
                DBMS_OUTPUT.PUT_LINE('��ձ޿� : ' || sal_avg);
                DBMS_OUTPUT.PUT_LINE('-----------------------');
            -- Ŀ���� CLOSE
            close dept_avg;
    end;
    /


-- for���� ��� : Ŀ���� OPEN, FETCH, CLOSE�� �ڵ� �߻�
-- �μ��� ������� �޿� �հ� ���
create or replace procedure ForCursor
is
    cursor dept_sum is
        select dname, count(empno) cnt, sum(sal) salary
        from emp e, dept d
        where e.deptno = d.deptno
        group by dname;
    
    begin
        -- cursor�� for������ �����Ų��
        for emp_list in dept_sum loop
            DBMS_OUTPUT.PUT_LINE('�μ��� : ' || emp_list.dname);
            DBMS_OUTPUT.PUT_LINE('����� : ' || emp_list.cnt);
            DBMS_OUTPUT.PUT_LINE('�޿��հ� : ' || emp_list.salary);
            DBMS_OUTPUT.PUT_LINE('---------------------');
        
        end loop;
    end;
    /

-- execute forcursor;


-- Ŀ���� �Ӽ� Ȱ��
create or replace procedure AttrCursor
is
        v_empno emp.empno%type;
        v_ename emp.ename%type;
        v_sal emp.sal%type;
    cursor emp_list is
        select empno, ename, sal
        from emp;
    begin
        DBMS_OUTPUT.enable;
        open emp_list;
        loop
            fetch emp_list into v_empno, v_ename, v_sal;
                -- �����͸� ã�� ���ϸ� ���������ϴ�
                exit when emp_list%notfound;
        end loop;
        DBMS_OUTPUT.PUT_LINE('��ü ������ �� ' || emp_list%rowcount);
    close emp_list;
end;
/


-- Ʈ����
create or replace trigger sum_trigger
before
insert or update on emp
for each row
declare
    avg_sal number;
begin
    select round(avg(sal), 3) into avg_sal from emp;
    DBMS_OUTPUT.PUT_LINE('�޿� ��� : ' || avg_sal);
end;
/

insert into emp(empno, ename, job, hiredate, sal)
values(1000, 'LION', 'SALES', SYSDATE, 5000);