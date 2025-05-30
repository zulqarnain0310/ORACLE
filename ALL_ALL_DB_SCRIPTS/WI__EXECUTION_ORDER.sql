--------------------------------------------------------
--  DDL for Table WI$_EXECUTION_ORDER
--------------------------------------------------------

  CREATE TABLE "SYS"."WI$_EXECUTION_ORDER" SHARING=METADATA 
   (	"JOBID" NUMBER, 
	"FILEID" NUMBER, 
	"RANK" NUMBER, 
	"TEMPLATEID" NUMBER, 
	"DBTIME" NUMBER
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSAUX" ;
