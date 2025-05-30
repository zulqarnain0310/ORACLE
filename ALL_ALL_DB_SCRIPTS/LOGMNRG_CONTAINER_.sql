--------------------------------------------------------
--  DDL for Table LOGMNRG_CONTAINER$
--------------------------------------------------------

  CREATE TABLE "SYS"."LOGMNRG_CONTAINER$" SHARING=METADATA 
   (	"OBJ#" NUMBER, 
	"CON_ID#" NUMBER, 
	"DBID" NUMBER, 
	"CON_UID" NUMBER, 
	"FLAGS" NUMBER, 
	"STATUS" NUMBER, 
	"VSN" NUMBER, 
	"FED_ROOT_CON_ID#" NUMBER, 
	"CREATE_SCNWRP" NUMBER, 
	"CREATE_SCNBAS" NUMBER
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
