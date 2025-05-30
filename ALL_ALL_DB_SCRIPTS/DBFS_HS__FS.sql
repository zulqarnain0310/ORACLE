--------------------------------------------------------
--  DDL for Table DBFS_HS$_FS
--------------------------------------------------------

  CREATE TABLE "SYS"."DBFS_HS$_FS" SHARING=METADATA 
   (	"STORE_OWNER" VARCHAR2(128 BYTE), 
	"STORE_NAME" VARCHAR2(128 BYTE), 
	"VERSION#" NUMBER(*,0)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSAUX" ;
  GRANT SELECT ON "SYS"."DBFS_HS$_FS" TO "DBFS_ROLE";
