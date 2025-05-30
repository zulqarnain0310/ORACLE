--------------------------------------------------------
--  DDL for Table ACLMV$_REFLOG
--------------------------------------------------------

  CREATE TABLE "SYS"."ACLMV$_REFLOG" SHARING=METADATA 
   (	"RTIME" TIMESTAMP (6), 
	"SCHEMA_NAME" VARCHAR2(128 BYTE), 
	"TABLE_NAME" VARCHAR2(128 BYTE), 
	"MVIEW_NAME" VARCHAR2(128 BYTE), 
	"JOB_NAME" VARCHAR2(128 BYTE), 
	"ACL_STATUS" VARCHAR2(128 BYTE), 
	"STATUS" NUMBER, 
	"ERRMSG" VARCHAR2(256 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSTEM" ;
