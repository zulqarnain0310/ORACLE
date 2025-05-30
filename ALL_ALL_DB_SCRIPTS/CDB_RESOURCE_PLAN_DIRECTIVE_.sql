--------------------------------------------------------
--  DDL for Table CDB_RESOURCE_PLAN_DIRECTIVE$
--------------------------------------------------------

  CREATE TABLE "SYS"."CDB_RESOURCE_PLAN_DIRECTIVE$" SHARING=METADATA 
   (	"OBJ#" NUMBER, 
	"CDB_PLAN" VARCHAR2(128 BYTE), 
	"PDB" VARCHAR2(128 BYTE), 
	"DESCRIPTION" VARCHAR2(2000 BYTE), 
	"SHARES" NUMBER, 
	"UTILIZATION_LIMIT" NUMBER, 
	"PARALLEL_SERVER_LIMIT" NUMBER, 
	"STATUS" VARCHAR2(128 BYTE), 
	"MANDATORY" NUMBER, 
	"DIRECTIVE_TYPE" VARCHAR2(30 BYTE), 
	"MEMORY_MIN" NUMBER, 
	"MEMORY_LIMIT" NUMBER
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
