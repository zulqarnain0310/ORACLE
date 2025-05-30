--------------------------------------------------------
--  DDL for Table WI$_JOB
--------------------------------------------------------

  CREATE TABLE "SYS"."WI$_JOB" SHARING=METADATA 
   (	"JOBID" NUMBER, 
	"JOBNAME" VARCHAR2(128 BYTE), 
	"PATH" VARCHAR2(4000 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSAUX" ;
