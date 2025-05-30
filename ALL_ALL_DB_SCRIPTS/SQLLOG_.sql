--------------------------------------------------------
--  DDL for Table SQLLOG$
--------------------------------------------------------

  CREATE TABLE "SYS"."SQLLOG$" SHARING=METADATA 
   (	"SIGNATURE" NUMBER, 
	"BATCH#" NUMBER, 
	 CONSTRAINT "SQLLOG$_PKEY" PRIMARY KEY ("SIGNATURE") ENABLE
   ) ORGANIZATION INDEX NOCOMPRESS PCTFREE 10 INITRANS 2 MAXTRANS 255 LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" 
 PCTTHRESHOLD 50;
