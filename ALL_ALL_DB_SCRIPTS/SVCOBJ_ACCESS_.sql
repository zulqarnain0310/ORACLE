--------------------------------------------------------
--  DDL for Table SVCOBJ_ACCESS$
--------------------------------------------------------

  CREATE TABLE "SYS"."SVCOBJ_ACCESS$" SHARING=METADATA 
   (	"NAME" VARCHAR2(64 BYTE), 
	"PDB" NUMBER, 
	"TSN" NUMBER, 
	"OBJID" NUMBER, 
	"ACCESSES" NUMBER, 
	"INC_NO" NUMBER, 
	 CONSTRAINT "IDX1_SVCOBJ_ACCESS$" PRIMARY KEY ("NAME", "PDB", "TSN", "OBJID") ENABLE
   ) ORGANIZATION INDEX NOCOMPRESS PCTFREE 10 INITRANS 2 MAXTRANS 255 LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" 
 PCTTHRESHOLD 50;
