-- ch08.sql

-- UTC(세계표준시)
-- UTC + 0시 : 영국 그리니치 천문대
-- UTC + 9시 : 한국 서울 표준시
-- linux나 mysql설치하면,utc 0시 기준. - 추가적인 설정이 필요하다

-- 프로필 파일 업로드
-- 서버의 스토리지 서비스(AWS, GCP,...)에 업로드하고, 경로와 파일명을 DB에 Varchar(255) 타입에 넣는다.


-- DDL(Data Definition Lang) : 데이터 정의어

USE 세계무역;
DROP TABLE 세계무역.학과;

CREATE DATABASE IF NOT EXISTS 세계학사;

USE 세계학사; -- 데이터베이스 선택

-- 컬럼명 데이터타입 정리
-- 길이는 글자단위(byte단위 아님)

-- CHAR(길이) : 고정길이 문자열(0~255자)
--   예) 이름 CHAR(5); '홍길동'->'홍길동  '
-- 				       '홍길동입니다'->못들어감


-- vARCHAR (길이) : 가변길이 문자열(0~16383자 정도 UTF8mb4기준)
--   예) 이름 VARCHAR(5);  '홍길도'->'홍길동' '홍'->'홍' (공백없음)
-- 자주 사용하는 문자열에 적합(내부 메커니즘이 TEXT와 다름)
--   예) 게시판app - 글제목, 사용자이름


-- TEXT : 큰 길이의 문자열(0~16383자), 자주 사용하지 않는 문자열.
--   예) 게시판app - 본문내용, 상세설명


-- INT(길이) : 정수(약-21억~21억), 4바이트
-- 길이는 표현의 범위이다. 	ZEROFILL예약어 함께 사용하지 않으면 의미가 없음. 길이는 추천하지 않음.
--   예) age INT(10) ZEROFILL; 30 -> 0000000030 표현됨


-- FLOAT : 실수(소숫점 7자리)
-- DATA/TIME : 날짜/시간(1000년~9999년)
-- TIMESTAMP : 날짜+시간(UTC적용, 1970년~2038년)


CREATE TABLE 학과(
	학과번호 char(2), -- 기본키,  99개 학과이하로 예상 고정길이, 2자리 고정길이
	학과명 varchar(20), -- 길이 예측 어려움. 하지만 20자 이하 예상.
	학과장명 varchar(20)
	);

DESC 학과;

INSERT INTO 학과 VALUES ('AA', '컴퓨터공학과', '배경민'),
				   ('BB', '소프트웨어학과', '김남준'),
				   ('CC', '디자인융합과', '박선영');
SELECT * FROM 학과;

DROP TABLE 학생;
CREATE TABLE 학생(
	학번 char(5), -- 기본키
	이름 varchar(20),
	생일 DATE,-- 2000-03-10   다른 예) 2000/03/10     다른 예) 2000.03.10
	연락처 VARCHAR(20),
	학과번호 char(2)  -- 외래키(FK)
);
DESC 학생;

INSERT INTO 학생 VALUES ('S0001', '이윤주', '2020-01-30','01033334444','AA'),
						('S0002', '이승은', '2021/02/23',NULL,'BB'),
						('S0003', '백재용', '2018.03.31','01033334444','CC');
SELECT * FROM 학생;
DROP TABLE 학생;


-- 다른 테이블을 복사해서 테이블 생성하기
CREATE TABLE 휴학생 AS  -- AS는 alias의미 아님
SELECT * FROM 학생;

SELECT * FROM 휴학생;


-- 데이터만 지우기
TRUNCATE TABLE 휴학생;
SELECT * FROM 휴학생;


-- 구조만 복사하기
CREATE TABLE 휴학생 AS 
SELECT * FROM 학생 WHERE 1 = 2; -- 항상 FALSE조건.

SELECT * FROM 휴학생;
DESC TABLE 휴학생;


-- 위의 내용 연습(테이블 복사)
DROP TABLE 휴학생;
CREATE TABLE 휴학생 AS
SELECT * FROM 학생;
DESC 휴학생;
SELECT * FROM 휴학생;
-- 위의 내용 연습(테이블 구조복사)
DROP TABLE 휴학생;
CREATE TABLE 휴학생 AS 
SELECT * FROM 학생 WHERE 1 = 2;
DESC 휴학생;
SELECT * FROM 휴학생;
-- 위의 내용 연습(테이블의 데이터만 지우기)
DROP TABLE 휴학생;
CREATE TABLE 휴학생 AS 
SELECT * FROM 학생;
DESC 휴학생;
SELECT * FROM 휴학생;
truncate TABLE 휴학생;
SELECT * FROM 휴학생;

-- 가상 컬럼(Generated column) : 계산된 결과를 저장
CREATE TABLE 회원(
	-- 기본키설정 : 중복허용안함(UNIQUE), NOT NULL 속성
	아이디 varchar(20) PRIMARY KEY, 
	회원명 varchar(20),
	키 int,
	몸무게 int,
	-- INSERT 시에 자동계사되어 저장된다.
	체질량지수 decimal(4, 1) AS (몸무게 / power(키/100,2)) STORED 
);
DESC 회원;

INSERT INTO 회원(아이디, 회원명, 키, 몸무게) values('ARANG', '김아랑', 170, 55);
SELECT * FROM 회원;


-- ALTER : 테이블(객체) 속성 변경
DESC 학생;
-- 컬럼 추가
ALTER TABLE 학생 ADD 성별 char(1);
-- 컬럼 변경
ALTER TABLE 학생 CHANGE COLUMN 연락처 핸드폰번호 varchar(20);
-- 컬럼 삭제
ALTER TABLE 학생 DROP COLUMN 성별;
-- 테이블 이름 변경
ALTER TABLE 학생 RENAME 졸업생;
DESC 졸업생;
-- DROP : 테이블 삭제
DROP TABLE 학과;
DROP TABLE 졸업생;




-- 제약조건: 첫번째 경우

CREATE TABLE 학과 (
	학과번호 char(2) PRIMARY KEY , -- NOT NULLm, UNIQUE 제약조건
	학과명 varchar(20) NOT NULL,
	학과장명 varchar(20) unique
);
DESC 학과;

SELECT * FROM 학과;
INSERT INTO 학과
VALUES ('01', '국어국문학과','홍교수');

INSERT INTO 학과
VALUES ('01', '영문과','데이비트교수'); -- UNIQUE 제약조건에 걸려 에러남

INSERT INTO 학과
VALUES (null, '영문과','데이비트교수'); -- NOT NULL 제약조건

INSERT INTO 학과
VALUES ('02', null,'데이비트교수'); -- NOT NULL 제약조건
 
INSERT INTO 학과
VALUES ('01', '영문과','홍교수'); -- UNIQUE 제약조건에 걸려 에러남

-- 제약조건: 두번째 경우
DROP TABLE 학과;
CREATE TABLE 학과 (
	학과번호 char(2), 
	학과명 varchar(20),
	학과장명 varchar(20),
	PRIMARY key(학과번호)
);
DESC 학과;

-- 제약조건: 세번째 경우
DROP TABLE 학과;
CREATE TABLE 학과 (
	학과번호 char(2), 
	학과명 varchar(20),
	학과장명 varchar(20)
);
ALTER TABLE 학과
ADD CONSTRAINT PK_학과 PRIMARY key(학과번호);
DESC 학과;



-- 외래키(FK) 제약조건 추가
DROP TABLE 학생;
CREATE TABLE 학생(
	학번 char(5) PRIMARY KEY,
	이름 varchar(20) NOT NULL,
	생일 date NOT NULL,
	연락처 varchar(20) UNIQUE,
	학과번호 char(2), -- 외래키 제약조건
	성별 char(2) check(성별 IN ('남','여')),
	등록일 date DEFAULT (curdate()),
	-- 학과번호 INSERT시, 학과 테이블의 학과번호에 있는 것이어야 됨.
	FOREIGN KEY (학과번호) REFERENCES 학과(학과번호)
	);
DESC 학과;
DESC 학생;

 SELECT * FROM 학과;
 SELECT * FROM 학생;
 
 DELETE 학과;
 
 INSERT  INTO 학과
 VALUES ('02', '국어국문과', '홍교수');
 
 INSERT INTO  학생
 VALUES ('S0001', '강감찬', '2000-02-29','01022223333','01', '남', NULL);
 
 -- CHECK제약 조건 테스트
 INSERT INTO  학생
 VALUES ('S0001', '강감찬', '2000-02-29','01022223333','01', '홍', NULL);
 -- check constraint '학생_차_1' is violated.
 -- DEFAULT 제약조건 테스트
 INSERT INTO  학생(학번, 이름, 생일, 연락처, 학과번호, 성별)
 VALUES ('S0002', '이순신', '2000-03-04','01044445555','01', '남');
 
 -- 외래키 제약조건
 INSERT INTO  학생(학번, 이름, 생일, 연락처, 학과번호, 성별)
 VALUES ('S0003', '신사임당', '2000-04-05','01066667777','02', '남');
 --  foreign  key constraint fails
 SELECT  * FROM 학과;
 
 -- ON DELETE/UPDATE CASCADE
 -- 참조하는 부모 테이즐에서 삭제/수정이 일어날 때 자식 테이블도 자동으로 변경/삭제되도록 한다.
 DROP TABLE 학생;
 DROP TABLE 학과;

CREATE TABLE 학과(
	학과번호 char(2) PRIMARY KEY,
	학과명 varchar(20)
);
CREATE TABLE 학생(
	학번 char(6) PRIMARY KEY,
	이름 varchar(20),
	학과번호 char(2),
	FOREIGN KEY(학과번호) 
		REFERENCES 학과(학과번호)
		ON DELETE CASCADE
		ON UPDATE CASCADE 
);
 DROP TABLE 학생;
 DROP TABLE 학과;
DESC 학과;
DESC 학생;

-- 학과 데이터
INSERT INTO 학과 VALUES ('01', '국어국문과');
INSERT INTO 학과 VALUES ('02', '컴퓨터 공학과');
SELECT * FROM 학과;

-- 학생 데이터
INSERT INTO 학생 VALUES ('S0001', '홍길동', '01');
INSERT INTO 학생 VALUES ('S0002', '이소룡', '02');
SELECT * FROM 학생;

-- 학과번호 수정하면, 참조하던 학생 테이블의 학과번호도 함께 수정된다.
UPDATE 학과 SET 학과번호 = '03' WHERE 학과번호 = '02';
SELECT * FROM 학과;

-- 학과번호 수정하면, 참조하던 학생 테이블의 레토드도 함께 삭제된다.
DELETE FROM 학과 WHERE 학과번호 = '01';
SELECT * FROM 학생;




-- 연습문제 / 실전문제

-- 1. 제품 테이블의 재고 컬럼에 CHECK제약조건을 추가하시오.
--  * ALTER TABLE명령을 사용합니다.
--  제약조건: 재고는 0보다 크거나 같아야합니다.
USE 세계무역;
DESC 제품;

ALTER TABLE 제품 
ADD CONSTRAINT 제품_재고 CHECK (재고 >= 0);
SELECT * FROM 제품;


-- 2. 제품 테이블에 재고금액 컬럼을 추가하시오. 이때 재고금액은 ‘단가 * 재고’가 자동 계산되어 저장되도록 합니다.
-- * ALTER TABLE 명령을 사용합니다.
-- * STORED 옵션을 사용하면 됩니다.
-- 예시)CREATE TABLE 회원
-- (
--        아이디 VARCHAR(20) PRIMARY KEY
--       ,회원명 VARCHAR(20)
--       ,키 INT
--       ,몸무게 INT
--       ,체질량지수 DECIMAL(4,1) AS (몸무게 / POWER(키 / 100, 2)) STORED
--     );

ALTER TABLE 제품 
ADD 재고금액 int AS (단가*재고) STORED;
SELECT * FROM 제품;




-- 3. 제품 테이블에서 제품 레코드를 삭제하면 주문세부 테이블에 있는 관련 레코드도 함께 삭제되도록 
-- 주문세부 테이블의 제품번호 컬럼에 외래키 제약조건과 옵션을 설정하시오.
-- * ALTER TABLE 명령을 사용합니다.
-- * 외래키 제약조건을 설정할 때  ON DELETE CASCADE 옵션을 설명하면, 
-- 부모 레코드 삭제시 자식 레코드도 연쇄적으로 삭제되어 데이터의 일관성을 유지할 수 있습니다.
SELECT * FROM 제품;
SELECT * FROM 주문세부;
ALTER TABLE 주문세부 
ADD CONSTRAINT 주문세부_제품번호
	FOREIGN KEY(제품번호) 
		REFERENCES 제품(제품번호)
		ON DELETE CASCADE
		ON UPDATE CASCADE ;
DELETE FROM 제품 WHERE 제품번호 = 1;




-- 실전문제
-- 1. 영화 테이블과 평점관리 테이블을 만들고자 합니다. 다음 테이블 명세서를 참고하여 테이블을 생성하시오.
USE 영화평점;
DROP TABLE IF EXISTS 평점;
DROP TABLE IF EXISTS 영화;
CREATE TABLE 영화(
	영화번호 char(5) PRIMARY KEY,
	타이틀 varchar(100) NOT NULL,
	장르 varchar(100) CHECK(장르 in('코미디', '드라마','다큐','SF', '액션', '역사', '기타')),
	배우 varchar(100) NOT NULL,
	감독 varchar(100) NOT NULL,
	제작사 varchar(150) NOT NULL,
	개봉일 date,
	등록일 date DEFAULT (curdate())
);
SELECT * FROM 영화;

-- 2. 다음 테이블 명세서를 참고하여 평점관리 테이블을 생성하시오.
CREATE TABLE 평점(
	번호 int AUTO_INCREMENT PRIMARY KEY,
	평가자닉네임 varchar(50) NOT NULL,
	영화번호 char(5) NOT NULL,
	평점 int CHECK (평점 BETWEEN 1 AND 5),
	평가 varchar(2000) NOT NULL,
	등록일 date DEFAULT (curdate()),
	FOREIGN KEY (영화번호) 	REFERENCES 영화(영화번호)
);
SELECT * FROM 평점;


-- 3.영화  테이블에 다음과 같이 데이터를 추가하시오.
INSERT into 영화(영화번호, 타이틀, 장르, 배우, 감독, 제작사, 개봉일) VALUES
	('00001','파묘', '드라마', '최민식 김고은', '장재현', '쇼박스', '2024-02-22' ),
	('00002', '듄:파트2', '액션', '티미시샬라메 젠데이아', '드니뵐뇌브', '레전더리 픽처스','2024-02-28');


-- 4. 평점관리 테이블에 다음과 같이 데이터를 추가하시오.
INSERT into 평점(번호, 평가자닉네임, 영화번호, 평점, 평가) VALUES
	('1', '영화광', '00001', '5', '미치도록 스릴이 넘쳐요'),
	('2', '무비러브', '00002', '4', '장엄한 스케일이 좋다');




-- 5.영화번호를 00003으로도 새로운 레코드를 넣어서 오류 발생 여부를 확인하시오.
 INSERT into 영화(영화번호, 타이틀, 장르, 배우, 감독, 제작사, 개봉일) VALUES
	('00001', '파묘', '드라마', '최민식 김고은', '장재현', '쇼박스', '2024-02-22' ),
	('00002', '듄:파트2', '액션', '티미시샬라메 젠데이아', '드니뵐뇌브', '레전더리 픽처스','2024-02-28')
	('00003', '인터스텔라', 'SF', '매튜매커너히', '크리스토퍼놀란', '레전더리픽처스','2014-11-06');
-- SQL Error [1064] [42000]: You have an error in your SQL syntax; 
-- check the manual that corresponds to your MySQL server version for the right syntax to use near 
-- '('00003', '인터스텔라', '공상과학', '매튜매커너히', '크리스토' at line 5



-- 6.영화테이블에서 레코드를 지우면 외래키 제약조건에 의해 오류가 발생하는지 확인하시오.
-- SQL Error [3734] [HY000]: Failed to add the foreign key constraint. 
-- Missing column '영화번호' for constraint '평점_ibfk_1' in the referenced table '영화'



-- 7.ON CASCADE 옵션을 통해 6번 문제를 해결하시오.
USE 영화평점;
DROP TABLE IF EXISTS 평점;
DROP TABLE IF EXISTS 영화;
CREATE TABLE 영화(
	영화번호 char(5) PRIMARY KEY,
	타이틀 varchar(100) NOT NULL,
	장르 varchar(100) CHECK(장르 in('코미디', '드라마','다큐','SF', '액션', '역사', '기타')),
	배우 varchar(100) NOT NULL,
	감독 varchar(100) NOT NULL,
	제작사 varchar(150) NOT NULL,
	개봉일 date,
	등록일 date DEFAULT (curdate())
);
SELECT * FROM 영화;

-- 2. 다음 테이블 명세서를 참고하여 평점관리 테이블을 생성하시오.
CREATE TABLE 평점(
	번호 int AUTO_INCREMENT PRIMARY KEY,
	평가자닉네임 varchar(50) NOT NULL,
	영화번호 char(5) NOT NULL,
	평점 int CHECK (평점 BETWEEN 1 AND 5),
	평가 varchar(2000) NOT NULL,
	등록일 date DEFAULT (curdate()),
	FOREIGN KEY (영화번호)
	REFERENCES 영화(영화번호)
		ON DELETE CASCADE
		ON UPDATE CASCADE
);
SELECT * FROM 평점;


-- 3.영화  테이블에 다음과 같이 데이터를 추가하시오.
INSERT into 영화(영화번호, 타이틀, 장르, 배우, 감독, 제작사, 개봉일) VALUES
	('00001','파묘', '드라마', '최민식 김고은', '장재현', '쇼박스', '2024-02-22' ),
	('00002', '듄:파트2', '액션', '티미시샬라메 젠데이아', '드니뵐뇌브', '레전더리 픽처스','2024-02-28');


-- 4. 평점관리 테이블에 다음과 같이 데이터를 추가하시오.
INSERT into 평점(번호, 평가자닉네임, 영화번호, 평점, 평가) VALUES
	('1', '영화광', '00001', '5', '미치도록 스릴이 넘쳐요'),
	('2', '무비러브', '00002', '4', '장엄한 스케일이 좋다');

DELETE FROM 영화 WHERE 영화번호 = '00001';

%% --- 엔터티 정의 ---
    부서 {
        CHAR(2) 부서번호 PK
        VARCHAR(20) 부서명
    }

    사원 {
        CHAR(3) 사원번호 PK
        VARCHAR(20) 이름
        VARCHAR(20) 영문이름
        VARCHAR(10) 직위
        CHAR(2) 성별
        DATE 생일
        DATE 입사일
        VARCHAR(50) 주소
        VARCHAR(20) 도시
        VARCHAR(20) 지역
        VARCHAR(20) 집전화
        CHAR(3) 상사번호 FK "자기참조(사원)"
        CHAR(2) 부서번호 FK "참조(부서)"
    }

    고객 {
        CHAR(5) 고객번호 PK
        VARCHAR(30) 고객회사명
        VARCHAR(20) 담당자명
        VARCHAR(20) 담당자직위
        VARCHAR(50) 주소
        VARCHAR(20) 도시
        VARCHAR(20) 지역
        VARCHAR(20) 전화번호
        INT 마일리지
    }

    제품 {
        INT 제품번호 PK
        VARCHAR(50) 제품명
        VARCHAR(30) 포장단위
        INT 단가
        INT 재고
    }

    주문 {
        CHAR(5) 주문번호 PK
        CHAR(5) 고객번호 FK "참조(고객)"
        CHAR(3) 사원번호 FK "참조(사원)"
        DATE 주문일
        DATE 요청일
        DATE 발송일
    }

    주문세부 {
        CHAR(5) 주문번호 PK, FK "참조(주문)"
        INT 제품번호 PK, FK "참조(제품)"
        INT 단가
        INT 주문수량
        FLOAT 할인율
    }

    마일리지등급 {
        CHAR(1) 등급명 PK
        INT 하한마일리지
        INT 상한마일리지
    }

    %% --- 관계 정의 ---

    %% 부서 1 : N 사원 (한 부서에는 여러 사원이 있다)
    부서 ||--o{ 사원 : "소속된다"

    %% 사원 1 : N 사원 (한 명의 상사가 여러 사원을 관리한다 - 자기참조)
    사원 ||--o{ 사원 : "관리한다(상사)"

    %% 고객 1 : N 주문 (한 고객은 여러 주문을 한다)
    고객 ||--o{ 주문 : "주문한다"

    %% 사원 1 : N 주문 (한 사원은 여러 주문을 담당한다)
    사원 ||--o{ 주문 : "담당한다"

    %% 주문 1 : N 주문세부 (한 주문에는 여러 세부 항목이 있다 - 식별 관계)
    주문 ||--|{ 주문세부 : "포함한다"

    %% 제품 1 : N 주문세부 (한 제품은 여러 주문 세부 항목에 포함된다 - 식별 관계)
    제품 ||--|{ 주문세부 : "포함된다"

    %% 고객 - 마일리지등급 (논리적 참조 관계: 고객의 마일리지가 등급 범위에 포함됨)
    고객 }|..|| 마일리지등급 : "등급참조(논리적)"













































































