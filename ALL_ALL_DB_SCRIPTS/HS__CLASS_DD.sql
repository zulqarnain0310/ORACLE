--------------------------------------------------------
--  DDL for Table HS$_CLASS_DD
--------------------------------------------------------

  CREATE TABLE "SYS"."HS$_CLASS_DD" SHARING=METADATA 
   (	"FDS_CLASS_DD_ID" NUMBER, 
	"FDS_CLASS_ID" NUMBER, 
	"DD_TABLE_ID" NUMBER, 
	"TRANSLATION_TYPE" CHAR(1 BYTE), 
	"TRANSLATION_TEXT" VARCHAR2(4000 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSTEM" ;
