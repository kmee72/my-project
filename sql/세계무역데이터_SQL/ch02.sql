use 세계무역;
-- 93
SELECT count(*)
FROM 고객;
-- 5
SELECT count(*)
FROM 마일리지등급;
-- 4
SELECT count(*)
FROM  부서;
-- 10
SELECT count(*)
FROM  사원;
-- 78
SELECT count(*)
FROM  제품;
-- 830
SELECT count(*)
FROM 주문;
-- 2130
SELECT count(*)
FROM 주문세부;

DROP TABLE 세계무역.주문;

CREATE TABLE 주문(
  주문번호 CHAR(5) PRIMARY KEY,
  고객번호 CHAR(5),
  사원번호 CHAR(3),
  주문일 DATE,
  요청일 DATE,
  발송일 DATE
  ) DEFAULT CHARSET=utf8mb4;

-- 테이블 내용을 다 지우기
TRUNCATE TABLE 주문;