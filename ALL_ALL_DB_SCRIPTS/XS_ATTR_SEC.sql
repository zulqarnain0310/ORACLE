--------------------------------------------------------
--  DDL for Table XS$ATTR_SEC
--------------------------------------------------------

  CREATE TABLE "SYS"."XS$ATTR_SEC" SHARING=METADATA 
   (	"XDSID#" NUMBER, 
	"ATTR_NAME" VARCHAR2(128 BYTE), 
	"PRIV#" NUMBER
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSTEM" ;
