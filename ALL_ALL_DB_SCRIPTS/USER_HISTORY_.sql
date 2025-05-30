--------------------------------------------------------
--  DDL for Table USER_HISTORY$
--------------------------------------------------------

  CREATE TABLE "SYS"."USER_HISTORY$" SHARING=METADATA 
   (	"USER#" NUMBER, 
	"PASSWORD" VARCHAR2(4000 BYTE), 
	"PASSWORD_DATE" DATE
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSTEM" ;
