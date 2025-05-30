--------------------------------------------------------
--  DDL for Table PACKAGE_AUDIT_MOD
--------------------------------------------------------

  CREATE TABLE "RBL_STGDB"."PACKAGE_AUDIT_MOD" 
   (	"EXECUTION_DATE" VARCHAR2(200 CHAR), 
	"DATABASENAME" NVARCHAR2(30), 
	"PACKAGENAME" NVARCHAR2(100), 
	"TABLENAME" NVARCHAR2(100), 
	"EXECUTIONSTARTTIME" DATE, 
	"EXECUTIONENDTIME" DATE, 
	"TIMEDURATION_SEC" NUMBER(10,0), 
	"EXECUTIONSTATUS" NVARCHAR2(10), 
	"DATE_OF_DATA" DATE
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
