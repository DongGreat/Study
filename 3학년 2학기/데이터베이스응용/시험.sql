select name, pay, round(RATIO_TO_REPORT(pay) OVER (), 2)
from professor
where hpage is not null;

select grade, name, height, avg(height) over(partition by grade)
from student;

select name, position, decode(position, 'a full professor', 500, 'assistant professor', 300, 100) DECODE,
        case when position = 'a full professor' then 500
        when position = 'assistant professor' then 300
        else 100
        end CASE
from professor;

select name, hiredate, to_char(trunc(sysdate-hiredate), '99,999') 근무일수, 
                trunc(months_between(sysdate, hiredate)) 근무개월수
from professor
where position not in ('assistant professor', 'instructor');

select *
from student;

select *
from professor;

select *
from department;

select *
from (select position from professor)
pivot (count(*) for position in ('instructor', 'assistant professor', 'a full professor'));

select ename, regexp_like(ename, ^S)
from emp;

select grade, count(*), round(avg(height), 2)
from student
group by grade;

select name, height, replace(jumin, substr(jumin, 3, 4), '****') 주민번호
from student
where height >= 170 and height <= 179;

select name, FIRST_VALUE(hiredate) over()
from professor;

select name, ID
from student
where regexp_like(ID, '[[:digit:]]');

select ename
from emp
where regexp_like(ename, '^[A|E|I|O|U]');

select profno, s.name
from professor;

select grade, deptno1, count(*)
from student
group by rollup(grade, deptno1)
order by grade;

select name, FIRST_VALUE(hiredate) over()
from professor;

select grade, name, height, avg(height) over(partition by grade)

from student;