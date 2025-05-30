--------------------------------------------------------
--  DDL for Table WRI$_SQLSET_STS_TOPACK
--------------------------------------------------------

  CREATE GLOBAL TEMPORARY TABLE "SYS"."WRI$_SQLSET_STS_TOPACK" SHARING=METADATA 
   (	"SQLSET_ID" NUMBER, 
	"NAME" VARCHAR2(128 BYTE), 
	"OWNER" VARCHAR2(128 BYTE)
   ) ON COMMIT PRESERVE ROWS ;
