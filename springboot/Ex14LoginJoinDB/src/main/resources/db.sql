-- 파일이름 : db.sql

-- db 생성
DROP DATABASE IF EXISTS loginjoin;
CREATE DATABASE loginjoin;

-- db 사용 설정
USE loginjoin;

-- 회원정보 테이블
DROP TABLE if EXISTS loginjoin.member;
CREATE TABLE loginjoin.member(
                                 member_no INT AUTO_INCREMENT NOT NULL PRIMARY KEY, -- 고유키
                                 member_username VARCHAR(255) NOT NULL, -- 아이디
                                 member_password VARCHAR(255) NOT NULL, -- 암호
                                 member_email VARCHAR(255), -- 이메일
                                 member_joindate DATE DEFAULT (CURRENT_DATE) -- 가입일
);

-- 테이블 구조 확인
DESCRIBE loginjoin.member;

-- 데이터 추가
insert INTO loginjoin.member values (0, 'hong', '1234', 'hong@gmail.com','2023-12-25');

-- 데이터 조회
SELECT * FROM loginjoin.member;

-- 데이터 수정
UPDATE loginjoin.member SET member_username = 'hong2' WHERE member_no = 1;

-- 데이터 조회
SELECT * FROM loginjoin.member;