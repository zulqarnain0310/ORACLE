--------------------------------------------------------
--  DDL for Table SCHEDULER$_SRCQ_MAP
--------------------------------------------------------

  CREATE TABLE "SYS"."SCHEDULER$_SRCQ_MAP" SHARING=METADATA 
   (	"OID" NUMBER, 
	"RULE_NAME" VARCHAR2(523 BYTE), 
	"JOBOID" NUMBER, 
	"FLAGS" NUMBER
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSTEM" ;
