--------------------------------------------------------
--  DDL for Table STREAMS$_LOCAL_ACTIONS_IN
--------------------------------------------------------

  CREATE GLOBAL TEMPORARY TABLE "SYS"."STREAMS$_LOCAL_ACTIONS_IN" SHARING=METADATA 
   (	"MESSAGE_ID" NUMBER, 
	"MESSAGE_ARG1" VARCHAR2(4000 BYTE), 
	"MESSAGE_ARG2" VARCHAR2(4000 BYTE), 
	"MESSAGE_ARG3" VARCHAR2(4000 BYTE), 
	"MESSAGE_ARG4" VARCHAR2(4000 BYTE), 
	"MESSAGE_ARG5" VARCHAR2(4000 BYTE), 
	"COMMAND" VARCHAR2(64 BYTE), 
	"COMMAND_ID" NUMBER, 
	"FLAGS" NUMBER, 
	"ATTR1" VARCHAR2(4000 BYTE), 
	"ATTR2" VARCHAR2(4000 BYTE), 
	"ATTR3" VARCHAR2(4000 BYTE), 
	"ATTR4" VARCHAR2(4000 BYTE), 
	"ATTR5" CLOB, 
	"ATTR6" CLOB, 
	"NUM_ATTR1" NUMBER, 
	"NUM_ATTR2" NUMBER, 
	"NUM_ATTR3" NUMBER, 
	"NUM_ATTR4" NUMBER, 
	"NUM_ATTR5" NUMBER, 
	"ADVISOR_TYPE" VARCHAR2(30 BYTE), 
	"RUN_TIME" DATE, 
	"SPARE1" NUMBER, 
	"SPARE2" NUMBER, 
	"SPARE3" VARCHAR2(4000 BYTE), 
	"SPARE4" DATE
   ) ON COMMIT PRESERVE ROWS 
 LOB ("ATTR5") STORE AS BASICFILE (
  ENABLE STORAGE IN ROW CHUNK 8192 RETENTION 
  NOCACHE ) 
 LOB ("ATTR6") STORE AS BASICFILE (
  ENABLE STORAGE IN ROW CHUNK 8192 RETENTION 
  NOCACHE ) ;
