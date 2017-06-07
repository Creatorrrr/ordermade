-- cmd에서 다음 입력
-- sqlplus / as sysdba
-- 그 다음 계정 생성
-- CREATE USER ordermade IDENTIFIED BY ordermade;
-- 계정에 권한 부여
-- GRANT connect, resource, dba TO ordermade;

DROP TABLE product CASCADE CONSTRAINTS;
DROP TABLE review CASCADE CONSTRAINTS;
DROP TABLE request CASCADE CONSTRAINTS;
DROP TABLE invite_request CASCADE CONSTRAINTS;
DROP TABLE comm CASCADE CONSTRAINTS;
DROP TABLE attach CASCADE CONSTRAINTS;
DROP TABLE account CASCADE CONSTRAINTS;
DROP TABLE purchase_history CASCADE CONSTRAINTS;
DROP TABLE portfolio CASCADE CONSTRAINTS;
DROP TABLE tag CASCADE CONSTRAINTS;
DROP TABLE category CASCADE CONSTRAINTS;
DROP TABLE member CASCADE CONSTRAINTS;

CREATE TABLE product (
  id VARCHAR2(50) PRIMARY KEY,
  title VARCHAR2(200),
  maker_id VARCHAR2(200),
  type VARCHAR2(200),
  content VARCHAR2(2000),
  image VARCHAR2(500),
  price NUMBER,
  period NUMBER,
  hit NUMBER
);

CREATE TABLE review (
  id VARCHAR2(50) PRIMARY KEY,
  title VARCHAR2(200),
  consumer_id VARCHAR2(50),
  content VARCHAR2(2000),
  grade NUMBER,
  product_id VARCHAR2(50)
);

CREATE TABLE request (
  id VARCHAR2(50) PRIMARY KEY,
  title VARCHAR2(200),
  maker_id VARCHAR2(50),
  consumer_id VARCHAR2(50),
  type VARCHAR2(200),
  content VARCHAR2(2000),
  hope_price NUMBER,
  price NUMBER,
  bound VARCHAR2(50)
);

CREATE TABLE invite_request (
  id VARCHAR2(50) PRIMARY KEY,
  message VARCHAR2(500),
  maker_id VARCHAR2(50),
  request_time DATE,
  request_id VARCHAR2(50),
  form VARCHAR2(5)
);

CREATE TABLE comm (-- 테이블 이름 : comment에서 comm으로 수정
  id VARCHAR2(50) PRIMARY KEY,
  content VARCHAR2(2000),
  content_type VARCHAR2(50),
  member_id VARCHAR2(50),
  request_id VARCHAR2(50),
  time DATE
);

CREATE TABLE attach (
  id VARCHAR2(50) PRIMARY KEY,
  path VARCHAR2(500),
  file_name VARCHAR2(200),
  extension VARCHAR2(50),
  request_id VARCHAR2(50)
);

CREATE TABLE account (
  member_id VARCHAR2(50) PRIMARY KEY,
  money NUMBER
);

CREATE TABLE purchase_history (
  id VARCHAR2(50) PRIMARY KEY,
  consumer_id VARCHAR2(50),
  maker_id VARCHAR2(50),
  request_id VARCHAR2(50),
  order_date DATE,
  invoice_number VARCHAR2(500),
  charge NUMBER,
  delivery_status VARCHAR2(200),
  payment VARCHAR2(50)
);

CREATE TABLE portfolio (
  id VARCHAR2(50) PRIMARY KEY,
  title VARCHAR2(200),
  type VARCHAR2(200),
  content VARCHAR2(2000),
  maker_id VARCHAR2(50),
  image VARCHAR2(500)
);

CREATE TABLE tag (
  keyword VARCHAR2(200),
  score NUMBER,
  portfolio_id VARCHAR2(50)
);

CREATE TABLE category (
  type VARCHAR2(200) PRIMARY KEY
);

CREATE TABLE member (
  id VARCHAR2(50) PRIMARY KEY,
  password VARCHAR2(200),
  email VARCHAR2(200),
  address VARCHAR2(500),
  member_type VARCHAR2(200),
  name VARCHAR2(50),
  introduce VARCHAR2(500),
  license_number VARCHAR2(200),
  image VARCHAR2(500)
);

DROP SEQUENCE account_seq;
DROP SEQUENCE attach_seq;
DROP SEQUENCE category_seq;
DROP SEQUENCE comment_seq;
DROP SEQUENCE invite_request_seq;
DROP SEQUENCE portfolio_seq;
DROP SEQUENCE product_seq;
DROP SEQUENCE purchase_history_seq;
DROP SEQUENCE request_seq;
DROP SEQUENCE review_seq;
DROP SEQUENCE tag_seq;

CREATE SEQUENCE account_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE attach_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE category_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE comment_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE invite_request_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE portfolio_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE product_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE purchase_history_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE request_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE review_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE tag_seq START WITH 1 INCREMENT BY 1;


--INSERT INTO category(type) VALUES ('FUNITURE');
--INSERT INTO category(type) VALUES ('ACCESSORY');
--INSERT INTO category(type) VALUES ('KITCHEN');
--INSERT INTO category(type) VALUES ('DIGITAL');
--INSERT INTO category(type) VALUES ('CLOTHING');
--INSERT INTO category(type) VALUES ('SPORT');

INSERT INTO category(type) VALUES ('가구');
INSERT INTO category(type) VALUES ('가방');
INSERT INTO category(type) VALUES ('뷰티');
INSERT INTO category(type) VALUES ('신발');
INSERT INTO category(type) VALUES ('악세사리');
INSERT INTO category(type) VALUES ('의류');
INSERT INTO category(type) VALUES ('지갑');
INSERT INTO category(type) VALUES ('파우치');
INSERT INTO category(type) VALUES ('휴대폰케이스');

COMMIT;