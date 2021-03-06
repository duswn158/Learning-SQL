--Q1) 사원테이블에서 사원 이름과 월급을 구하되, 월급을 내림차순으로 출력하자.
SELECT ENAME, SAL FROM EMP
ORDER BY SAL DESC;

SELECT ENAME, SAL FROM EMP
ORDER BY 2 DESC;

--Q2) 사원테이블에서 직업별 평균 월급을 출력하되 컬럼 ALIAS를 '평균' 으로 하고, 평균 월급이 높은 순으로 정렬하자.
SELECT JOB, AVG(SAL) AS 평균 FROM EMP
GROUP BY JOB
ORDER BY AVG(SAL) DESC;
-- 평균에서 ''는 값이라 안되고 생략하거나 ""로 써야함

--Q3) 사원테이블에서 직업별 총 월급을 구하고, 총 월급이 5000 이상인 것만 출력하자.
SELECT JOB, SUM(SAL) FROM EMP
HAVING SUM(SAL) >= 5000
GROUP BY JOB;

--Q4) 사원테이블에서 부서별 월급의 합을 구하고, 그 총합이 1000 이상인 것만 출력하자.
SELECT DEPTNO, SUM(SAL) FROM EMP
HAVING SUM(SAL) >= 1000
GROUP BY DEPTNO;