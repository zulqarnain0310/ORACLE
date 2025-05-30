--------------------------------------------------------
--  DDL for Table DST$TRIGGER_TABLE
--------------------------------------------------------

  CREATE TABLE "SYS"."DST$TRIGGER_TABLE" SHARING=METADATA 
   (	"TRIGGER_OWNER" VARCHAR2(128 BYTE), 
	"TRIGGER_NAME" VARCHAR2(128 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSTEM" ;
