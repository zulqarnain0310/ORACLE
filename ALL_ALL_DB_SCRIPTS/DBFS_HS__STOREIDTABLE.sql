--------------------------------------------------------
--  DDL for Table DBFS_HS$_STOREIDTABLE
--------------------------------------------------------

  CREATE TABLE "SYS"."DBFS_HS$_STOREIDTABLE" SHARING=METADATA 
   (	"STORENAME" VARCHAR2(256 BYTE), 
	"STOREOWNER" VARCHAR2(64 BYTE), 
	"STOREID" NUMBER
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSAUX" ;
