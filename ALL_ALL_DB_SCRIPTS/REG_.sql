--------------------------------------------------------
--  DDL for Table REG$
--------------------------------------------------------

  CREATE TABLE "SYS"."REG$" SHARING=METADATA 
   (	"REG_ID" NUMBER, 
	"SUBSCRIPTION_NAME" VARCHAR2(776 BYTE), 
	"LOCATION_NAME" VARCHAR2(256 BYTE), 
	"USER#" NUMBER, 
	"USER_CONTEXT" RAW(128), 
	"CONTEXT_SIZE" NUMBER, 
	"NAMESPACE" NUMBER, 
	"PRESENTATION" NUMBER, 
	"VERSION" NUMBER, 
	"STATUS" NUMBER, 
	"ANY_CONTEXT" "SYS"."ANYDATA" , 
	"CONTEXT_TYPE" NUMBER DEFAULT 0, 
	"QOSFLAGS" NUMBER DEFAULT 0, 
	"PAYLOAD_CALLBACK" VARCHAR2(4000 BYTE), 
	"TIMEOUT" TIMESTAMP (6), 
	"REG_TIME" TIMESTAMP (6) WITH TIME ZONE, 
	"NTFN_GROUPING_CLASS" NUMBER, 
	"NTFN_GROUPING_VALUE" NUMBER, 
	"NTFN_GROUPING_TYPE" NUMBER, 
	"NTFN_GROUPING_START_TIME" TIMESTAMP (6) WITH TIME ZONE, 
	"NTFN_GROUPING_REPEAT_COUNT" NUMBER, 
	"GROUPING_INST_ID" NUMBER, 
	"STATE" NUMBER, 
	"SESSION_KEY" RAW(1024), 
	"NTFN_SUBSCRIBER" VARCHAR2(128 BYTE) DEFAULT NULL
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" 
 OPAQUE TYPE ("ANY_CONTEXT") STORE AS BASICFILE LOB (
  ENABLE STORAGE IN ROW CHUNK 8192 RETENTION 
  CACHE 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)) ;
