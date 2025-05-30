--------------------------------------------------------
--  DDL for Table JAVA$COMPILER$OPTIONS
--------------------------------------------------------

  CREATE TABLE "SYS"."JAVA$COMPILER$OPTIONS" SHARING=METADATA 
   (	"OWNER#" NUMBER, 
	"PROPERTY" VARCHAR2(64 BYTE), 
	"VALUE" VARCHAR2(4000 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSTEM" ;
