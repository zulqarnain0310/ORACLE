--------------------------------------------------------
--  DDL for Table WRI$_STS_MASKING_ERRORS
--------------------------------------------------------

  CREATE TABLE "SYS"."WRI$_STS_MASKING_ERRORS" SHARING=METADATA 
   (	"SCRIPT_ID" NUMBER, 
	"STMT_ID" NUMBER, 
	"ERROR_NUMBER" NUMBER
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSTEM" ;
