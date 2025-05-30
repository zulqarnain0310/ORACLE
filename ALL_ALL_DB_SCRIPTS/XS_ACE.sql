--------------------------------------------------------
--  DDL for Table XS$ACE
--------------------------------------------------------

  CREATE TABLE "SYS"."XS$ACE" SHARING=METADATA 
   (	"ACL#" NUMBER, 
	"ORDER#" NUMBER, 
	"ACE_TYPE" NUMBER DEFAULT 1, 
	"PRIN#" NUMBER, 
	"PRIN_TYPE" NUMBER, 
	"PRIN_INVERT" NUMBER DEFAULT 0, 
	"START_DATE" TIMESTAMP (6), 
	"END_DATE" TIMESTAMP (6), 
	"ACE_FLAG" NUMBER DEFAULT 0
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
  GRANT SELECT ON "SYS"."XS$ACE" TO "XS_CACHE_ADMIN";
