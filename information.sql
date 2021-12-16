SELECT ROUND(7777.56789 ,1) FROM DUAL;
SELECT ROUND(7777.56789 ,4) FROM DUAL;
SELECT ROUND(7777.56789 ,-2) FROM DUAL;
SELECT ROUND(7777.56789 ,-1) FROM DUAL;
SELECT ROUND(7777.56789 ,0) FROM DUAL;

SELECT '5%3', MOD(5,3) FROM DUAL;

SELECT CEILING(3.14), FLOOR(3.14), GREATEST(1,2,3,4,5), LEAST(1,2,3,4,5) FROM DUAL;

SELECT FORMAT(123456789.123456, 3) as "소수점 쉼표 구 분", 
 FORMAT(123456789, 4) as "정수 쉼표 구 분", FORMAT(123456789, 0) as "소 수 점이하 없이 정수 쉼표 구 분";
 
 SELECT 'A', ASCII('A'), ASCII(' ') FROM DUAL;
 SELECT CONCAT('java',' 화이팅') AS 화이팅;
 SELECT CONCAT_WS('**','sql',' 화이팅') AS '화이팅 !!';
 SELECT CONCAT(ename,'의 급 여는 ', sal, '입니다.') AS 명세 FROM EMP;
 
 SELECT '20200331', SUBSTRING('20200331',1,4) AS year
, SUBSTRING('20200331',5,2) AS month
 , SUBSTRING('20200331',7,2) AS day;
 
 SELECT TRIM(' java '), RTRIM(' java '), TRIM(BOTH 'ㅋ' FROM 'ㅋㅋjdbcㅋㅋㅋ');
 
 
 SELECT IF(3>5, 'true','false') FROM DUAL;
SELECT IF(3<5, 'true','false') FROM DUAL;
SELECT ename, IFNULL(comm, 0) FROM emp;
SELECT ename, IFNULL(comm, '미정') FROM emp;
SELECT ename, IFNULL(comm, 0) + 100 FROM emp;
SELECT ename, sal, IF(sal> 4000, 'T1', IF(sal> 3000, 'T2', IF(sal> 2000, 'T3', IF(sal> 1000, 'T4','T5')))) 
FROM emp;
 
 
 SELECT ename, sal, CASE 
 WHEN sal> 4000 THEN 'T1' 
 WHEN sal> 3000 THEN 'T2' 
 WHEN sal> 2000 THEN 'T3' 
 WHEN sal> 1000 THEN 'T4' 
 ELSE 'T5' END grade 
FROM emp;

select * from emp;

Select timestampdiff(year,hiredate,now()) from emp;
Select timestampdiff(week,hiredate,now()) from emp;
Select timestampdiff(month,hiredate,now()) from emp;

Select timestampdiff(month,cast('2021-01-01' as date) ,now());
Select timestampdiff(day,cast('2021-01-01' as date) ,now());

SELECT DATE_FORMAT(NOW(), "%Y년 %y년");
SELECT DATE_FORMAT('2021-01-03', "%m월 %c월");
SELECT DATE_FORMAT('2021-01-03', "%d월 %e월");
SELECT DATE_FORMAT(NOW(), "%H시 %h시 %l시");
SELECT DATE_FORMAT(NOW(), "%T %r");
SELECT NOW(), DATE_ADD(NOW(), INTERVAL 1 MINUTE);
SELECT NOW(), DATE_ADD(NOW(), INTERVAL 1 HOUR);
SELECT NOW(), DATE_ADD(NOW(), INTERVAL 1 DAY);
SELECT NOW(), DATE_ADD(NOW(), INTERVAL 1 MONTH);
SELECT NOW(), DATE_ADD(NOW(), INTERVAL 1 YEAR);


SELECT NOW(), SYSDATE() FROM DUAL;
SELECT ename, hiredate, NOW(), NOW()-hiredate, DATEDIFF(NOW(), hiredate)
, YEAR(hiredate), MONTH(hiredate), DAY(hiredate) FROM emp;
SELECT ename, WEEKDAY(hiredate) FROM EMP;
SELECT ename, case WEEKDAY(hiredate) 
when '0' then '월요일' 
when '1' then '화요일' 
when '2' then '수요일' 
when '3' then '목요일' 
when '4' then '금요일' 
when '5' then '토요일' 
when '6' then '일요일' 
end as '입사 요일' 
from emp;
SELECT case WEEKDAY(NOW()) 
when '0' then '월요일' 
when '1' then '화요일' 
when '2' then '수요일' 
when '3' then '목요일' 
when '4' then '금요일' 
when '5' then '토요일' 
when '6' then '일요일' 
end as '오늘의 요일' ;

