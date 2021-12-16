
select * from emp;
select * from dept;

-- 1. 사원 테이블에서 사원이름을 소문자로 출력하고 컬럼명을 사원이름으로 설정하시오.
--  [결과]       사원이름
--           ---------------------
--                  smith

select LOWER(ename) as "사원이름" from emp; 

-- 2. 사원테이블에서 사원이름과 사원 이름의 두번째 글자부터 다섯번째까지, 앞에서 2개, 뒤에서 3개를
-- 출력하시오.
-- [결과]         사원이름    2-5문자   앞에서 2개     뒤에서 3개
--                  ---------------------------------------
--                  SMITH        MITH         SM               ITH

select ename "사원이름", substring(ename,2,4) "2-5문자",
left(ename,2) "앞에서 2개", right(ename,3) "뒤에서 3개" from emp;

-- 3. 사원테이블의 사원 이름의 문자 개수를 출력하시오. 컬럼명은 '사원명 문자갯수'
--  [결과]         사원명 문자갯수
--                  ----------------
--                       5

select length(ename) as "사원명 문자갯수" from emp;

-- 4. 사원테이블에서 사원 이름의 앞 글자 하나와 마지막 글자 하나만 출력하되 
-- 모두 소문자로 각각 출력하시오.
--   [결과]    사원명  결과
-- 			 SMITH   sh   
-- 			 ALLEN   an   

select ename as "사원명", 
concat(lower(left(ename,1)),lower(right(ename,1))) as "결과" from emp;



-- 5. 3456.78을 반올림하여 소수점 아래 첫번째 자리 까지만 나타내시오
select round(3456.78,1) as "결과값";

-- 6. 월급에 50를 곱하고 십단위는 절삭하여 출력하는데 월급뒤에 '원'을 붙이고 
--    천단위마다 ','를 붙여서 출력한다.
-- [결과]	계산 결과
-----------------
--          40,000원
-- 			80,000원
-- 			62,500원
-- 			148,700원

select concat(format(truncate(sal*50,-2),0),"원") as "계산 결과" from emp;

-- 7. 직원 이름과 커미션 설정 여부를 출력하는데 설정되었으면 커미션 값을
--    설정되지 않았으면 '미정'을 출력하시오.
-- [결과]	사원명	결과	
-----------------------------
-- 			 SMITH	미정	
-- 			ALLEN	300	

select ename as "사원명", ifnull(comm, "미정") as "결과" from emp;

-- 8. 직원 이름과 커미션 설정 여부를 출력하는데 설정되었으면 '설정됨'을 
--    설정되지 않았으면 '설정안됨'을 출력하시오.
--  [결과] 	사원명	결과	
-----------------------------
-- 			SMITH	설정안됨	
-- 			ALLEN	설정됨	

select ename as "사원명", if(comm is null,"설정안됨","설정됨") as "결과" from emp;

-- 9. 직원 이름과 부서번호 그리고 부서번호에 따른 부서명을 출력하시오.
--    부서가 없는 직원은 '없당' 을 출력하시오.
--    (부서명 : 10 이면 'A 부서', 20 이면 'B 부서', 30 이면 'C 부서')
--  [결과]  사원명	결과	
-----------------------------
-- SMITH	B부서	
-- ALLEN	C부서

select ename "사원명", case
			when deptno = 10 then 'A 부서'
            when deptno = 20 then 'B 부서'
            when deptno = 30 then 'C 부서'
            else '없당'
            end as "결과"
from emp;


-- 10. 오늘날짜와 오늘날짜에서 10일을 더한 날짜를 출력하시오.
select now() as "오늘날짜", date_add(now(), interval 10 day) as "10일 더한 날짜";

-- 11. 현재 시간을 "....년 ..월 ..일 ..시 ..분" 으로 출력하시오. 컬럼명은 '현재시간'으로 설정한다.
select date_format(now(),"%Y년 %c월 %e일 %H시 %i분")  as "현재시간";

-- 12. 직원의 이름, 월급여, 연봉을 조회하는 질의를 작성하시오.
-- (단, 직원의 연봉은 200의 월 보너스를 포함하여 계산합니다.)


--  [결과]   이름              월급여               연봉
---------------------------------------------------
-- 			SMITH             800                 12000
-- 			ALLEN            1600                 21600
-- 			WARD             1250                 17400
-- 						

select ename "이름", sal "월급여", (sal+200)*12 as "연봉" from emp;

-- 13.  다음과 같이 급여가 0~1000이면 'A', 1001~2000이면 'B', 2001~3000이면 'C', 
--            3001~4000이면 'D', 4001이상이면 'E'를 '코드'라는 열에 출력한다.
-- --[결과 ]  이름        월급   코드 
-- --       -----------------------
-- 			SMITH    800  A    
-- 			ALLEN   1600  B    
-- 			WARD    1250  B    

select ename as "이름", sal as "월급", case
		when sal between 0 and 1000 then 'A'
        when sal between 1001 and 2000 then 'B'
        when sal between 2001 and 3000 then 'C'
        when sal between 3001 and 4000 then 'D'
        else 'E' end as "코드"
        from emp;
        
-- 14. 이름의 두번째 문자가 “A”인 모든 직원의 이름을 조회하는 질의를 작성하시오.
--           (두 개의 SELECT 명령을 작성하는데 하나는 like 연산자를 다른 하나는 함수로 해결하시오)

-- [결과 ]  ENAME
--             ----------
-- 	WARD 
-- 	MARTIN
-- 	JAMES

select ename from emp
where ename like '_A%';

select ename from emp
where substring(ename,2,1)='A';


-- 15.   모든 직원의 이름과 현재까지의 입사기간을 월단위로 조회하는 질의를 작성하시오
--   (이때, 입사기간에 해당하는 열별칭은 “MONTHS WORKED”로 하고,   
--  입사기간이 가장 큰 직원순(입사한지 오래된 순)으로 정렬한다.)

-- 출력예)
-- ENAME         MONTHS WORKED
--------------------------------
-- SMITH           491
-- ALLEN           489

select ename, timestampdiff(month,hiredate,now()) as 'months worked'
from emp
order by timestampdiff(month,hiredate,now()) desc;


-- 16. 사원테이블에서 사원이름과 사원들의 오늘 날짜까지의 근무일수를 구하시오.
-- 사원이름   근무일수
-- -----------------------
-- SMITH    14974일
-- ALLEN    14909일

select ename as "사원이름" , concat(timestampdiff(day,hiredate,now()),'일') as '근무일수' from emp;

-- 17. 1981년도에 입사한 직원들의 이름, 직무 그리고 입사일을 입사한 순으로 출력하시오.
select ename "사원이름", job "직무", hiredate "입사일"
from emp
where year(hiredate)=1981
order by hiredate;

-- 18. 내생일을 기준으로 요일을 출력하는 SQL  명령을 작성하시오.(요일을 숫자로)
select dayofweek('1993-04-29') as "내생일";

-- 19. 내생일을 기준으로 요일을 출력하는 SQL  명령을 작성하시오.(요일을 요일명으로)
select case dayofweek('1993-04-29') 
		when 1 then '일요일'
        when 2 then '월요일'
        when 3 then '화요일'
		when 4 then '수요일'
        when 5 then '목요일'
        when 6 then '금요일'
        else '토요일' end as "내생일";
        
-- 20. 현재를 기준으로 내가 태어난지 몇 개월 되었는지 알 수 있는  SQL 명령을 작성하시오
select timestampdiff(month,cast('1993-04-29' as date),now()) as "내가 태어난 개월수";

-- 21. 사원테이블에서 이름의 첫글자가 A이고 마지막 글자가 N이 아닌 사원의
-- 이름을 출력하시오.
select ename as "사원이름"
from emp
where left(ename,1)='A' and right(ename,1)!='N';

-- 22. 평균급여보다 많은 급여를 받는 직원들의 직원번호, 이름, 월급을
-- 출력하되, 월급이 높은 사람 순으로 출력한다.
--  EMPNO ENAME    SAL
---------- ------ ----------
-- 7839	KING	5,000원
-- 7788	SCOTT	3,000원
-- 7902	FORD	3,000원
-- 7566	JONES	2,975원
-- 7698	BLAKE	2,850원
-- 7782	CLARK	2,450원

select empno, ename, concat(format(sal,0),"원") as "sal"
from emp
where sal > (select avg(sal) from emp)
order by sal desc;


-- 23. 30번 부서의 직원들과 동일한 해에 입사한 직원들의 이름, 월급, 
--   부서번호 그리고 입사년도를 출력한다.(30번부서 제외하고)
--   또한 월급을 적게 받는 순으로 출력한다.     
-- Ename        Sal            DeptNo         HireYear
---------- ---------- ---------- ----------
--  CLARK        2450      10      	1981 
-- JONES        2975         20      	1981 
-- FORD         3000         20      	1981 
--  KING          5000        10     	 1981

select ename, sal, deptno, year(hiredate) as "hireyear"
from emp
where deptno!=30 and year(hiredate) in (select year(hiredate)
						from emp
                        where deptno=30)
order by sal;

-- 24. 'BLAKE'와 같은 부서에 있는 직원들의 이름과 입사일을 뽑는데 'BLAKE'는 빼고 출력한다. 
-- ENAME      HIREDATE
---------- --------
-- ALLEN       1981-02-20 
-- WARD        1981-02-22 
-- MARTIN    1981-09-28 
-- TURNER     1981-09-08 
-- JAMES        1981-10-03 

select ename, hiredate
from emp
where ename!='BLAKE' and deptno=(select deptno from emp
									where ename='BLAKE');
                                    
-- 25. 이름에 'T'를 포함하고 있는 직원들과 같은 부서에서 근무하고
--   있는 직원의 직원번호와 이름을 출력한다.(출력 순서 무관)
-- EMPNO ENAME     
---------- ----------
-- 7902	FORD
-- 7566	JONES
-- 7369	SMITH
-- 7788	SCOTT
-- 7900	JAMES
-- 7844	TURNER
-- 7698	BLAKE
-- 7654	MARTIN
-- 7521	WARD
-- 7499	ALLEN  

select empno, ename
from emp
where deptno in (select deptno from emp
				where ename like '%T%');
                
-- 26 급여가 평균급여보다 많고,이름에 S자가 들어가는 직원과 동일한
--  부서에서 근무하는 모든 직원의 직원번호,이름 및 급여를 출력하시오.(출력 순서 무관)
-- EMPNO      ENAME      SAL
----------  --------  -------
-- 7902	     FORD	      3000
-- 7566	     JONES      2975
-- 7788	     SCOTT      3000
-- 7698	     BLAKE      2850
select empno, ename, sal
from emp
where sal > (select avg(sal) from emp) and
deptno in (select deptno from emp
			where ename like '%S%');
            
            
-- 27. 30번 부서에 있는 직원들 중에서 가장 많은 월급을 받는 직원보다
--   많은 월급을 받는 직원들의 이름, 부서번호, 월급을 출력한다. 
--   (단, ALL 또는 ANY 연산자를 사용할 것)
--  이름    부서번호   월급
--------------------------------
-- JONES	20	2975
-- SCOTT	20	3000
-- FORD	20	3000
-- KING	10	5000

select ename "이름", deptno "부서번호", sal "월급"
from emp
where sal > all(select sal from emp
				where deptno=30)
order by sal;
                
-- 28. SALES 부서에서 일하는 직원들의 부서번호, 이름, 직업을 출력한다.
-- --부서 정보    직원명       직무      
-- ---------- ---------- ---------
-- --30번 부서  ALLEN	       SALESMAN
-- --30번 부서  WARD	       SALESMAN
-- --30번 부서  MARTIN      SALESMAN
-- --30번 부서  BLAKE	       MANAGER
-- --30번 부서  TURNER      SALESMAN
-- --30번 부서  JAMES	       CLERK

select concat(emp.deptno,"번 부서") "부서 정보", emp.ename "직원명", emp.job "직무"
from emp
where emp.deptno=(select dept.deptno from dept
				where dname = 'SALES');
                
-- 29. 'KING'에게 보고하는 모든 직원의 이름과 입사날짜를 출력한다. 
--     (KING에게 보고하는 직원이란 mgr이 KING인 직원을 의미함) 
-- 이름         입사날짜
---------- ----------
-- JONES	   1981년 04월 02일
-- BLAKE	   1981년 04월 01일
-- CLARK   1981년 06월 01일

select ename as "이름", date_format(hiredate,"%Y년 %m월 %d일") as "입사날짜"
from emp
where mgr=(select empno from emp
			where ename='KING');
            

-- 30. 이름의 글자 갯수가 5 초과인 직원들의 정보만 출력한다.

--  EMPNO ENAME  JOB      MGR  HIREDATE   SAL  COMM DEPTNO 
----------------------------------------------------------------
--  7654 MARTIN SALESMAN 7698 1981-09-28 1250  300     30 
--  7844 TURNER SALESMAN 7698 1981-09-08 1500    0     30 
--  7934 MILLER CLERK    7782 1982-01-23 1300 NULL     10

select * from emp
where length(ename)>5;


        
		


        







