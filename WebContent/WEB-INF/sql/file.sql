CREATE TABLE TB_FILE
(
  IDX   NUMBER,
  BOARD_IDX NUMBER NOT NULL,
  ORIGINAL_FILE_NAME VARCHAR2(260 BYTE) NOT NULL,
  STORED_FILE_NAME VARCHAR2(36 BYTE) NOT NULL,
  FILE_SIZE NUMBER,
  CREA_DTM  DATE DEFAULT SYSDATE NOT NULL,
  CREA_ID   VARCHAR2(30 BYTE) NOT NULL,
  DEL_GB    VARCHAR2(1 BYTE) DEFAULT 'N' NOT NULL,
  PRIMARY KEY (IDX)
);


출처: http://enterkey.tistory.com/226?category=612947 [Hello World]

CREATE SEQUENCE SEQ_TB_FILE_IDX
  START WITH 1
  INCREMENT BY 1
  NOMAXVALUE
  NOCACHE;


출처: http://enterkey.tistory.com/226?category=612947 [Hello World]