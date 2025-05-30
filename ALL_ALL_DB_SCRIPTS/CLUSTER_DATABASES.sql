--------------------------------------------------------
--  DDL for Table CLUSTER_DATABASES
--------------------------------------------------------

  CREATE GLOBAL TEMPORARY TABLE "SYS"."CLUSTER_DATABASES" SHARING=METADATA 
   (	"DATABASE_NAME" VARCHAR2(128 BYTE), 
	"SPAREN1" NUMBER, 
	"SPAREN2" NUMBER, 
	"SPAREVC1" VARCHAR2(4000 BYTE), 
	"SPAREVC2" VARCHAR2(4000 BYTE)
   ) ON COMMIT PRESERVE ROWS ;
