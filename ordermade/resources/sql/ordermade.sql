-- cmd에서 다음 입력
-- sqlplus / as sysdba
-- 그 다음 계정 생성
-- CREATE USER ordermade IDENTIFIED BY ordermade;
-- 계정에 권한 부여
-- GRANT connect, resource, dba TO ordermade;

DROP TABLE product;
DROP TABLE review;
DROP TABLE request;
DROP TABLE invite_request;
DROP TABLE comm;
DROP TABLE attach;
DROP TABLE account;
DROP TABLE purchase_history;
DROP TABLE portfolio;
DROP TABLE tag;
DROP TABLE category;
DROP TABLE member;

CREATE TABLE product (
  id VARCHAR2(50) PRIMARY KEY,
  title VARCHAR2(200),
  maker_id VARCHAR2(200),
  type VARCHAR2(200),
  content VARCHAR2(2000),
  image VARCHAR2(500),
  price NUMBER,
  period NUMBER
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
  member_id VARCHAR2(50),
  request_time NUMBER,
  request_id VARCHAR2(50),
  form VARCHAR2(5)
);

CREATE TABLE comm (-- 테이블 이름 : comment에서 comm으로 수정
  id VARCHAR2(50) PRIMARY KEY,
  content VARCHAR2(2000),
  attach_id VARCHAR2(50),
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
  id VARCHAR2(50) PRIMARY KEY,
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