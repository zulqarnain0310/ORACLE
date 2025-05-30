--------------------------------------------------------
--  DDL for Table DBMS_ALERT_INFO
--------------------------------------------------------

  CREATE TABLE "SYS"."DBMS_ALERT_INFO" SHARING=METADATA 
   (	"NAME" VARCHAR2(30 BYTE), 
	"SID" VARCHAR2(30 BYTE), 
	"CHANGED" VARCHAR2(1 BYTE), 
	"MESSAGE" VARCHAR2(1800 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSTEM" ;
