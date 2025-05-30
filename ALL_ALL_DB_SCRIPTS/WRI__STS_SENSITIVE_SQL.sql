--------------------------------------------------------
--  DDL for Table WRI$_STS_SENSITIVE_SQL
--------------------------------------------------------

  CREATE TABLE "SYS"."WRI$_STS_SENSITIVE_SQL" SHARING=METADATA 
   (	"SCRIPT_ID" NUMBER, 
	"STMT_ID" NUMBER, 
	"NUM_SENSITIVE_BINDS" NUMBER
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSTEM" ;
