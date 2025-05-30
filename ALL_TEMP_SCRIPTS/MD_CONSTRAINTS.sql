--------------------------------------------------------
--  DDL for Table MD_CONSTRAINTS
--------------------------------------------------------

  CREATE TABLE "RBL_TEMPDB"."MD_CONSTRAINTS" 
   (	"ID" NUMBER, 
	"DELETE_CLAUSE" VARCHAR2(4000 BYTE), 
	"NAME" VARCHAR2(4000 BYTE), 
	"CONSTRAINT_TYPE" VARCHAR2(4000 BYTE), 
	"TABLE_ID_FK" NUMBER, 
	"REFTABLE_ID_FK" NUMBER, 
	"CONSTRAINT_TEXT" CLOB, 
	"LANGUAGE" VARCHAR2(40 BYTE), 
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
 LOB ("CONSTRAINT_TEXT") STORE AS BASICFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION 
  CACHE READS LOGGING ) ;

   COMMENT ON COLUMN "RBL_TEMPDB"."MD_CONSTRAINTS"."ID" IS 'Primary Key';
   COMMENT ON COLUMN "RBL_TEMPDB"."MD_CONSTRAINTS"."DELETE_CLAUSE" IS 'delete option , can be either CASCADE, RESTRICT or NULL';
   COMMENT ON COLUMN "RBL_TEMPDB"."MD_CONSTRAINTS"."NAME" IS 'Name of the constraint //OBJECTNAME';
   COMMENT ON COLUMN "RBL_TEMPDB"."MD_CONSTRAINTS"."CONSTRAINT_TYPE" IS 'Type of the constraint (e.g. CHECK)';
   COMMENT ON COLUMN "RBL_TEMPDB"."MD_CONSTRAINTS"."TABLE_ID_FK" IS 'Table on which this constraint exists //PARENTFIELD';
   COMMENT ON COLUMN "RBL_TEMPDB"."MD_CONSTRAINTS"."REFTABLE_ID_FK" IS 'Used in foreign keys - this gives the table that we refer to.';
   COMMENT ON COLUMN "RBL_TEMPDB"."MD_CONSTRAINTS"."CONSTRAINT_TEXT" IS 'The text of the constraint';
   COMMENT ON COLUMN "RBL_TEMPDB"."MD_CONSTRAINTS"."LANGUAGE" IS '//PUBLIC';
   COMMENT ON TABLE "RBL_TEMPDB"."MD_CONSTRAINTS"  IS 'Table for storing information about a constraint';
