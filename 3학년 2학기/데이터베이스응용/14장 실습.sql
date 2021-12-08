-- 사원정보 출력 프로시저(%type 데이터 타입)
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
        -- 결과값 출력
        DBMS_OUTPUT.PUT_LINE('사원번호 : ' || v_empno);
        DBMS_OUTPUT.PUT_LINE('사원이름 : ' || v_ename);
        DBMS_OUTPUT.PUT_LINE('사원급여 : ' || v_sal);
    end;
    /

-- DBMS_OUTPUT 결과값을 화면에 출력하기 위해
-- SET SERVEROUTPUT ON;

-- 실행 결과 확인
-- EXECUTE Emp_Info1(7369);
-- 사원번호 : 7369
-- 사원이름 : SMITH
-- 사원급여 : 800


-- 사원정보 조회 (복합데이터타입 %ROWTYPE : 하나 이상의 데이터값을 갖는 데이터 타입으로 배열과 비슷한 역할을 하고 재사용이 가능)
create or replace procedure Emp_Info2(p_empno in emp.empno%type)
is
        v_emp   emp%ROWTYPE;
    begin
        DBMS_OUTPUT.enable;
        -- %ROWTYPE 변수 사용
        select empno, ename, hiredate
        into v_emp.empno, v_emp.ename, v_emp.hiredate
        from emp
        where empno = p_empno;
        -- 결과값 출력
        DBMS_OUTPUT.PUT_LINE('사원번호 : ' || v_emp.empno);
        DBMS_OUTPUT.PUT_LINE('사원이름 : ' || v_emp.ename);
        DBMS_OUTPUT.PUT_LINE('입 사 일 : ' || v_emp.hiredate);
    end;
    /


-- 특정 부서 사원 정보 출력 프로시저 (PL/SQL 테이블 데이터 타입)
create or replace procedure Emp_Info3(v_deptno in emp.deptno%type)
is
        type empno_table is table of emp.empno%type
        index by binary_integer;
        type ename_table is table of emp.ename%type
        index by binary_integer;
        type sal_table is table of emp.sal%type
        index by binary_integer;
        -- 테이블타입으로 변수를 선언해서 사용
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
            -- TABLE변수에 넣은 ㄱ밧을 뿌려줌
            DBMS_OUTPUT.PUT_LINE('사원번호 : ' || empno_tab(cnt));
            DBMS_OUTPUT.PUT_LINE('사원이름 : ' || ename_tab(cnt));
            DBMS_OUTPUT.PUT_LINE('사원급여 : ' || sal_tab(cnt));
            DBMS_OUTPUT.PUT_LINE('------------------');
        end loop;
    end;
    /


-- PL/SQL RECORD 데이터타입 : 여러 개의 데이터 타입을 갖는 변수들의 집합
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
        DBMS_OUTPUT.PUT_LINE('사원번호 : ' || emp_rec.v_empno);
        DBMS_OUTPUT.PUT_LINE('사원이름 : ' || emp_rec.v_ename);
        DBMS_OUTPUT.PUT_LINE('입사일 : ' || emp_rec.v_hiredate);
    end;
    /
    
    
-- insert문
-- 사원 등록 프로시저
create or replace procedure Insert_pro
        (v_empno in emp.empno%type,
         v_ename in emp.ename%type,
         v_deptno in emp.deptno%type)
is
    begin
        DBMS_OUTPUT.enable;
        insert into emp(empno, ename, hiredate, deptno)
        values(v_empno, v_ename, sysdate, v_deptno);
        DBMS_OUTPUT.PUT_LINE('사원번호 : ' || v_empno);
        DBMS_OUTPUT.PUT_LINE('사원이름 : ' || v_ename);
        DBMS_OUTPUT.PUT_LINE('사원부서 : ' || v_deptno);
        DBMS_OUTPUT.PUT_LINE('데이터 삽입 완료');
    end;
    /

-- update
-- 수정 : 특정 사원의 급여를 일정 % 인상/인하하는 프로시저
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
        
        DBMS_OUTPUT.PUT_LINE('데이터 수정 성공');
        
        -- 수정된 데이터 확인하기 위해 검색
        select empno, ename, sal
        into v_emp.empno, v_emp.ename, v_emp.sal
        from emp
        where empno = v_empno;
        DBMS_OUTPUT.PUT_LINE(' **** 수정 확인 **** ');
        DBMS_OUTPUT.PUT_LINE('사원번호 : ' || v_emp.empno);
        DBMS_OUTPUT.PUT_LINE('사원이름 : ' || v_emp.ename);
        DBMS_OUTPUT.PUT_LINE('사원급여 : ' || v_emp.sal);
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
        
        DBMS_OUTPUT.PUT_LINE('데이터 수정 성공');
        
        -- 수정된 데이터 확인하기 위해 검색
        select empno, ename, sal
        into v_emp.empno, v_emp.ename, v_emp.sal
        from emp
        where empno = v_empno;
        DBMS_OUTPUT.PUT_LINE(' **** 수정 확인 **** ');
        DBMS_OUTPUT.PUT_LINE('사원번호 : ' || v_emp.empno);
        DBMS_OUTPUT.PUT_LINE('사원이름 : ' || v_emp.ename);
        DBMS_OUTPUT.PUT_LINE('사원급여 : ' || v_emp.sal);
        
        return v_emp.sal;
    end;
    /


-- 함수 실행
-- 1. 반환값 저장할 변수 선언
-- var sal number;
-- 2. 함수 실행
-- exec :sal := update_fun(7839, 10);
-- 3. 변수값 확인
-- print sal;


-- 특정 부서의 평균급여와 사원수를 출력
create or replace procedure ExpCursor(v_deptno dept.deptno%type)
is
        -- 커서 정의
        cursor dept_avg
        is
            select dname, count(empno) cnt, round(avg(sal), 3) salary
            from emp e, dept d
            where e.deptno = d.deptno
                and e.deptno = v_deptno
            group by d.dname;
        
        -- 커서를 패치하기 위한 변수 선언
        v_dname dept.dname%type;
        emp_cnt number;
        sal_avg number;
    
        begin
            -- 커서의 오픈
            open dept_avg;
            -- 커서의 패치
            fetch dept_avg into v_dname, emp_cnt, sal_avg;
                DBMS_OUTPUT.PUT_LINE('부서명 : ' || v_dname);
                DBMS_OUTPUT.PUT_LINE('사원수 : ' || emp_cnt);
                DBMS_OUTPUT.PUT_LINE('평균급여 : ' || sal_avg);
                DBMS_OUTPUT.PUT_LINE('-----------------------');
            -- 커서의 CLOSE
            close dept_avg;
    end;
    /


-- for문을 사용 : 커서의 OPEN, FETCH, CLOSE가 자동 발생
-- 부서별 사원수와 급여 합계 출력
create or replace procedure ForCursor
is
    cursor dept_sum is
        select dname, count(empno) cnt, sum(sal) salary
        from emp e, dept d
        where e.deptno = d.deptno
        group by dname;
    
    begin
        -- cursor를 for문에서 실행시킨다
        for emp_list in dept_sum loop
            DBMS_OUTPUT.PUT_LINE('부서명 : ' || emp_list.dname);
            DBMS_OUTPUT.PUT_LINE('사원수 : ' || emp_list.cnt);
            DBMS_OUTPUT.PUT_LINE('급여합계 : ' || emp_list.salary);
            DBMS_OUTPUT.PUT_LINE('---------------------');
        
        end loop;
    end;
    /

-- execute forcursor;


-- 커서의 속성 활용
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
                -- 데이터를 찾지 못하면 빠져나갑니다
                exit when emp_list%notfound;
        end loop;
        DBMS_OUTPUT.PUT_LINE('전체 데이터 수 ' || emp_list%rowcount);
    close emp_list;
end;
/


-- 트리거
create or replace trigger sum_trigger
before
insert or update on emp
for each row
declare
    avg_sal number;
begin
    select round(avg(sal), 3) into avg_sal from emp;
    DBMS_OUTPUT.PUT_LINE('급여 평균 : ' || avg_sal);
end;
/

insert into emp(empno, ename, job, hiredate, sal)
values(1000, 'LION', 'SALES', SYSDATE, 5000);