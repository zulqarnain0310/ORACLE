--------------------------------------------------------
--  DDL for Table REGISTRY$SQLPATCH_RU_INFO
--------------------------------------------------------

  CREATE TABLE "SYS"."REGISTRY$SQLPATCH_RU_INFO" SHARING=METADATA 
   (	"PATCH_ID" NUMBER, 
	"PATCH_UID" NUMBER, 
	"PATCH_DESCRIPTOR" "SYS"."XMLTYPE" , 
	"RU_VERSION" VARCHAR2(15 BYTE), 
	"RU_BUILD_DESCRIPTION" VARCHAR2(80 BYTE), 
	"RU_BUILD_TIMESTAMP" TIMESTAMP (6), 
	"PATCH_DIRECTORY" BLOB
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSTEM" 
 XMLTYPE COLUMN "PATCH_DESCRIPTOR" STORE AS BASICFILE CLOB (
  TABLESPACE "SYSTEM" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION 
  NOCACHE LOGGING ) 
 LOB ("PATCH_DIRECTORY") STORE AS BASICFILE (
  TABLESPACE "SYSTEM" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION 
  NOCACHE LOGGING ) ;
