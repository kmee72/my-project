-- ch08.sql
-- DDL(Data Definition Lang) : 데이터 정의어 
USE 세계무역;

DROP TABLE 세계무역.학과;

CREATE DATABASE IF NOT EXISTS 세계학사;

USE 세계학사; -- 데이터베이스 선택

-- 컬럼명 데이터타입 정리
-- 길이는 글자단위(byte단위 아님)

-- CHAR(길이) : 고정길이 문자열(0~255자)
--  예) 이름 CHAR(5);  '홍길동'-> '홍길동  '
--                     '홍길동입니다' -> 못들어감

-- VARCHAR(길이) : 가변길이 문자열(0~16383자 정도 UTF8mb4기준)
--  예) 이름 VARCHAR(5); '홍길동' -> '홍길동' '홍'->'홍'
--  자주 사용하는 문자열에 적합(내부 메커니즘)
--  예)게시판app - 글제목,사용자이름

-- TEXT : 큰 길이의 문자열(0~16383자), 자주 사용하지 않는 문자열.
--  예)게시판app - 본문내용, 상세설명

-- INT(길이) : 정수(약-21억~21억), 4바이트
-- 길이는 표현의 범위이다. ZEROFILL 예약어 함께 사용하지 않으면,
-- 의미가 없음. 추천하지 않음. 
--   예) age INT(10) ZEROFILL;  30 -> 0000000030 표현됨.

-- FLOAT : 실수(소숫점 7자리)
-- DATE/TIME : 날짜/시간
-- DATETIME : 날짜+시간(1000년~9999년)
-- TIMESTAMP : 날짜+시간(UTC적용, 1970년~2038년)

CREATE TABLE 학과 (
  	학과번호 CHAR(2), -- 기본키, 99학과이하 예상, 2자리 고정길이
  	학과명 VARCHAR(20), -- 길이 예측 어려움. 하지만 20자 이하 예상.
  	학과장명 VARCHAR(20)
);

DESC 학과;

INSERT INTO 학과
VALUES ( 'AA', '컴퓨터공학과', '배경민' ),
       ( 'BB', '소프트웨어학과', '김남준'),
       ( 'CC', '디자인융합학과', '박선영');

SELECT * FROM 학과;

DROP TABLE 학생;
CREATE TABLE 학생 ( 
	학번 CHAR(5), -- 기본키
	이름 VARCHAR(20),
	생일 DATE, -- 2000-03-10    다른예) 2000/03/10 2000.03.10 
	연락처 VARCHAR(20),
	학과번호 CHAR(2) -- 외래키(FP)
);
DESC 학생;

INSERT INTO 학생
VALUES ('S0001', '이윤주', '2020-01-30', '01033334444', 'AA' ),
       ('S0002', '이승은', '2021/02/23', NULL, 'BB' ),
       ('S0003', '백재용', '2018.03.31', '0107778888', 'CC' );
SELECT * FROM 학생;
DROP TABLE 학생;

-- 다른 테이블을 복사해서 테이블 생성하기
CREATE TABLE 휴학생 AS
SELECT * FROM 학생;
-- 데이터만 지우기
TRUNCATE TABLE 휴학생;

SELECT * FROM 휴학생;
DROP TABLE 휴학생;

-- 구조만 복사하기
CREATE TABLE 휴학생 AS
SELECT * FROM 학생 WHERE 1 = 2; -- 항상 FALSE조건.

SELECT * FROM 휴학생;
DESC 휴학생;

-- 가상 컬럼(Generated Column) : 계산된 결과를 저장
CREATE TABLE 회원 (
	-- 기본키 설정 : 중복허용안함(UNIQUE), NOT NULL속성
	아이디 VARCHAR(20) PRIMARY KEY, 
	회원명 VARCHAR(20),
	키 INT, 
	몸무게 INT,
	-- INSERT시에 자동계산되어 저장된다.
	체질량지수 DECIMAL(4, 1) AS (몸무게 / POWER(키/100, 2)) STORED
);
DESC 회원;

INSERT INTO 회원(아이디, 회원명, 키, 몸무게)
VALUES ('ARANG', '김아랑', 170, 55);
SELECT * FROM 회원;

-- ALTER : 테이블(객체) 속성 변경
DESC 학생;
-- 컬럼 추가
ALTER TABLE 학생 ADD 성별 CHAR(1);
-- 컬럼 변경
ALTER TABLE 학생 CHANGE COLUMN 연락처 핸드폰번호 VARCHAR(20);
-- 컬럼 삭제
ALTER TABLE 학생 DROP COLUMN 성별;
-- 테이블 이름변경
ALTER TABLE 학생 RENAME 졸업생;
DESC 졸업생;

-- DROP : 테이블의 삭제
DROP TABLE 학과;
DROP TABLE 졸업생;

-- 제약조건

CREATE TABLE 학과 (
	학과번호 CHAR(2) PRIMARY KEY, -- NOT NULL, UNIQUE 제약조건
	학과명 VARCHAR(20) NOT NULL,
	학과장명 VARCHAR(20) UNIQUE 
); 
DESC 학과;

SELECT * FROM 학과;

INSERT INTO 학과
VALUES ('01', '국어국문학과', '홍교수');

INSERT INTO 학과
VALUES ('01', '영문과', '데이비드교수'); -- UNIQUE 제약조건

INSERT INTO 학과
VALUES (NULL, '영문과', '데이비드교수'); -- NOT NULL 제약조건

INSERT INTO 학과
VALUES ('02', NULL, '데이비드교수'); -- NOT NULL 제약조건

INSERT INTO 학과
VALUES ('02', '영문과', '홍교수'); -- UNIQUE 제약조건

DROP TABLE 학과;
CREATE TABLE 학과 (
	학과번호 CHAR(2),
	학과명 VARCHAR(20),
	학과장명 VARCHAR(20),
	PRIMARY KEY(학과번호)
); 
DESC 학과;

DROP TABLE 학과;
CREATE TABLE 학과 (
	학과번호 CHAR(2),
	학과명 VARCHAR(20),
	학과장명 VARCHAR(20)
); 
ALTER TABLE 학과
ADD CONSTRAINT PK_학과 PRIMARY KEY(학과번호);
DESC 학과;

-- 외래키(FK) 제약조건 추가
DROP TABLE 학생;
CREATE TABLE 학생 (
	학번 CHAR(5) PRIMARY KEY,
	이름 VARCHAR(20) NOT NULL,
	생일 DATE NOT NULL,
	연락처 VARCHAR(20) UNIQUE,
	학과번호 CHAR(2), 
	성별 CHAR(1) CHECK(성별 IN ('남', '여')),
	-- 등록일이 입력안되면(NULL을 넣으면 NULL이 들어감. NULL도 하나의 값.)
	등록일 DATE DEFAULT(CURDATE()),
	-- 학과번호 INSERT시, 학과 테이블의 학과번호에 있는 것이어야 됨.
	FOREIGN KEY( 학과번호 ) REFERENCES 학과(학과번호) -- 외래키 제약조건
);
DESC 학생;

SELECT * FROM 학과;
SELECT * FROM 학생;

INSERT INTO 학과
VALUES ('01', '국어국문과', '홍교수');

INSERT INTO 학생
VALUES ('S0001', '강감찬', '2000-02-03', '01022223333', '01', '남', NULL );
-- CHECK제약조건 테스트
INSERT INTO 학생
VALUES ('S0001', '강감찬', '2000-02-03', '01022223333', '01', '홍', NULL );
-- Check constraint '학생_chk_1' is violated.
-- DEFAULT제약조건 테스트
INSERT INTO 학생( 학번, 이름, 생일, 연락처, 학과번호, 성별 )
VALUES ('S0002', '이순신', '2000-03-04', '01044445555', '01', '남' );

-- 외래키 제약조건
INSERT INTO 학생( 학번, 이름, 생일, 연락처, 학과번호, 성별 )
VALUES ('S0003', '신사임당', '2000-04-05', '01066667777', '02', '남' );
-- a foreign key constraint fails
SELECT * FROM 학과;

-- ON DELETE/UPDATE CASCADE
-- 참조하는 부모 테이블에서 삭제/수정이 일어날 때 자식 테이블도 
-- 자동으로 변경/삭제되도록 한다.

CREATE TABLE 학과 ( 
	학과번호 CHAR(2) PRIMARY KEY,
	학과명 VARCHAR(20)
);
CREATE TABLE 학생 ( 
	학번 CHAR(5) PRIMARY KEY,
	이름 VARCHAR(20),
	학과번호 CHAR(2),
	FOREIGN KEY(학과번호) 
		REFERENCES 학과(학과번호)
		ON DELETE CASCADE 
		ON UPDATE CASCADE 
);
DROP TABLE 학과;
DROP TABLE 학생;
DESC 학과;
DESC 학생;

-- 학과 데이터
INSERT INTO 학과 VALUES ( '01', '국어국문과' );
INSERT INTO 학과 VALUES ( '02', '컴퓨터공학과' );
SELECT * FROM 학과;
-- 학생 데이터
INSERT INTO 학생 VALUES ('S0001', '홍길동', '01');
INSERT INTO 학생 VALUES ('S0002', '이소룡', '02');
SELECT * FROM 학생;

-- 학과번호 수정하면, 참조하던 학생 테이블의 학과번호도 함께 수정된다.
UPDATE 학과 SET 학과번호 = '03' WHERE 학과번호 = '02';
-- 학과번호 삭제하면, 참조하던 학생 테이블의 레코드도 함께 삭제된다.
DELETE FROM 학과 WHERE 학과번호 = '01';

-- 연습문제
-- 1. 제품 테이블의 재고 컬럼에 CHECK 제약조건을 추가하시오
ALTER TABLE 제품 MODIFY COLUMN 재고 int CHECK(재고 >= 0);
-- MODIFY COLUMN : 컬럼이름 변경 불가, 구성은 변경 가능.
ALTER TABLE 제품 CHANGE COLUMN 재고 재고 INT CHECK (재고 >= 0);
-- CHANGE COLUMN : 컬럼이름, 구성을 변경가능.
-- 2. 제품 테이블에 재고금액 컬럼을 추가하시오. 
--    이 때 재고금액은 '단가 * 재고'가 자동계산되어 저장되도록 합니다.
ALTER TABLE 제품 ADD COLUMN 재고금액 int AS (단가*재고) STORED;
-- 3. 제품 테이블에서 제품 레코드를 삭제하면 
--    주문세부 테이블에 있는 관련 레코드도 함께 삭제되도록 
--    주문세부 테이블의 제품번호 컬럼에 외래키 제약조건과 옵션을 설정하시오.
ALTER TABLE 주문세부 ADD CONSTRAINT fk_제품번호 FOREIGN KEY (제품번호) 
	REFERENCES 제품(제품번호) ON DELETE CASCADE;

USE 세계학사;
-- 실전 문제
-- 1. 영화 테이블과 평점관리 테이블을 만들고자 합니다. 다음 테이블 명세서를 참고하여 테이블을 생성하시오.
DROP TABLE 영화;
DROP TABLE 평점관리;
CREATE TABLE 영화(
	영화번호 char(5) PRIMARY KEY,
	타이틀 varchar(100) NOT NULL,
	장르 varchar(20) CHECK(장르 IN ('코미디', '드라마', '다큐', 'SF', '액션', '역사', '기타')),
	배우 varchar(100) NOT NULL,
	감독 varchar(50) NOT NULL,
	제작사 varchar(150) NOT NULL,
	개봉일 date,
	등록일 date DEFAULT(curdate())
);
-- 2. 다음 테이블 명세서를 참고하여 평점관리 테이블을 생성하시오.
CREATE TABLE 평점관리(
	번호 int AUTO_INCREMENT PRIMARY KEY,
	평가자닉네임 varchar(50) NOT NULL,
	영화번호 char(20),
	평점 int CHECK(평점 BETWEEN 1 AND 5) NOT NULL,
	평가 varchar(2000) NOT NULL,
	등록일 date default(curdate()),
	FOREIGN KEY fk_평점관리_영화 (영화번호) REFERENCES 영화(영화번호)
);
-- 3. 영화 테이블에 다음과 같이 데이터를 추가하시오.
INSERT INTO 영화 (영화번호, 타이틀, 장르, 배우, 감독, 제작사, 개봉일)
VALUES ('00001', '파묘', '드라마', '최민식, 김고은', '장재현', '쇼박스', '2024-02-22'),
	('00002', '듄:파트2', '액션', '티미시 샬라메, 젠데이아', '드니 뵐뇌브', '레전더리 픽처스', '2024-02-28');
SELECT * FROM 영화;
-- 4. 평점관리 테이블에 다음과 같이 데이터를 추가하시오.
INSERT INTO 평점관리 (번호, 평가자닉네임, 영화번호, 평점, 평가)
VALUES (1, '영화광', '00001', 5, '미치도록 스릴이 넘쳐요'),
	(2, '무비러브', '00002', 4, '장엄한 스케일이 좋다');
SELECT * FROM 평점관리;
-- 5. 영화번호를 00003으로도 새로운 레코드를 넣어서 오류 발생 여부를 확인하시오.
INSERT INTO 평점관리 (번호, 평가자닉네임, 영화번호, 평점, 평가)
VALUES (3, '영화광', '00003', 5, '미치도록 스릴이 넘쳐요');

-- 6. 영화테이블에서 레코드를 지우면 외래키 제약조건에 의해 오류가 발생하는지 확인하시오.
-- 평점관리에서 외래키 조회(레퍼런싱)하고 있으면, 지워지지 않는다!
DELETE FROM 영화 WHERE 영화번호='00001';
DELETE FROM 평점관리 WHERE 영화번호='00001';

SELECT * FROM 영화;
SELECT * FROM 평점관리;

-- 7. ON CASCADE 옵션을 통해 6번 문제를 해결하시오.
ALTER TABLE 평점관리 ADD CONSTRAINT fk_영화번호 
   FOREIGN KEY (영화번호) REFERENCES 영화(영화번호) ON DELETE CASCADE;

























