--------------------------------------------------------
--  DDL for Table ADMINAUTH$
--------------------------------------------------------

  CREATE TABLE "SYS"."ADMINAUTH$" SHARING=METADATA 
   (	"USER#" NUMBER, 
	"SYSPRIV" NUMBER, 
	"COMMON" NUMBER, 
	"FEDPRIV" NUMBER DEFAULT 0
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSTEM" ;
