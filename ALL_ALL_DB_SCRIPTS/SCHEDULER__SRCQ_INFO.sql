--------------------------------------------------------
--  DDL for Table SCHEDULER$_SRCQ_INFO
--------------------------------------------------------

  CREATE TABLE "SYS"."SCHEDULER$_SRCQ_INFO" SHARING=METADATA 
   (	"OBJ#" NUMBER, 
	"RULESET_NAME" VARCHAR2(128 BYTE), 
	"RULE_COUNT" NUMBER, 
	"FLAGS" NUMBER
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSTEM" ;
