--------------------------------------------------------
--  DDL for Table EV$
--------------------------------------------------------

  CREATE TABLE "SYS"."EV$" SHARING=METADATA 
   (	"EV_OBJ#" NUMBER, 
	"BASE_TBL_OWNER#" NUMBER, 
	"BASE_TBL_NAME" VARCHAR2(128 BYTE), 
	"EDITION_OBJ#" NUMBER
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSTEM" ;
