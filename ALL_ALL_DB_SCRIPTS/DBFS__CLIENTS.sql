--------------------------------------------------------
--  DDL for Table DBFS$_CLIENTS
--------------------------------------------------------

  CREATE TABLE "SYS"."DBFS$_CLIENTS" SHARING=METADATA 
   (	"C_INFO" VARCHAR2(64 BYTE), 
	"C_DATA" VARCHAR2(4000 BYTE), 
	"CREATED" TIMESTAMP (6)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSTEM" ;
  GRANT SELECT ON "SYS"."DBFS$_CLIENTS" TO "DBFS_ROLE";
