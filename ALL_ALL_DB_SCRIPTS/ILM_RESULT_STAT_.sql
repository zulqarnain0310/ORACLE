--------------------------------------------------------
--  DDL for Table ILM_RESULT_STAT$
--------------------------------------------------------

  CREATE TABLE "SYS"."ILM_RESULT_STAT$" SHARING=METADATA 
   (	"JOBNAME" VARCHAR2(128 BYTE), 
	"STATISTIC#" NUMBER, 
	"VALUE" NUMBER
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSAUX" ;
