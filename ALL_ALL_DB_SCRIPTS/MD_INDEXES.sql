--------------------------------------------------------
--  DDL for Table MD_INDEXES
--------------------------------------------------------

  CREATE TABLE "SYS"."MD_INDEXES" 
   (	"ID" NUMBER, 
	"INDEX_TYPE" VARCHAR2(4000 BYTE), 
	"TABLE_ID_FK" NUMBER, 
	"INDEX_NAME" VARCHAR2(4000 BYTE), 
	"NATIVE_SQL" CLOB, 
	"NATIVE_KEY" VARCHAR2(4000 BYTE), 
	"COMMENTS" VARCHAR2(4000 BYTE), 
	"SECURITY_GROUP_ID" NUMBER DEFAULT 0, 
	"CREATED_ON" DATE DEFAULT sysdate, 
	"CREATED_BY" VARCHAR2(255 BYTE), 
	"LAST_UPDATED_ON" DATE, 
	"LAST_UPDATED_BY" VARCHAR2(4000 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" 
 LOB ("NATIVE_SQL") STORE AS BASICFILE (
  TABLESPACE "SYSTEM" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION 
  CACHE READS LOGGING 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)) ;

   COMMENT ON COLUMN "SYS"."MD_INDEXES"."ID" IS 'Primary Key';
   COMMENT ON COLUMN "SYS"."MD_INDEXES"."INDEX_TYPE" IS 'Type of the index e.g. PRIMARY';
   COMMENT ON COLUMN "SYS"."MD_INDEXES"."TABLE_ID_FK" IS 'Table that this index is on //PARENTFIELD';
   COMMENT ON COLUMN "SYS"."MD_INDEXES"."INDEX_NAME" IS 'Name of the index //OBJECTNAME';
   COMMENT ON COLUMN "SYS"."MD_INDEXES"."NATIVE_SQL" IS 'SQL used to create the index at source';
   COMMENT ON COLUMN "SYS"."MD_INDEXES"."NATIVE_KEY" IS 'A unique identifier for this object at the source';
   COMMENT ON TABLE "SYS"."MD_INDEXES"  IS 'This table is used to store information about the indexes in a schema';
