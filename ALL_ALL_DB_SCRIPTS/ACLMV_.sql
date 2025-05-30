--------------------------------------------------------
--  DDL for Table ACLMV$
--------------------------------------------------------

  CREATE TABLE "SYS"."ACLMV$" SHARING=METADATA 
   (	"TABLE_OBJ#" NUMBER, 
	"ACL_MVIEW_OBJ#" NUMBER, 
	"REFRESH_MODE" NUMBER, 
	"JOB_NAME" VARCHAR2(128 BYTE), 
	"TRACE_LEVEL" NUMBER
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSTEM" ;
