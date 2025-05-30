--------------------------------------------------------
--  DDL for Table WRI$_SQLSET_PLANS_TOCAP
--------------------------------------------------------

  CREATE GLOBAL TEMPORARY TABLE "SYS"."WRI$_SQLSET_PLANS_TOCAP" SHARING=METADATA 
   (	"STMT_ID" NUMBER, 
	"SQL_ID" VARCHAR2(13 BYTE), 
	"PLAN_HASH_VALUE" NUMBER, 
	"CON_DBID" NUMBER DEFAULT 0, 
	"LAST_LOAD_TIME" DATE
   ) ON COMMIT DELETE ROWS ;
