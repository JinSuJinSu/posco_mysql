use sqldb;

select * from dept;

 -- 1. sqldb에 존재하는 모든 테이블의 리스트를 출력하시오.
 show tables;
 
 -- 2. emp 테이블과 dept 테이블의 구조를 출력하시오.
 desc emp;
 desc dept;
 
 -- 3. 사원(emp)테이블에서 모든 데이터를 출력하시오.
 select * from emp;
 
 -- 4. 사원테이블에서 사원번호, 사원이름, 월급을 출력하시오.
 select empno , ename , sal from emp;
 
 -- 5. 사원테이블에서 직무열만 뽑는데 중복된 데이터가 없게 출력하시오.
 select distinct job from emp;
 
 
-- 6. 사원테이블에서 사원이름과 월급을 출력하는데 각각의 컬럼명을
-- "이 름","월 급"으로 바꿔서 출력하시오. 단, ALIAS에 공백 추가
select ename "이 름", sal "월 급" from emp;

-- 7. 사원테이블에서 사원이름, 월급을 뽑고, 월급과 커미션을  더한 값을
-- 출력하는데 컬럼명을 '실급여'이라고 해서 출력하시오.
-- 단, 커미션 안받는사람제외
select ename, sal, sal+comm "실급여" from emp
where comm is not null;

-- 8. 사원테이블에서 'FORD'이라는 사원의 사원번호, 이름, 월급을 출력하시오.
 select empno , ename , sal from emp
 where ename= 'FORD';
 
-- 9. 사원테이블에서 직위가 'SALESMAN'인 사원의 사원번호, 이름, 직무를
-- 출력하시오.
 select empno , ename , job from emp
 where job= 'SALESMAN';
 
-- 10. 사원테이블에서 사원번호가 7499, 7521, 7654인 사원의 사원번호, 이름
-- 월급을 출력하시오.(두 개의 SQL 명령 작성(비교+논리 연산자, in 연산자)
 select empno , ename , sal from emp
 where empno in (7499, 7521,7654);
 
 select empno , ename , sal from emp
 where empno = 7499 or empno = 7521 or empno = 7654;

-- 11. 사원테이블에서 월급이 1500에서 3000사이인 사원의 사원번호, 이름,
-- 월급을 출력하시오.(두 개의 SQL 명령 작성(비교+논리 연산자, between~and 연산자)
select empno , ename , sal from emp
where sal between 1500 and 3000;

select empno , ename , sal from emp
where sal>=1500 and sal<=3000;


-- 12. 사원 테이블에서 매니저가 없는 직원의 이름을 출력하시오.
select ename from emp
where mgr is null;

-- 13. 사원테이블에서 월급이 많은 순으로 모든 정보를 출력하시오.
select * from emp
order by sal desc;

-- 14. 사원테이블에서 직원의 이름과 입사일을 출력하는데 최근에 입사한 순으로 출력하시오.
select ename, hiredate from emp
order by hiredate desc;

-- 15. 사원 테이블에서 30번 부서에 근무하는 직원들의 이름과 입사년월일을 출력하는데
-- 입사한지 오래된 순으로 출력하시오.
select ename, hiredate from emp
where deptno = 30
order by hiredate ;

-- 16. 이름에 'A' 가 들어간 직원들의 이름과 입사년월일을  출력하시오.
select ename, hiredate from emp
where ename like "%A%";

-- 17. 이름이 'S' 로 끝나는 직원들의 이름과 직무를  출력하시오
select ename, job from emp
where ename like "%S";




















 
 


 
 
 
 
 
 
 


