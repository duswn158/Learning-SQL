--Q1) 사원테이블에서 평균 월급을 출력하자.
SELECT AVG(SAL) FROM EMP;

--Q2) 사원테이블에서 부서번호가 10인 부서에 근무하고 있는 사원들의 부서번호와 평균 월급을 출력하자.
SELECT DEPTNO, AVG(SAL) FROM EMP
HAVING DEPTNO = 10
GROUP BY DEPTNO;

--Q3) 사원테이블에서 직업이 'SALESMAN'인 사원들의 평균 월급을 출력하자.
SELECT JOB, AVG(SAL) FROM EMP
HAVING JOB = 'SALESMAN'
GROUP BY JOB;

--Q4) 사원테이블에서 부서별 평균 월급을 출력하자.
SELECT DEPTNO, AVG(SAL) FROM EMP
GROUP BY DEPTNO;

--Q5) 사원테이블에서 직업별 평균 월급을 출력하자.
SELECT JOB, AVG(SAL) FROM EMP
GROUP BY JOB;

--Q6) 사원 테이블에서 평균 커미션(COMM)을 출력하자.
SELECT AVG(COMM) FROM EMP;
-- NULL값 제외하고 값 있는애들만 평균

SELECT AVG(NVL(COMM,0)) FROM EMP;
-- NULL값을 0으로 두고 전체를 평균냄

--Q7) 사원테이블에서 10번 부서의 최대 월급을 출력하자.
SELECT DEPTNO, MAX(SAL) FROM EMP
HAVING DEPTNO = 10
GROUP BY DEPTNO;

--Q8) 사원테이블에서 부서별 최대 월급을 출력하자.
SELECT DEPTNO, MAX(SAL) FROM EMP
GROUP BY DEPTNO;

--Q9) 사원테이블에서 직업별 최대 월급을 출력하자.
SELECT JOB, MAX(SAL) FROM EMP
GROUP BY JOB;

--Q10) 사원테이블에서 직업이 'SALESMAN'인 사원들 중 최대월급을 출력하자.
SELECT JOB, MAX(SAL) FROM EMP
HAVING JOB = 'SALESMAN'
GROUP BY JOB;

SELECT MAX(SAL) FROM EMP
WHERE JOB = 'SALESMAN'
GROUP BY JOB;

-- 10번에서 최대월급을 받는 사원의 이름을 출력
SELECT ENAME, SAL FROM EMP WHERE SAL IN
(SELECT MAX(SAL) FROM EMP
WHERE JOB = 'SALESMAN'
GROUP BY JOB) AND JOB = 'SALESMAN';

SELECT * FROM EMP E,
(SELECT MAX(SAL) AS TOP 
FROM EMP
WHERE JOB = 'SALESMAN'
GROUP BY JOB) MYRES
WHERE E.SAL = MYRES.TOP
AND JOB = 'SALESMAN';
-- 테이블로 인라인뷰...?
-- 인라인 뷰는 FROM 절에 사용되는 서브 쿼리를 의미한다. 
