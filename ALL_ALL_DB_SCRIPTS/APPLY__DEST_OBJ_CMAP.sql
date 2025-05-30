--------------------------------------------------------
--  DDL for Table APPLY$_DEST_OBJ_CMAP
--------------------------------------------------------

  CREATE TABLE "SYS"."APPLY$_DEST_OBJ_CMAP" SHARING=METADATA 
   (	"DEST_ID" NUMBER, 
	"SRC_LONG_CNAME" VARCHAR2(4000 BYTE), 
	"DEST_LONG_CNAME" VARCHAR2(4000 BYTE), 
	"SPARE1" NUMBER
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSTEM" ;
