--------------------------------------------------------
--  DDL for Table HEAT_MAP_EXTENT_STAT$
--------------------------------------------------------

  CREATE TABLE "SYS"."HEAT_MAP_EXTENT_STAT$" SHARING=METADATA 
   (	"OBJ#" NUMBER, 
	"DATAOBJ#" NUMBER, 
	"TRACK_TIME" DATE, 
	"EXTENT_DBA" NUMBER, 
	"EXTENT_BLOCKS" NUMBER, 
	"EXTENT_ACCESS" NUMBER, 
	"FLAG" NUMBER, 
	"ROWMAP_SIZE" NUMBER, 
	"ROWMAP_BLOCK" NUMBER, 
	"ROWMAP" BLOB, 
	"SPARE1" NUMBER, 
	"SPARE2" NUMBER, 
	"SPARE3" VARCHAR2(1000 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSAUX" 
 LOB ("ROWMAP") STORE AS SECUREFILE (
  TABLESPACE "SYSAUX" ENABLE STORAGE IN ROW CHUNK 8192
  NOCACHE LOGGING  NOCOMPRESS  KEEP_DUPLICATES ) ;
