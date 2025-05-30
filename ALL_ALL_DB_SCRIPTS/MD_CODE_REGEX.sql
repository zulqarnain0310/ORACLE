--------------------------------------------------------
--  DDL for Table MD_CODE_REGEX
--------------------------------------------------------

  CREATE TABLE "SYS"."MD_CODE_REGEX" 
   (	"ID" NUMBER, 
	"REGEX" VARCHAR2(100 BYTE), 
	"DESCRIPTION" VARCHAR2(200 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;

   COMMENT ON COLUMN "SYS"."MD_CODE_REGEX"."ID" IS 'ID of regex for searching source code';
   COMMENT ON COLUMN "SYS"."MD_CODE_REGEX"."REGEX" IS 'Regex to use in reports of artifiacts in code.  This will be used for customers to analyze what is in their code.';
