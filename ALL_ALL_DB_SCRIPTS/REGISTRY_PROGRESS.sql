--------------------------------------------------------
--  DDL for Table REGISTRY$PROGRESS
--------------------------------------------------------

  CREATE TABLE "SYS"."REGISTRY$PROGRESS" SHARING=METADATA 
   (	"CID" VARCHAR2(30 BYTE), 
	"NAMESPACE" VARCHAR2(30 BYTE), 
	"ACTION" VARCHAR2(255 BYTE), 
	"VALUE" VARCHAR2(255 BYTE), 
	"STEP" NUMBER, 
	"ACTION_TIME" TIMESTAMP (6)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSTEM" ;
