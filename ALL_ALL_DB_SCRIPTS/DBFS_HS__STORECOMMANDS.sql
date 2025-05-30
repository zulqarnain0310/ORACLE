--------------------------------------------------------
--  DDL for Table DBFS_HS$_STORECOMMANDS
--------------------------------------------------------

  CREATE TABLE "SYS"."DBFS_HS$_STORECOMMANDS" SHARING=METADATA 
   (	"STOREID" NUMBER, 
	"STORECOMMAND" VARCHAR2(512 BYTE), 
	"STOREFLAGS" NUMBER
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSAUX" ;
