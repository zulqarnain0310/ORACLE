--------------------------------------------------------
--  DDL for Table WI$_CAPTURE_FILE
--------------------------------------------------------

  CREATE TABLE "SYS"."WI$_CAPTURE_FILE" SHARING=METADATA 
   (	"JOBID" NUMBER, 
	"FILEID" NUMBER, 
	"PATH" VARCHAR2(4000 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSAUX" ;
