--------------------------------------------------------
--  DDL for Table WRI$_STS_MASKING_STEP_PROGRESS
--------------------------------------------------------

  CREATE TABLE "SYS"."WRI$_STS_MASKING_STEP_PROGRESS" SHARING=METADATA 
   (	"SCRIPT_ID" NUMBER, 
	"STEP_ID" NUMBER, 
	"STMT_ID" NUMBER
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSTEM" ;
