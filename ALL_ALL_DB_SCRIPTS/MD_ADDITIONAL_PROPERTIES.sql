--------------------------------------------------------
--  DDL for Table MD_ADDITIONAL_PROPERTIES
--------------------------------------------------------

  CREATE TABLE "SYS"."MD_ADDITIONAL_PROPERTIES" 
   (	"ID" NUMBER, 
	"CONNECTION_ID_FK" NUMBER, 
	"REF_ID_FK" NUMBER, 
	"REF_TYPE" VARCHAR2(4000 BYTE), 
	"PROPERTY_ORDER" NUMBER, 
	"PROP_KEY" VARCHAR2(4000 BYTE), 
	"VALUE" VARCHAR2(4000 BYTE), 
	"SECURITY_GROUP_ID" NUMBER DEFAULT 0, 
	"CREATED_ON" DATE DEFAULT sysdate, 
	"CREATED_BY" VARCHAR2(255 BYTE), 
	"LAST_UPDATED_ON" DATE, 
	"LAST_UPDATED_BY" VARCHAR2(255 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;

   COMMENT ON COLUMN "SYS"."MD_ADDITIONAL_PROPERTIES"."ID" IS 'Primary Key';
   COMMENT ON COLUMN "SYS"."MD_ADDITIONAL_PROPERTIES"."CONNECTION_ID_FK" IS 'Connection to which this belongs //PARENTFIELD';
   COMMENT ON COLUMN "SYS"."MD_ADDITIONAL_PROPERTIES"."REF_ID_FK" IS 'The object to which this property blongs';
   COMMENT ON COLUMN "SYS"."MD_ADDITIONAL_PROPERTIES"."REF_TYPE" IS 'Type of object that this property belongs to';
   COMMENT ON COLUMN "SYS"."MD_ADDITIONAL_PROPERTIES"."PROPERTY_ORDER" IS 'This is to handle a situation where multiple properties have a relevant order, or multiple properties have multiple values';
   COMMENT ON COLUMN "SYS"."MD_ADDITIONAL_PROPERTIES"."PROP_KEY" IS 'The keyname for this property';
   COMMENT ON COLUMN "SYS"."MD_ADDITIONAL_PROPERTIES"."VALUE" IS 'The value for this property';
   COMMENT ON TABLE "SYS"."MD_ADDITIONAL_PROPERTIES"  IS 'This table is used to store additional properties in key-value pairs.  It is designed to store "other information" that is not supported in the main database object table.';
