--------------------------------------------------------
--  DDL for Table XS$SECCLS
--------------------------------------------------------

  CREATE TABLE "SYS"."XS$SECCLS" SHARING=METADATA 
   (	"SC#" NUMBER, 
	"CTIME" TIMESTAMP (6), 
	"MTIME" TIMESTAMP (6), 
	"DESCRIPTION" VARCHAR2(4000 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
  GRANT SELECT ON "SYS"."XS$SECCLS" TO "XS_CACHE_ADMIN";
