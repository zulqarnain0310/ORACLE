--------------------------------------------------------
--  DDL for Table MLOG_REFCOL$
--------------------------------------------------------

  CREATE TABLE "SYS"."MLOG_REFCOL$" SHARING=METADATA 
   (	"MOWNER" VARCHAR2(128 BYTE), 
	"MASTER" VARCHAR2(128 BYTE), 
	"COLNAME" VARCHAR2(128 BYTE), 
	"OLDEST" DATE, 
	"OLDEST_SCN" NUMBER, 
	"FLAG" NUMBER(*,0)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSTEM" ;
