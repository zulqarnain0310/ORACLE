--------------------------------------------------------
--  DDL for Table WRI$_AGGREGATION_ENABLED
--------------------------------------------------------

  CREATE TABLE "SYS"."WRI$_AGGREGATION_ENABLED" SHARING=METADATA 
   (	"TRACE_TYPE" NUMBER, 
	"PRIMARY_ID" VARCHAR2(64 BYTE), 
	"QUALIFIER_ID1" VARCHAR2(48 BYTE), 
	"QUALIFIER_ID2" VARCHAR2(32 BYTE), 
	"INSTANCE_NAME" VARCHAR2(16 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSAUX" ;
