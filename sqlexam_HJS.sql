use sqldb;
select * from emp;
select * from dept;
select * from locations;
select * from salgrade;

-- 1. 30번 부서의 직무별 급여의 평균을 파악하고자 합니다.
--    출력 컬럼명 : "직무", "급여 평균"    
--   연봉의 평균은 백단위까지 나타냅니다..

select job as "직무", truncate(avg(sal),-2) as "급여 평균"
from emp
where deptno=30
group by job;


-- 2. 근무 중인 직원이 4명 이상인 부서의 정보를 출력합니다.
--   출력 컬럼명 : "부서명", "직원 수"

select dept.dname as "부서명", count(emp.ename) as "직원 수"
from emp
join dept
on emp.deptno=dept.deptno
group by dept.dname
having count(emp.ename)>=4;

-- 3. 직무별(job) 급여의 합을 출력하고 마지막에 누적 집계도 출력합니다. 누적 집계를 출력하는 행의 직무명은 'TOTAL'를 
-- 출력합니다. 또한 금액에는 천단위마다 콤마(,)를 출력합니다.
--    출력 컬럼명 : "직무명", "급여의 합"
select ifnull(job, 'TOTAL') as "직무명", format(sum(sal),0) as "급여의 합"
from emp
group by job
with rollup;

-- 4. 이 회사에서 월급을 제일 많이 받는 사람의 이름과 월급 그리고 급여 등급을 출력하시오. 
--    출력 컬럼명 :  "직원명", "급여", "급여 등급"
select emp.ename as "직원명", emp.sal as "급여", salgrade.grade as "급여 등급"
from emp
join salgrade
on emp.sal between salgrade.losal and salgrade.hisal
where emp.sal = (select max(sal) from emp);

-- 5. 1981년에 입사한 직원들의 이름을 월급을 많이 받는 순으로 출력합니다. 급여는 sql + comm 으로 계산하는데
-- comm 이 null인 경우에는 0으로 계산합니다.
-- 또한 천단위마다 , 를 붙이고 뒤에 '원' 을 붙여서  출력합니다. 출력 컬럼명 : "직원명", "급여"
select ename as "직원명", concat(format(sal + ifnull(comm,0),0),'원') as "급여"
from emp
where year(hiredate)=1981
order by sal + ifnull(comm,0) desc;


-- 6. 입사한 년도가 1980년이면 'A' 를 1981년이면 'B'를 1982년이면 'C'를 1983년이면 'D'로 그룹을 출력합니다.
--     출력 컬럼명 : "직원명", "입사년월일", "그룹"
--     입사년월일은 'XXXX년 XX월 XX일'로 표현한다.
select ename as "직원명", date_format(hiredate, "%Y년 %m월 %d일") as "입사년원일",
case
		when year(hiredate) = 1980 then 'A'
		when year(hiredate) = 1981 then 'B'
		when year(hiredate) = 1982 then 'C'
        when year(hiredate) = 1983 then 'D'
		else '없음'
		end as "그룹"
from emp;


-- 7. 사원번호와 사원이름, 그리고 그 사원을 관리하는 관리자의 사원번호와 사원이름을 출력하되 각각의 컬럼명을 "사원 사번",
--    "사원 이름", "관리자 사번", "관리자 이름"으로 출력하는데 관리자가 없는 직원은 제외합니다.
select emp1.empno as "사원 사번", emp1.ename as "사원 이름",
emp2.empno as "관리자 사번", emp2.ename as "관리자 이름"
from emp as emp1
join emp as emp2
on emp1.mgr = emp2.empno;


-- 8. 'CHICAGO' 라는 도시에서 근무중인 직원의 사번, 성명 그리고 부서번호를 출력합니다.(JOIN 구문으로 해결)
select emp.empno, emp.ename, emp.deptno
from emp
join dept
on emp.deptno = dept.deptno
join locations
on dept.loc_code = locations.loc_code
where locations.city ='CHICAGO';

-- 'CHICAGO' 라는 도시에서 근무중인 직원의 사번, 성명 그리고 부서번호를 출력합니다.(서브쿼리 구문으로 해결)
select empno, ename, deptno
from emp
where deptno = (select deptno from dept
			 where loc_code = (select loc_code from locations
								where city='CHICAGO'));
                                
-- 30번 부서의 직원들의 급여보다 많은 급여를 받는 직원들의 이름을 출력합니다.
select ename, sal
from emp
where sal > all(select sal from emp
				where deptno=30)
order by sal;



