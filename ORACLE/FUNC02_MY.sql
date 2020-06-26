--Q1) 사원 테이블에서 사원이름을 첫글자는 대문자로, 나머지는 소문자로 출력하자.
SELECT INITCAP(ENAME) FROM EMP;

SELECT SUBSTR(UPPER(ENAME), 1, 1) ||
SUBSTR(LOWER(ENAME), 2) FROM EMP;

--Q2) 사원테이블에서 사원이름을 출력하고, 이름의 두번째 글자부터 네번째 글자도 출력하자.
SELECT ENAME, SUBSTR(ENAME, 2, 3) FROM EMP;
-- 2번째부터 3개 출력

--Q3) 사원테이블에서 각 사원 이름의 철자 개수를 출력하자.
SELECT ENAME, LENGTH(ENAME) FROM EMP;

SELECT LENGTH ('한'), LENGTHB ('한') FROM DUAL;
-- 한글 1글자는 3BYTE를 먹음 영어는 1BYTE

--Q4) 사원테이블에서 각 사원 이름의 앞 글자 하나와 마지막 글자 하나만 출력하되, 소문자로 출력하라.
SELECT ENAME, LOWER(SUBSTR(ENAME, 1,1)) || LOWER(SUBSTR(ENAME, -1,LENGTH(ENAME))) FROM EMP;

SELECT ENAME, LOWER(SUBSTR(ENAME, 1,1)) || LOWER(SUBSTR(ENAME, -1,1)) FROM EMP;

--Q5) 3456.78을 소수점 첫번째 자리에서 반올림해서 출력하자.
SELECT ROUND(3456.78, 0) FROM DUAL;
-- 자리수 지정 생략하면 0 자동

--Q6) 사원테이블에서 사원이름과 근무일수(고용일 ~ 현재 날짜)를 출력하자.(한달을 30일로 계산)
SELECT ENAME, HIREDATE, TRUNC(MONTHS_BETWEEN(SYSDATE,HIREDATE)*30) FROM EMP;


--Q7) 위 문제에서 근무일수를 '00년 00개월 00일' 형식으로 출력하자.
--예)
--ENAME 근무일수
--KING  00년 00개월 00일
SELECT ENAME || '근무일수' AS 사원이름,
ENAME || ' : ',
TRUNC((SYSDATE-HIREDATE)/365) ||'년' AS 년,
TRUNC(MOD((SYSDATE-HIREDATE),365)/30)||'개월' AS 월,
ROUND(MOD(MOD((SYSDATE-HIREDATE),365),30),0)||'일' AS 일
FROM EMP;

SELECT ENAME, HIREDATE,
TRUNC((SYSDATE-HIREDATE)/360) || '년',
TRUNC(MOD((SYSDATE-HIREDATE),360)/30) || '월',
TRUNC(MOD(MOD((SYSDATE-HIREDATE),360),30)) || '일'
FROM EMP;
-- SYSDATE-HIREDATE -> 일한 총 일수