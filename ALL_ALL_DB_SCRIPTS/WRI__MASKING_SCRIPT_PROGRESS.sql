--------------------------------------------------------
--  DDL for Table WRI$_MASKING_SCRIPT_PROGRESS
--------------------------------------------------------

  CREATE TABLE "SYS"."WRI$_MASKING_SCRIPT_PROGRESS" SHARING=METADATA 
   (	"SCRIPT_ID" NUMBER, 
	"STEP_ID" NUMBER
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSTEM" ;
