--------------------------------------------------------
--  DDL for Table HS$_FDS_INST
--------------------------------------------------------

  CREATE TABLE "SYS"."HS$_FDS_INST" SHARING=METADATA 
   (	"FDS_INST_ID" NUMBER, 
	"FDS_CLASS_ID" NUMBER, 
	"FDS_INST_NAME" VARCHAR2(30 BYTE), 
	"FDS_INST_COMMENTS" VARCHAR2(255 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSTEM" ;
