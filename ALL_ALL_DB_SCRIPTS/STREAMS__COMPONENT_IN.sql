--------------------------------------------------------
--  DDL for Table STREAMS$_COMPONENT_IN
--------------------------------------------------------

  CREATE GLOBAL TEMPORARY TABLE "SYS"."STREAMS$_COMPONENT_IN" SHARING=METADATA 
   (	"COMPONENT_ID" NUMBER, 
	"COMPONENT_NAME" VARCHAR2(4000 BYTE), 
	"COMPONENT_DB" VARCHAR2(128 BYTE), 
	"COMPONENT_TYPE" NUMBER, 
	"COMPONENT_PROPERTY" NUMBER, 
	"COMPONENT_CHANGED_TIME" DATE, 
	"ANALYSIS_FLAG" RAW(4) DEFAULT '00000000', 
	"SPARE1" NUMBER, 
	"SPARE2" NUMBER, 
	"SPARE3" VARCHAR2(4000 BYTE), 
	"SPARE4" DATE
   ) ON COMMIT PRESERVE ROWS ;
