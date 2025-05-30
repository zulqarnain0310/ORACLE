--------------------------------------------------------
--  DDL for Table WRI$_ADV_SQLA_FAKE_REG
--------------------------------------------------------

  CREATE TABLE "SYS"."WRI$_ADV_SQLA_FAKE_REG" SHARING=METADATA 
   (	"TASK_ID" NUMBER, 
	"OWNER" VARCHAR2(128 BYTE), 
	"NAME" VARCHAR2(128 BYTE), 
	"FAKE_TYPE" NUMBER
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSAUX" ;
