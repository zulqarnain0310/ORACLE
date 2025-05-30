--------------------------------------------------------
--  DDL for Table XS$ROLESET
--------------------------------------------------------

  CREATE TABLE "SYS"."XS$ROLESET" SHARING=METADATA 
   (	"RSID#" NUMBER, 
	"CTIME" TIMESTAMP (6), 
	"MTIME" TIMESTAMP (6), 
	"DESCRIPTION" VARCHAR2(4000 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSTEM" ;
