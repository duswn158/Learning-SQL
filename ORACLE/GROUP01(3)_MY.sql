--Q1) ������̺��� ��� ������ �������.
SELECT AVG(SAL) FROM EMP;

--Q2) ������̺��� �μ���ȣ�� 10�� �μ��� �ٹ��ϰ� �ִ� ������� �μ���ȣ�� ��� ������ �������.
SELECT DEPTNO, AVG(SAL) FROM EMP
HAVING DEPTNO = 10
GROUP BY DEPTNO;

--Q3) ������̺��� ������ 'SALESMAN'�� ������� ��� ������ �������.
SELECT JOB, AVG(SAL) FROM EMP
HAVING JOB = 'SALESMAN'
GROUP BY JOB;

--Q4) ������̺��� �μ��� ��� ������ �������.
SELECT DEPTNO, AVG(SAL) FROM EMP
GROUP BY DEPTNO;

--Q5) ������̺��� ������ ��� ������ �������.
SELECT JOB, AVG(SAL) FROM EMP
GROUP BY JOB;

--Q6) ��� ���̺��� ��� Ŀ�̼�(COMM)�� �������.
SELECT AVG(COMM) FROM EMP;
-- NULL�� �����ϰ� �� �ִ¾ֵ鸸 ���

SELECT AVG(NVL(COMM,0)) FROM EMP;
-- NULL���� 0���� �ΰ� ��ü�� ��ճ�

--Q7) ������̺��� 10�� �μ��� �ִ� ������ �������.
SELECT DEPTNO, MAX(SAL) FROM EMP
HAVING DEPTNO = 10
GROUP BY DEPTNO;

--Q8) ������̺��� �μ��� �ִ� ������ �������.
SELECT DEPTNO, MAX(SAL) FROM EMP
GROUP BY DEPTNO;

--Q9) ������̺��� ������ �ִ� ������ �������.
SELECT JOB, MAX(SAL) FROM EMP
GROUP BY JOB;

--Q10) ������̺��� ������ 'SALESMAN'�� ����� �� �ִ������ �������.
SELECT JOB, MAX(SAL) FROM EMP
HAVING JOB = 'SALESMAN'
GROUP BY JOB;

SELECT MAX(SAL) FROM EMP
WHERE JOB = 'SALESMAN'
GROUP BY JOB;

-- 10������ �ִ������ �޴� ����� �̸��� ���
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
-- ���̺�� �ζ��κ�...?
-- �ζ��� ��� FROM ���� ���Ǵ� ���� ������ �ǹ��Ѵ�. 
