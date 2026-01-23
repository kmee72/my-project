USE 세계무역;

SELECT *
FROM 고객;

SELECT *
FROM 주문;

SELECT *
FROM 고객
JOIN 주문;

SELECT 고객.고객번호, count(고객.고객번호) -- 문법은 맞지만 집계함수와 일반 컬럼을 같이 쓰려면 Group by가 있어야함
FROM 고객;


SELECT count(고객번호) -- 93
FROM 고객;

SELECT COUNT(고객번호) -- 830
FROM 주문;

SELECT COUNT(DISTINCT 고객번호)  -- 89 (실제로 주문한 사람수)
FROM 주문;

SELECT count(*)
FROM 고객
LEFT OUTER JOIN 주문
ON 고객.고객번호 = 주문.고객번호
WHERE 주문. 주문번호 IS NULL;

-- 주문수량이 가장 많은 고객 , 마일리지가 가장 높은 고객 , 등급이 가장 높은 고객 , 주문건수가 가장 높은 고객 각각 5명의 고객정보표시
SELECT SUM(주문수량) AS 총주문수량, 고객*
FROM 주문세부
INNER JOIN 주문
ON 주문세부.주문번호 = 주문.주문번호
INNER JOIN 고객
ON 주문.고객번호 = 고객.고객번호
GROUP BY 고객.고객번호
ORDER BY 총주문수량 DESC
LIMIT 5;

SELECT 
    c.고객번호,
    c.고객회사명,
    c.담당자명,
    c.담당자직위,
    c.주소,
    c.도시,
    c.지역,
    c.전화번호,
    c.마일리지,
    SUM(od.주문수량) AS `총 주문수량`
FROM 고객 c
JOIN 주문 o ON c.고객번호 = o.고객번호
JOIN 주문세부 od ON o.주문번호 = od.주문번호
GROUP BY 
    c.고객번호,
    c.고객회사명,
    c.담당자명,
    c.담당자직위,
    c.주소,
    c.도시,
    c.지역,
    c.전화번호,
    c.마일리지
ORDER BY `총 주문수량` DESC
LIMIT 5;







