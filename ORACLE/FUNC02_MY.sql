--Q1) ��� ���̺��� ����̸��� ù���ڴ� �빮�ڷ�, �������� �ҹ��ڷ� �������.
SELECT INITCAP(ENAME) FROM EMP;

SELECT SUBSTR(UPPER(ENAME), 1, 1) ||
SUBSTR(LOWER(ENAME), 2) FROM EMP;

--Q2) ������̺��� ����̸��� ����ϰ�, �̸��� �ι�° ���ں��� �׹�° ���ڵ� �������.
SELECT ENAME, SUBSTR(ENAME, 2, 3) FROM EMP;
-- 2��°���� 3�� ���

--Q3) ������̺��� �� ��� �̸��� ö�� ������ �������.
SELECT ENAME, LENGTH(ENAME) FROM EMP;

SELECT LENGTH ('��'), LENGTHB ('��') FROM DUAL;
-- �ѱ� 1���ڴ� 3BYTE�� ���� ����� 1BYTE

--Q4) ������̺��� �� ��� �̸��� �� ���� �ϳ��� ������ ���� �ϳ��� ����ϵ�, �ҹ��ڷ� ����϶�.
SELECT ENAME, LOWER(SUBSTR(ENAME, 1,1)) || LOWER(SUBSTR(ENAME, -1,LENGTH(ENAME))) FROM EMP;

SELECT ENAME, LOWER(SUBSTR(ENAME, 1,1)) || LOWER(SUBSTR(ENAME, -1,1)) FROM EMP;

--Q5) 3456.78�� �Ҽ��� ù��° �ڸ����� �ݿø��ؼ� �������.
SELECT ROUND(3456.78, 0) FROM DUAL;
-- �ڸ��� ���� �����ϸ� 0 �ڵ�

--Q6) ������̺��� ����̸��� �ٹ��ϼ�(����� ~ ���� ��¥)�� �������.(�Ѵ��� 30�Ϸ� ���)
SELECT ENAME, HIREDATE, TRUNC(MONTHS_BETWEEN(SYSDATE,HIREDATE)*30) FROM EMP;


--Q7) �� �������� �ٹ��ϼ��� '00�� 00���� 00��' �������� �������.
--��)
--ENAME �ٹ��ϼ�
--KING  00�� 00���� 00��
SELECT ENAME || '�ٹ��ϼ�' AS ����̸�,
ENAME || ' : ',
TRUNC((SYSDATE-HIREDATE)/365) ||'��' AS ��,
TRUNC(MOD((SYSDATE-HIREDATE),365)/30)||'����' AS ��,
ROUND(MOD(MOD((SYSDATE-HIREDATE),365),30),0)||'��' AS ��
FROM EMP;

SELECT ENAME, HIREDATE,
TRUNC((SYSDATE-HIREDATE)/360) || '��',
TRUNC(MOD((SYSDATE-HIREDATE),360)/30) || '��',
TRUNC(MOD(MOD((SYSDATE-HIREDATE),360),30)) || '��'
FROM EMP;
-- SYSDATE-HIREDATE -> ���� �� �ϼ�