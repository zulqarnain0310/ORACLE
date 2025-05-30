--------------------------------------------------------
--  DDL for Table WRHS$_SEG_STAT_OBJ
--------------------------------------------------------

  CREATE TABLE "SYS"."WRHS$_SEG_STAT_OBJ" SHARING=METADATA 
   (	"SNAP_ID" NUMBER, 
	"DBID" NUMBER, 
	"TS#" NUMBER, 
	"OBJ#" NUMBER, 
	"DATAOBJ#" NUMBER, 
	"OWNER" VARCHAR2(128 BYTE), 
	"OBJECT_NAME" VARCHAR2(128 BYTE), 
	"SUBOBJECT_NAME" VARCHAR2(128 BYTE), 
	"PARTITION_TYPE" VARCHAR2(8 BYTE), 
	"OBJECT_TYPE" VARCHAR2(18 BYTE), 
	"TABLESPACE_NAME" VARCHAR2(30 BYTE), 
	"INDEX_TYPE" VARCHAR2(27 BYTE), 
	"BASE_OBJ#" NUMBER, 
	"BASE_OBJECT_NAME" VARCHAR2(128 BYTE), 
	"BASE_OBJECT_OWNER" VARCHAR2(128 BYTE), 
	"CON_DBID" NUMBER, 
	"PER_PDB" NUMBER, 
	"STAGE_INST_ID" NUMBER, 
	"STAGE_ID" NUMBER
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSTEM" ;
  GRANT DELETE ON "SYS"."WRHS$_SEG_STAT_OBJ" TO "SYSUMF_ROLE";
  GRANT INSERT ON "SYS"."WRHS$_SEG_STAT_OBJ" TO "SYSUMF_ROLE";
  GRANT SELECT ON "SYS"."WRHS$_SEG_STAT_OBJ" TO "SYSUMF_ROLE";
  GRANT UPDATE ON "SYS"."WRHS$_SEG_STAT_OBJ" TO "SYSUMF_ROLE";
