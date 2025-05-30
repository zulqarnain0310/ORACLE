--------------------------------------------------------
--  DDL for Table DBFS_HS$_CONTENTFNMAPTBL
--------------------------------------------------------

  CREATE TABLE "SYS"."DBFS_HS$_CONTENTFNMAPTBL" SHARING=METADATA 
   (	"CONTENTFILENAME" VARCHAR2(1024 BYTE), 
	"ARCHIVEREFID" RAW(256)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSAUX" ;
