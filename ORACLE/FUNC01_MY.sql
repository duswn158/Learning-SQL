--Q1) ��� ���̺��� �μ��� �ִ� ������ �������.
SELECT DEPTNO, MAX(SAL) FROM EMP
GROUP BY DEPTNO;
-- �μ����̴ϱ� �μ��� GROUP BY


--Q2) ������̺��� ������ �ּ� ������ ���ϵ�, ������ 'CLERK' �� �͸� �������.
SELECT JOB, MIN(SAL) FROM EMP
HAVING JOB = 'CLERK'
GROUP BY JOB;

--Q3) ������̺��� Ŀ�̼��� å���� ����� ��� �� ������ �������.
SELECT COUNT(COMM) || '��', COUNT(NVL(COMM,0)) || '��' FROM EMP;

SELECT COUNT(COMM) FROM EMP
WHERE COMM IS NOT NULL;

--Q4) ������̺��� ������ 'SALESMAN'�̰� ������ 1000 �̻��� ����� �̸��� ������ �������.
SELECT ENAME, SAL FROM EMP
WHERE JOB = 'SALESMAN' AND SAL >= 1000;

--Q5) ������̺��� �μ��� ��� ������ ����ϵ�, ��� ������ 2000���� ū �μ��� �μ���ȣ�� ��� ������ �������.
SELECT DEPTNO, AVG(SAL) FROM EMP
HAVING AVG(SAL) > 2000
GROUP BY DEPTNO;

--Q6) ������̺��� ������ 'MANAGER' �� ����� ����ϵ�, ������ ���� ������ �̸�, ����, ������ �������.(��������)
SELECT ENAME, JOB, SAL FROM EMP
WHERE JOB = 'MANAGER'
ORDER BY SAL DESC;

SELECT ENAME, JOB, SAL FROM EMP
WHERE JOB = 'MANAGER'
ORDER BY 3 DESC;
-- 3 = ���� ����, 2 = �� ����, 1 = ENAME����
-- SELECT ���� ����Ǳ⶧���� 1,2,3��°�ΰ� ORDER BY�� ���� �����ϰ� ���� �ʰ� �����

--Q7) ������̺��� CUBE�� ����Ͽ� �� ������ �� ������ ����ϵ� ������ ���� ������ �������.(��������)
SELECT JOB, SAL, SUM(NVL(SAL,0)) FROM EMP
GROUP BY CUBE(JOB,SAL)
ORDER BY SUM(SAL) ASC;
-- �̷��� �ϸ� �Ѱ��� �����°� �ƴ϶� ����,���޺��� �ٳ��ͼ� ������� �ٸ�...

SELECT JOB, SUM(NVL(SAL,0)) FROM EMP
GROUP BY CUBE(JOB)
ORDER BY SUM(SAL) ASC; 
-- CUBE�ʿ���µ� �׳� �����Ѱ�

--Q8) ������̺��� ������ �� ������ ����ϵ�, ������ 'MANAGER'�� ������� �����ϰ�, �� ������ 5000���� ū ������ �������.
SELECT JOB, SUM(SAL) FROM EMP
HAVING NOT JOB = 'MANAGER' AND SUM(SAL) > 5000
GROUP BY JOB;

SELECT JOB, SUM(SAL) FROM EMP
HAVING JOB <> 'MANAGER' AND SUM(SAL) > 5000
GROUP BY JOB;
-- <> �� '�ƴϴ�'��

--Q9) ������̺��� ������ �ִ� ������ ����ϵ�, ������ 'CLERK' �� ������� �����ϰ�, �� ������ 2000 �̻��� ������ �ִ������ ������������ �����Ͽ� �������.
SELECT JOB, MAX(SAL) FROM EMP
HAVING NOT JOB = 'CLERK' AND MAX(SAL) >= 2000
GROUP BY JOB
-- GROP BY ���� ORDER BY�� ���� ���� ������
ORDER BY MAX(SAL) ASC;

SELECT JOB, MAX(SAL) FROM EMP
HAVING NOT JOB = 'CLERK' AND SUM(SAL) >= 2000
GROUP BY JOB
ORDER BY 2; 

--Q10) ������̺��� �μ��� �� ������ ����ϵ�, 30�� �μ��� �����ϰ�, �� ������ 8000 �̻��� �μ��� �� ������ ���� ������ �������.(��������)
SELECT DEPTNO, SUM(SAL) FROM EMP
HAVING NOT DEPTNO = 30 AND SUM(SAL) >= 8000
GROUP BY DEPTNO
ORDER BY SUM(SAL) DESC;

--Q11) ������̺��� �μ��� ��� ������ ����ϵ�, Ŀ�̼��� å���� ����� ���ϰ�, ��� ������ 1000 �޷� �̻��� �μ��� ���ϰ�, ��� ������ ���� ������ �������.(��������)
SELECT DEPTNO, AVG(SAL), NVL(COMM,1) FROM EMP
HAVING AVG(SAL) >= 1000 AND NVL(COMM,1) != 1
GROUP BY DEPTNO, COMM
ORDER BY AVG(SAL) DESC;
-- SELECT�� ���� �������� ����ǹǷ� �Ȉ� ���� �Ʒ� �ڵ�� �ٸ��ڵ巡

SELECT DEPTNO, AVG(SAL) FROM EMP
WHERE COMM IS NOT NULL
GROUP BY DEPTNO
ORDER BY AVG(SAL) DESC;





