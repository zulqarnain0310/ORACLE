--------------------------------------------------------
--  DDL for Table WI$_OBJECT
--------------------------------------------------------

  CREATE TABLE "SYS"."WI$_OBJECT" SHARING=METADATA 
   (	"JOBID" NUMBER, 
	"TEMPLATEID" NUMBER, 
	"OBJECTID" NUMBER, 
	"ACCESSTYPE" VARCHAR2(2 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSAUX" ;
