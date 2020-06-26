--Q1) 사원 테이블에서 부서별 최대 월급을 출력하자.
SELECT DEPTNO, MAX(SAL) FROM EMP
GROUP BY DEPTNO;
-- 부서별이니까 부서로 GROUP BY


--Q2) 사원테이블에서 직업별 최소 월급을 구하되, 직업이 'CLERK' 인 것만 출력하자.
SELECT JOB, MIN(SAL) FROM EMP
HAVING JOB = 'CLERK'
GROUP BY JOB;

--Q3) 사원테이블에서 커미션이 책정된 사원은 모두 몇 명인지 출력하자.
SELECT COUNT(COMM) || '명', COUNT(NVL(COMM,0)) || '명' FROM EMP;

SELECT COUNT(COMM) FROM EMP
WHERE COMM IS NOT NULL;

--Q4) 사원테이블에서 직업이 'SALESMAN'이고 월급이 1000 이상인 사원의 이름과 월급을 출력하자.
SELECT ENAME, SAL FROM EMP
WHERE JOB = 'SALESMAN' AND SAL >= 1000;

--Q5) 사원테이블에서 부서별 평균 월급을 출력하되, 평균 월급이 2000보다 큰 부서의 부서번호와 평균 월급을 출력하자.
SELECT DEPTNO, AVG(SAL) FROM EMP
HAVING AVG(SAL) > 2000
GROUP BY DEPTNO;

--Q6) 사원테이블에서 직업이 'MANAGER' 인 사원을 출력하되, 월급이 높은 순으로 이름, 직업, 월급을 출력하자.(내림차순)
SELECT ENAME, JOB, SAL FROM EMP
WHERE JOB = 'MANAGER'
ORDER BY SAL DESC;

SELECT ENAME, JOB, SAL FROM EMP
WHERE JOB = 'MANAGER'
ORDER BY 3 DESC;
-- 3 = 월급 기준, 2 = 잡 기준, 1 = ENAME기준
-- SELECT 먼저 실행되기때문에 1,2,3번째인걸 ORDER BY가 구분 가능하고 제일 늦게 실행됨

--Q7) 사원테이블에서 CUBE를 사용하여 각 직업별 총 월급을 출력하되 월급이 낮은 순으로 출력하자.(오름차순)
SELECT JOB, SAL, SUM(NVL(SAL,0)) FROM EMP
GROUP BY CUBE(JOB,SAL)
ORDER BY SUM(SAL) ASC;
-- 이렇게 하면 총값만 나오는게 아니라 직업,월급별로 다나와서 결과값이 다름...

SELECT JOB, SUM(NVL(SAL,0)) FROM EMP
GROUP BY CUBE(JOB)
ORDER BY SUM(SAL) ASC; 
-- CUBE필요없는데 그냥 연습한거

--Q8) 사원테이블에서 직업별 총 월급을 출력하되, 직업이 'MANAGER'인 사원들은 제외하고, 총 월급이 5000보다 큰 직업만 출력하자.
SELECT JOB, SUM(SAL) FROM EMP
HAVING NOT JOB = 'MANAGER' AND SUM(SAL) > 5000
GROUP BY JOB;

SELECT JOB, SUM(SAL) FROM EMP
HAVING JOB <> 'MANAGER' AND SUM(SAL) > 5000
GROUP BY JOB;
-- <> 도 '아니다'임

--Q9) 사원테이블에서 직업별 최대 월급을 출력하되, 직업이 'CLERK' 인 사원들은 제외하고, 총 월급이 2000 이상인 직업과 최대월급을 오름차순으로 정렬하여 출력하자.
SELECT JOB, MAX(SAL) FROM EMP
HAVING NOT JOB = 'CLERK' AND MAX(SAL) >= 2000
GROUP BY JOB
-- GROP BY 보다 ORDER BY를 먼저 쓰면 오류남
ORDER BY MAX(SAL) ASC;

SELECT JOB, MAX(SAL) FROM EMP
HAVING NOT JOB = 'CLERK' AND SUM(SAL) >= 2000
GROUP BY JOB
ORDER BY 2; 

--Q10) 사원테이블에서 부서별 총 월급을 출력하되, 30번 부서를 제외하고, 총 월급이 8000 이상인 부서를 총 월급이 높은 순으로 출력하자.(내림차순)
SELECT DEPTNO, SUM(SAL) FROM EMP
HAVING NOT DEPTNO = 30 AND SUM(SAL) >= 8000
GROUP BY DEPTNO
ORDER BY SUM(SAL) DESC;

--Q11) 사원테이블에서 부서별 평균 월급을 출력하되, 커미션이 책정된 사원만 구하고, 평균 월급이 1000 달러 이상인 부서만 구하고, 평균 월급이 높은 순으로 출력하자.(내림차순)
SELECT DEPTNO, AVG(SAL), NVL(COMM,1) FROM EMP
HAVING AVG(SAL) >= 1000 AND NVL(COMM,1) != 1
GROUP BY DEPTNO, COMM
ORDER BY AVG(SAL) DESC;
-- SELECT가 가장 마지막에 실행되므로 안댬 위와 아래 코드는 다른코드래

SELECT DEPTNO, AVG(SAL) FROM EMP
WHERE COMM IS NOT NULL
GROUP BY DEPTNO
ORDER BY AVG(SAL) DESC;





