--Q1) ������̺��� ��� �̸��� ������ ���ϵ�, ������ ������������ �������.
SELECT ENAME, SAL FROM EMP
ORDER BY SAL DESC;

SELECT ENAME, SAL FROM EMP
ORDER BY 2 DESC;

--Q2) ������̺��� ������ ��� ������ ����ϵ� �÷� ALIAS�� '���' ���� �ϰ�, ��� ������ ���� ������ ��������.
SELECT JOB, AVG(SAL) AS ��� FROM EMP
GROUP BY JOB
ORDER BY AVG(SAL) DESC;
-- ��տ��� ''�� ���̶� �ȵǰ� �����ϰų� ""�� �����

--Q3) ������̺��� ������ �� ������ ���ϰ�, �� ������ 5000 �̻��� �͸� �������.
SELECT JOB, SUM(SAL) FROM EMP
HAVING SUM(SAL) >= 5000
GROUP BY JOB;

--Q4) ������̺��� �μ��� ������ ���� ���ϰ�, �� ������ 1000 �̻��� �͸� �������.
SELECT DEPTNO, SUM(SAL) FROM EMP
HAVING SUM(SAL) >= 1000
GROUP BY DEPTNO;