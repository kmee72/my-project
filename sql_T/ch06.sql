-- ch06.sql
-- 서브쿼리(Sub query)

-- 단일행 서브쿼리

-- 최고 마일리지를 보유한 고객의 정보를 보이시오.
USE 세계무역;

SELECT MAX(마일리지)
FROM 고객; -- 128790

SELECT * 
FROM 고객
WHERE 마일리지 = 128790;

SELECT * 
FROM 고객
WHERE 마일리지 = ( 
	SELECT MAX(마일리지)
	FROM 고객
);

-- 주문번호 'H0250'인 고객의 고객회사명, 담당자명을 출력하시오.
SELECT 고객번호
FROM 주문
WHERE 주문번호 = 'H0250'; -- NARHA

SELECT 고객회사명, 담당자명
FROM 고객
WHERE 고객번호 = 'NARHA';

-- 서브쿼리를 이용하여 쿼리(SELECT)를 합쳐보자.
SELECT 고객회사명, 담당자명
FROM 고객
WHERE 고객번호 = (
	SELECT 고객번호
	FROM 주문
	WHERE 주문번호 = 'H0250'
);

-- 복수행 서브쿼리 : 복수행 비교연산자 IN, ANY(SOME), ALL, EXISTS

-- '부산광역시' 고객이 주문한 주문건수를 출력하기
SELECT 고객번호
FROM 고객
WHERE 도시 = '부산광역시'; -- 5행 (LIDBO,LLIWE, ...)
-- A키 옆에 CapsLock 누르면, 대문자로만 <-> 소문자자로만

SELECT COUNT(*) AS 주문건수
FROM 주문
WHERE 고객번호 = 'LIDBO';

SELECT COUNT(*) AS 주문건수
FROM 주문
WHERE 고객번호 IN (   -- 도시가 '부산광역시'인 고객이라면 모두 센다.
  SELECT 고객번호 FROM 고객
  WHERE 도시 = '부산광역시'
);

-- ANY(SOME) 연산자
-- 마일리지가 부산광역시인 고객의 마일리지보다 높은 고객은?
SELECT 마일리지 FROM 고객
WHERE 도시 = '부산광역시'; -- 7795 7329 2819 1177 806

SELECT 담당자명, 고객회사명, 마일리지
FROM 고객
WHERE 마일리지 > ANY ( -- 마일리지가 한개라도 더 크면 참.
	SELECT 마일리지 FROM 고객
	WHERE 도시 = '부산광역시'
)
ORDER BY 마일리지 ASC; --  857 ~ 128790

-- ALL : 모든 비교조건이 참이면
SELECT 담당자명, 고객회사명, 마일리지
FROM 고객
WHERE 마일리지 > ALL ( -- 지역별 평균 마일리지의 최대값보다 큰 고객의 정보
	SELECT AVG(마일리지) FROM 고객 
  	GROUP BY 지역    
);
SELECT ROUND(AVG(마일리지)) FROM 고객 
GROUP BY 지역; -- 11026 ~ 322

-- EXISTS : 행의 존재여부로 비교
-- 주문이력이 있는 고객의 정보만 출력하기
 SELECT 고객번호, 고객회사명
 FROM 고객
 WHERE EXISTS ( SELECT * FROM 주문 WHERE 주문.고객번호 = 고객.고객번호 );
-- 서브쿼리에서 메인쿼리의 테이블을 조회할 수 있다.

-- INNER JOIN으로 변환해 보자.
SELECT DISTINCT 고객.고객번호, 고객회사명
FROM 고객
INNER JOIN 주문
ON 고객.고객번호 = 주문.고객번호; -- 830 -> 89

-- 인라인뷰(INLINE VIEW) : FROM절 안의 서브쿼리

-- 도서별_평균마일리지을 임시테이블(인라인뷰)로 사용하자.
SELECT 도시, ROUND(AVG(마일리지)) AS 도서별_평균마일리지
FROM 고객
GROUP BY 도시
ORDER BY AVG(마일리지) DESC;

-- 고객의 마일리지와 도시별 평균마일리지의 차이를 출력하시오.
SELECT 담당자명, 고객회사명, 마일리지, 고객.도시, 도시_평균마일리지,
       	도시_평균마일리지 - 마일리지 AS 차이
FROM 고객, -- FROM절에 테이블이 2개 들어가면, Non-ANSI INNER조인이다.
( 
    SELECT 도시, AVG(마일리지) AS 도시_평균마일리지
    FROM 고객 GROUP BY 도시
) 
AS 도시별_평균마일리지
WHERE 고객.도시 = 도시별_평균마일리지.도시;

-- CTE(WITH)절로 바꿔보자.
WITH 도시별_평균마일리지2 AS (
	SELECT 도시, AVG(마일리지) AS 도시_평균마일리지
    FROM 고객 GROUP BY 도시
)
SELECT 담당자명, 고객회사명, 마일리지, 고객.도시, 
	도시별_평균마일리지2.도시_평균마일리지,
	도시별_평균마일리지2.도시_평균마일리지 - 마일리지 AS 차이
FROM 고객
INNER JOIN 도시별_평균마일리지2
ON 고객.도시 = 도시별_평균마일리지2.도시;



























