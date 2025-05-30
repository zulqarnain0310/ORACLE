--------------------------------------------------------
--  DDL for Table WI$_TEMPLATE
--------------------------------------------------------

  CREATE TABLE "SYS"."WI$_TEMPLATE" SHARING=METADATA 
   (	"JOBID" NUMBER, 
	"TEMPLATEID" NUMBER, 
	"ISTRANSACTION" CHAR(1 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSAUX" ;
