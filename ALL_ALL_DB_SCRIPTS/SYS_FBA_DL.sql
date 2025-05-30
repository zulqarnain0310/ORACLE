--------------------------------------------------------
--  DDL for Table SYS_FBA_DL
--------------------------------------------------------

  CREATE TABLE "SYS"."SYS_FBA_DL" SHARING=METADATA 
   (	"OBJN" NUMBER, 
	"LROWID" VARCHAR2(20 BYTE), 
	"HROWID" VARCHAR2(20 BYTE), 
	"USN" NUMBER, 
	"SLOT" NUMBER, 
	"SEQ" NUMBER, 
	"CSCN" NUMBER
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSTEM" ;
