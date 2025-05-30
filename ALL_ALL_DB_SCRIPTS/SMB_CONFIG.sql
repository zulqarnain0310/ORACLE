--------------------------------------------------------
--  DDL for Table SMB$CONFIG
--------------------------------------------------------

  CREATE TABLE "SYS"."SMB$CONFIG" SHARING=METADATA 
   (	"PARAMETER_NAME" VARCHAR2(128 BYTE), 
	"PARAMETER_VALUE" NUMBER, 
	"LAST_UPDATED" TIMESTAMP (6), 
	"UPDATED_BY" VARCHAR2(128 BYTE), 
	"PARAMETER_DATA" CLOB
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" 
 LOB ("PARAMETER_DATA") STORE AS SECUREFILE (
  TABLESPACE "SYSAUX" ENABLE STORAGE IN ROW CHUNK 8192
  NOCACHE LOGGING  NOCOMPRESS  KEEP_DUPLICATES 
  STORAGE(INITIAL 106496 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)) ;
