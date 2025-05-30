--------------------------------------------------------
--  DDL for Table STATS_ADVISOR_FILTER_OPR$
--------------------------------------------------------

  CREATE GLOBAL TEMPORARY TABLE "SYS"."STATS_ADVISOR_FILTER_OPR$" SHARING=METADATA 
   (	"RULE_ID" NUMBER, 
	"NAME" VARCHAR2(64 BYTE), 
	"PARAM" VARCHAR2(4000 BYTE), 
	"FLAGS" NUMBER
   ) ON COMMIT PRESERVE ROWS ;
