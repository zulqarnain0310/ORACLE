--------------------------------------------------------
--  DDL for Table HS$_CLASS_CAPS
--------------------------------------------------------

  CREATE TABLE "SYS"."HS$_CLASS_CAPS" SHARING=METADATA 
   (	"FDS_CLASS_CAP_ID" NUMBER, 
	"FDS_CLASS_ID" NUMBER, 
	"CAP_NUMBER" NUMBER, 
	"CONTEXT" NUMBER, 
	"TRANSLATION" VARCHAR2(255 BYTE), 
	"ADDITIONAL_INFO" NUMBER
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSTEM" ;
