--10th_실습활동
-- 1.사원명, 소속부서명, 직급, 봉급을 검색하는 view(view_ed) 생성
create or replace VIEW view_ed
as
select ename, dname, job, sal
from emp, dept
where emp.deptno = dept.deptno;

-- 2.생성된 뷰을 활용하여 3명이상 소속사원이 있는 부서들의 부서명, 사원수, 평균급여 검색 
select dname, count(*), round(avg(sal), 1)
from view_ed
group by dname
having count(dname) >= 3;

-- 3. 사용자가 생성한 뷰 정보 조회
desc user_views;

select view_name, text, read_only
from user_views;

select *
from view_ed;

-- 4. 1에서 생성된 뷰 삭제
drop view view_ed;

-- 5. 생성된 뷰를 통해 새로운 사원 정보(이름, 봉급, 직급)를 입력해보자, 삽입가능한가?
insert into view_ed(ename, sal, job) values('KIM', 1000, 'SALESMAN');
-- 복합 뷰이기 때문에 삽입이 불가능하다

-- 6. 가장 최근에 입사한 사원 5명의 정보(사원명, 직급, 소속부서번호, 입사일) 검색
-- 인라인 뷰 사용
select rownum, ename, job, deptno, hiredate
from (select rownum, ename, job, deptno, hiredate
        from emp
        order by hiredate)
where rownum <= 5;

-- 7.1981년대에 입사한 사원들의 사원명, 봉급, 소속부서평균봉급 검색
-- 스칼라 서브쿼리 사용
select a.ename, a.sal, (select avg(sal) from emp b where a.deptno = b.deptno)
from emp a
where extract(year from hiredate) = 1981;

-- 8. 소속사원이 있는 부서명 검색(다중행 서브쿼리, exists 서브쿼리 사용) 
select d.dname
from dept d
where exists (select 1 from emp e where d.deptno = e.deptno);