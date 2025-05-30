--------------------------------------------------------
--  DDL for Table SNAP_OBJCOL$
--------------------------------------------------------

  CREATE TABLE "SYS"."SNAP_OBJCOL$" SHARING=METADATA 
   (	"SOWNER" VARCHAR2(128 BYTE), 
	"VNAME" VARCHAR2(128 BYTE), 
	"INSTSITE" NUMBER(*,0) DEFAULT 0, 
	"TABNUM" NUMBER(*,0), 
	"SNACOL" VARCHAR2(128 BYTE), 
	"MASCOL" VARCHAR2(128 BYTE), 
	"FLAG" NUMBER, 
	"STORAGE_TAB_OWNER" VARCHAR2(128 BYTE), 
	"STORAGE_TAB_NAME" VARCHAR2(128 BYTE), 
	"SNA_TYPE_OID" RAW(16), 
	"SNA_TYPE_HASHCODE" RAW(17), 
	"SNA_TYPE_OWNER" VARCHAR2(128 BYTE), 
	"SNA_TYPE_NAME" VARCHAR2(128 BYTE), 
	"MAS_TYPE_OID" RAW(16), 
	"MAS_TYPE_HASHCODE" RAW(17), 
	"MAS_TYPE_OWNER" VARCHAR2(128 BYTE), 
	"MAS_TYPE_NAME" VARCHAR2(128 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSTEM" ;
