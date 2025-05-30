--------------------------------------------------------
--  DDL for Table XS$VERIFIERS
--------------------------------------------------------

  CREATE TABLE "SYS"."XS$VERIFIERS" SHARING=METADATA 
   (	"USER#" NUMBER, 
	"VERIFIER" VARCHAR2(256 BYTE), 
	"TYPE#" NUMBER
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSTEM" ;
