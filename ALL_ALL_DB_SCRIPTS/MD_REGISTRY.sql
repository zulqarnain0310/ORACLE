--------------------------------------------------------
--  DDL for Table MD_REGISTRY
--------------------------------------------------------

  CREATE TABLE "SYS"."MD_REGISTRY" 
   (	"OBJECT_TYPE" VARCHAR2(30 BYTE), 
	"OBJECT_NAME" VARCHAR2(30 BYTE), 
	"DESC_OBJECT_NAME" VARCHAR2(30 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;

   COMMENT ON TABLE "SYS"."MD_REGISTRY"  IS 'Table to store information on the MD_ repository.  This lists the objects to be dropped if you wish to remove the repository';
