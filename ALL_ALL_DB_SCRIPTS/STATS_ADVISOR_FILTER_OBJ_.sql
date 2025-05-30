--------------------------------------------------------
--  DDL for Table STATS_ADVISOR_FILTER_OBJ$
--------------------------------------------------------

  CREATE GLOBAL TEMPORARY TABLE "SYS"."STATS_ADVISOR_FILTER_OBJ$" SHARING=METADATA 
   (	"RULE_ID" NUMBER, 
	"OBJ#" NUMBER, 
	"FLAGS" NUMBER, 
	"TYPE" NUMBER
   ) ON COMMIT PRESERVE ROWS ;
