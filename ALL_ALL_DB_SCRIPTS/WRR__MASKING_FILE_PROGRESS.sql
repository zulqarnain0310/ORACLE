--------------------------------------------------------
--  DDL for Table WRR$_MASKING_FILE_PROGRESS
--------------------------------------------------------

  CREATE TABLE "SYS"."WRR$_MASKING_FILE_PROGRESS" SHARING=METADATA 
   (	"SCRIPT_ID" NUMBER, 
	"REC_NAME" VARCHAR2(50 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSTEM" ;
