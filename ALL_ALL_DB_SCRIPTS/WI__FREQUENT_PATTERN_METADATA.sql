--------------------------------------------------------
--  DDL for Table WI$_FREQUENT_PATTERN_METADATA
--------------------------------------------------------

  CREATE TABLE "SYS"."WI$_FREQUENT_PATTERN_METADATA" SHARING=METADATA 
   (	"JOBID" NUMBER, 
	"MODELORDER" NUMBER, 
	"THRESHOLD" NUMBER
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSAUX" ;
