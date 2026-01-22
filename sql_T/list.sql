use 세계무역;

SELECT *
FROM 고객;

SELECT distinct 지역, 도시
from 고객;

SELECT count(*) AS '행의 갯수'
FROM 고객;

-- where절 조건적 조회
SELECT 고객번호,담당자명,마일리지 as 포인트
FROM 고객
WHERE 마일리지 >= 100000;
SELECT *
FROM 고객
WHERE 도시 = '부산광역시' and 마일리지 < 1000;

-- order by절 정렬(내림차순,오름차순)
SELECT 고객번호,담당자명,도시,마일리지 as 포인트
FROM 고객
WHERE 도시 = '서울특별시'
ORDER by 마일리지 ASC; -- DESC

-- limit n : 갯수 제한
SELECT *
FROM 고객
LIMIT 3;

-- 마일리지 상위 3명 / 하위 3명
SELECT *
FROM 고객
ORDER BY 마일리지 asc -- DESC
limit 3;

-- distinct 중복 데이터 제거
SELECT DISTINCT 도시
FROM 고객;

-- 산술연산자
SELECT 23 + 5 as 더하기
	,23 - 5 as 빼기
	,23 * 5 as 곱하기
	,23 / 5 as '나누기 몫(실수)'
	,23 div 5 as '나누기 몫(정수)'
  ,23 % 5 as 나머지1
  ,23 mod 5 as 나머지2;

  -- 비교연산자
  SELECT 23 > 23
	,23 < 23
	,23 = 23 -- 같은가?
	,23 != 23 -- 같지 않은가?
	,23 <> 23 -- 같지 않은가?
	,23 >= 5  -- 크거나 같은가?
	,23 <= 5; -- 작거나 같은가?

  UPDATE 고객 
  set 지역 = null -- where절이 없으면, 모든 열의 데이터가 적용된다! 주의!
  WHERE 지역 = '';

  -- UNION 연산자(2개 이상의 SELECT결과를 합쳐준다.)
  SELECT 고객번호, 도시, 마일리지
  FROM 고객
  WHERE 도시 = '부산광역시' -- 5열
  union all -- 모든 행을 더한다.
  SELECT 고객번호, 도시, 마일리지
  FROM 고객
  WHERE 마일리지 < 1000
  order by 고객번호; -- 45열

  -- union all과 union(union distinct)의 차이
-- union all은 중복된 행을 포함해서 모든 행을 출력(정렬없이 그대로 합친다.)
-- union은 중복된 행을 제거하고 출력(내부적으로 정렬후 합친다.)

-- union 사용시 주의점
-- 1. 컬럼(필드) 갯수 일치
-- 2. 각 컬럼의 데이터 타입(숫자,문자,날짜)
-- 3. 첫번째 select의 필드명으로 출력된다.

SELECT * 
FROM 고객
WHERE 지역 is null; -- 66열

SELECT * 
FROM 고객
WHERE 지역 is not null; -- 27열

-- IN연산자 : ~중에 하나가 있으면 true(여러개의 or를 대체)
SELECT 고객번호, 담당자명, 담당자직위
FROM 고객
WHERE 담당자직위 = '영업 과장' 
or 담당자직위 = '마케팅 과장'
or 담당자직위 = '영업 사원'; -- 60열

SELECT 고객번호, 담당자명, 담당자직위
FROM 고객
WHERE 담당자직위 in ('영업 과장', '영업 사원', '마케팅 과장'); -- 60열

-- BETWEEN AND : ~이상 ~이하 범위를 지정할 때
SELECT 담당자명, 마일리지
FROM 고객
WHERE 100000 <= 마일리지 and 마일리지 <= 200000; -- 2열

SELECT 담당자명, 마일리지
FROM 고객
WHERE 마일리지 between 100000 and 200000; -- 2열

-- LIKE연산자 : 문자(열)의 일부를 검사할 때 사용
--           : % 여러 문자열을 대체
--           : _ 한 글자(문자)를 대체
SELECT *
FROM 고객
WHERE 도시 in ('부산광역시','울산광역시','대전광역시');

SELECT *
FROM 고객
WHERE 도시 like '%광역시'
and (고객번호 like '_C%') ; -- 고객번호 2번째 문자가 C인 열을 찾는다.

SELECT CHAR_LENGTH('HELLO') -- 5
		,LENGTH('HELLO'); -- 5
SELECT CHAR_LENGTH('한글') -- 2
		,LENGTH('한글'); -- 6(한글자 3바이트)
		
-- 문자열 연결
SELECT CONCAT('DREAMS','COME','TRUE');
-- WS : With Seperator 약자
SELECT CONCAT_WS('-', '2026','01','21');

-- 문자열 일부 가져오기
SELECT LEFT('SQL 완전정복', 3);
SELECT RIGHT('SQL 완전정복', 4);
SELECT SUBSTR('SQL 완전정복', 2, 5); -- 시작인덱스 1부터 시작, 갯수
SELECT SUBSTR('SQL 완전정복', 2); -- 인덱스부터 끝까지

-- 문자열 일부 가져오기(구분자 이용)
-- 2번째 구분자 이후를 지우고 가져온다.
SELECT SUBSTRING_INDEX('서울시 동작구 흑석동', ' ', 2);
-- -2번째 구분자 이전을 지우고 가져온다.
SELECT SUBSTRING_INDEX('서울시 동작구 흑석동', ' ', -2);

-- 자릿수 채우기 함수
SELECT LPAD('SQL', 10, "#"); -- #######SQL
SELECT RPAD('SQL', 5, '*'); -- SQL**
SELECT LPAD(123, 10, ' '); --        123
SELECT LPAD(123, 10, '0'); -- 0000000123

-- 공백 제거 
SELECT length(LTRIM(' SQL ')); -- 왼쪽 공백을 제거
SELECT length(RTRIM(' SQL ')); -- 오른쪽 공백을 제거
SELECT length(TRIM(' SQL ')); -- 양쪽 공백을 제거
SELECT REPLACE(' I LIKE SQL ', ' ', '' ); -- 모든 공백 제거

-- 특정문제 제거(TRIM)
SELECT TRIM(both '###' from '###SQL###');
SELECT TRIM(both '#' from '###SQL###');
SELECT TRIM(both '##' from '###SQL###'); -- #SQL#

SELECT TRIM(both 'abc' from 'abcSQLLababc');
SELECT TRIM(leading 'abc' from 'abcSQLLababc');
SELECT TRIM(trailing 'abc' from 'abcSQLLababc');

-- 문자열 인덱스 찾기
SELECT FIELD('JAVA', 'SQL', 'JAVA', 'C'); -- 2인덱스(두번째)
SELECT FIND_IN_SET('JAVA', 'SQL,JAVA,C'); -- 2인덱스
SELECT INSTR('네 인생을 살아라', '인생'); -- 3인덱스
SELECT ELT(2, 'SQL', 'JAVA', 'C'); -- 인덱스2인 'JAVA'반환

-- 문자열 중복
SELECT REPEAT('*', 5); 
SELECT CONCAT( REPEAT('*', 5), 'star');  -- *****star

-- 문자열 치환
SELECT REPLACE('010.123.4567', '.', '-');

-- 문자열 거꾸로
SELECT REVERSE('OLLEH');

-- 소숫점 관련 함수들
-- 올림 0이상이면 자릿수증가, 
--   예) 0.1 -> 1  0.5 -> 1  0.9 -> 1
-- 버림 소수점 버림, 
--   예) 0.1 -> 0  0.5 -> 0  0.9 -> 0
-- 반올림 5이상이면 올림.
--   예) 0.1 -> 0  0.49999 -> 0 0.5 -> 1
SELECT CEILING(123.56); -- 소숫점 첫째자리에서 올림
SELECT FLOOR(123.56); -- 소숫점 첫째자리에서 버림
SELECT ROUND(123.56); -- 소숫점 첫째자리에서 반올림

SELECT ROUND(123.56, 1); -- 소숫점 둘째자리에서 반올림
SELECT ROUND(123.567, 2); -- 소숫점 셋째자리에서 반올림
SELECT ROUND(3456.1234, -1); -- 일의 자리에서 반올림
SELECT ROUND(3456.1234, -2); -- 십의 자리에서 반올림

-- FLOOR()에서는 두번째 매개변수(인자) 쓸 수 없음.
SELECT TRUNCATE(3456.1234, 1); -- 소숫점 둘째자리에서 버림
SELECT TRUNCATE(3456.1234, 2); -- 소숫점 셋째자리에서 버림
SELECT TRUNCATE(3456.1234, -1); -- 일의 자리에서 버림
SELECT TRUNCATE(3456.1234, -2); -- 십의 자리에서 버림

-- 절대값
SELECT ABS( -120 );
SELECT ABS( 120 );
-- 부호
SELECT SIGN( -120 ); -- 음수이므로 -1을 리턴
SELECT SIGN( 120 ); -- 양수이므로 1을 리턴
-- 나누기 함수
SELECT 203 % 4;
SELECT 203 MOD 4;
SELECT mod( 203, 4);
-- 제곱승
SELECT POWER(2, 3);
-- 제곱근
SELECT SQRT( 16 );
-- 랜덤값
SELECT RAND(); -- JS의 random()함수와 유사. 0.0 ~ 0.99999...
-- 1~100사이의 랜덤 정수
SELECT FLOOR(RAND() * 100) + 1;

-- 현재 날짜시간 가져오기
-- now() : 쿼리가 시작된 시각 ( 기본으로 사용하면 됨. )
-- SYSDATE() : 함수가 호출된 실시간(찰라)
SELECT now(), SLEEP(2), SYSDATE();
-- 현재날짜 가져오기
SELECT CURDATE();
-- 현재시간 가져오기
SELECT CURTIME();

-- 날짜 간격 가져오기 (예-설날까지 남은 날짜 디데이)
SELECT now()
		,DATEDIFF('2026-02-16', now())  -- 26
		,DATEDIFF(now(), '2026-02-16'); -- -26
SELECT now()
		,TIMESTAMPDIFF(year, now(), '2027-01-30')
        ,TIMESTAMPDIFF(month, now(), '2027-01-30')
        ,TIMESTAMPDIFF(day, now(), '2027-01-30'); -- 373

SELECT now()
	,DATEDIFF('2026-01-22 10:00', now()) -- 자정 기준
	,TIMESTAMPDIFF(day, now(), '2026-01-22 10:00'); -- 만24시 기준

-- 몇일 후 계산
SELECT now()
	,ADDDATE(now(), 5) -- 5일 후
	,ADDDATE(now(), interval -50 day) -- 50일 전/후
	,ADDDATE(now(), interval 50 month) 
	,ADDDATE(now(), interval 50 hour);

SELECT now()
	,LAST_DAY(now()) -- 이번달의 마지막 일(29,30,31)
	,DAYOFYEAR(now()) -- 올해 1월1일에서 몇번째 날인가? 21번째 날
	,MONTHNAME(now()) -- 이번달 영어 이름
	,WEEKDAY(now()); -- 월(0)~일(6) 오늘 수요일(2)
	
-- 형변환 함수
SELECT CAST('1' as UNSIGNED); -- 부호없는 숫자로 변환
SELECT CAST('-1' as UNSIGNED); -- 오류(언더플로우), 
-- -1을 강제변환시키면, 이진수 표현으로 해석해버린다.
-- 64비트 정수 시스템(BigInt)에서 표현할 수 있는 최대수.
SELECT CAST('-1' as SIGNED); -- 부호(-)가진 숫자로 변환
		
-- 1바이트 : 8비트
-- 00000000 0
-- 00000001 1
-- 11111111 11111111 11111111 11111110 -1
-- 18446744073709551615
-- 음수는 2의 보수 : 1의 보수 - 1
-- 1의 보수 : 0->1, 1->0

SELECT CAST(2 AS CHAR(1)); -- char형(문자한자) 한 자리로 변환. '2'
SELECT CONVERT('1', UNSIGNED); -- 숫자 1로 변환
SELECT CONVERT(2, char(1)); 

-- cast() : ANSI 표준( 추천 )
-- convert() : MySQL 전용

-- 조건함수 (JS 삼항연산자와 유사)
SELECT IF( 10 > 20, '10', '20');
SELECT IF( 12500 * 450 > 500000, '초과달성', '미달성') AS 달성여부;

-- null 체크 함수
SELECT IFNULL('123', 0); -- 1항이 null이면, 2항을 반환, 
                         -- null이 아니면, 1항(그대로) 반환.
SELECT IFNULL( null, 0); -- null이므로 0을 반환.
SELECT IFNULL(null, 'null입니다.'); 
SELECT IFNULL(null, '지역명없음'); -- null값일때 기본값을 설정할 때.

SELECT NULLIF( 12 * 10, 120); -- 1항과 2항이 같으면 null반환
SELECT NULLIF( 12 * 10, 1200); -- 1항과 2항이 같지않으면, 1항을 반환

-- NULLIF() 사용예

-- 재고가 0이면 NULL을 반환하고, 
-- 재고가 0인 제품(파인애플 시럽, 앨리스 포장육 등)은 자동으로 집계에서 빠지게 됩니다.
SELECT 제품명, 
       단가, 
       재고,
       NULLIF(재고, 0) AS 재고현황,
       SUM(NULLIF(재고, 0)) AS 총재고현황
FROM 세계무역.제품;

-- CASE WHEN구문( JS if else구문 유사 )
SELECT CASE 
	WHEN 20 < 20 THEN '20보다 작음'
	WHEN 20 < 30 THEN '30보다 작음'
	ELSE '그외의 수'
END AS 결과;
 -- CTE(WITH절)
WITH 주문cte AS (
    SELECT 주문수량
        ,단가
        ,할인율
        ,주문수량 * 단가 AS '주문금액'
        ,주문수량 * 단가 * 할인율 AS '할인금액'
    FROM 주문세부
)
SELECT 주문금액
    ,FLOOR(할인금액) AS 할인금액
    ,주문금액 - TRUNCATE(할인금액, -1) AS '실제 주문금액'
FROM 주문cte;

USE 세계무역;

-- 서브쿼리(Subquery) 방법
SELECT T.*
     , (T.주문금액 - T.할인금액) AS 실주문금액
FROM (
    -- 안쪽에서 주문금액과 할인금액을 먼저 계산
    SELECT *
         , (주문수량 * 단가) AS 주문금액
         , TRUNCATE(주문수량 * 단가 * 할인율, -1) AS 할인금액
    FROM 주문세부
) AS T;
-- T는 서브쿼리의 임시 결과물을 의미함.