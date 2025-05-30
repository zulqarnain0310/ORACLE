--------------------------------------------------------
--  DDL for Table XS$DSEC
--------------------------------------------------------

  CREATE TABLE "SYS"."XS$DSEC" SHARING=METADATA 
   (	"XDSID#" NUMBER, 
	"CTIME" TIMESTAMP (6), 
	"MTIME" TIMESTAMP (6), 
	"DESCRIPTION" VARCHAR2(4000 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSTEM" ;
