--------------------------------------------------------
--  DDL for Table MD_SCHEMAS
--------------------------------------------------------

  CREATE TABLE "RBL_MISDB_PROD"."MD_SCHEMAS" 
   (	"ID" NUMBER, 
	"CATALOG_ID_FK" NUMBER, 
	"NAME" VARCHAR2(4000 BYTE), 
	"TYPE" CHAR(1 BYTE), 
	"CHARACTER_SET" VARCHAR2(4000 BYTE), 
	"VERSION_TAG" VARCHAR2(40 BYTE), 
	"NATIVE_SQL" CLOB, 
	"NATIVE_KEY" VARCHAR2(4000 BYTE), 
	"COMMENTS" VARCHAR2(4000 BYTE), 
	"SECURITY_GROUP_ID" NUMBER DEFAULT 0, 
	"CREATED_ON" DATE DEFAULT sysdate, 
	"CREATED_BY" VARCHAR2(255 BYTE), 
	"LAST_UPDATED_ON" DATE, 
	"LAST_UPDATED_BY" VARCHAR2(255 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" 
 LOB ("NATIVE_SQL") STORE AS BASICFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION 
  CACHE READS LOGGING ) ;

   COMMENT ON COLUMN "RBL_MISDB_PROD"."MD_SCHEMAS"."ID" IS 'Primary Key';
   COMMENT ON COLUMN "RBL_MISDB_PROD"."MD_SCHEMAS"."CATALOG_ID_FK" IS 'Catalog to which this schema blongs //PARENTFIELD';
   COMMENT ON COLUMN "RBL_MISDB_PROD"."MD_SCHEMAS"."NAME" IS 'Name of the schema //OBJECTNAME';
   COMMENT ON COLUMN "RBL_MISDB_PROD"."MD_SCHEMAS"."TYPE" IS 'Type of this schema.  Eaxamples are ''CAPTURED'' OR ''CONVERTED''';
   COMMENT ON COLUMN "RBL_MISDB_PROD"."MD_SCHEMAS"."CHARACTER_SET" IS 'The characterset of this schema';
   COMMENT ON COLUMN "RBL_MISDB_PROD"."MD_SCHEMAS"."VERSION_TAG" IS 'A version string that can be used for tagging/baseling a schema';
   COMMENT ON COLUMN "RBL_MISDB_PROD"."MD_SCHEMAS"."NATIVE_SQL" IS 'The native SQL used to create this schema';
   COMMENT ON COLUMN "RBL_MISDB_PROD"."MD_SCHEMAS"."NATIVE_KEY" IS 'A unique identifier that this schema is known as in its source state.';
   COMMENT ON TABLE "RBL_MISDB_PROD"."MD_SCHEMAS"  IS 'This is the holder for schemas';
