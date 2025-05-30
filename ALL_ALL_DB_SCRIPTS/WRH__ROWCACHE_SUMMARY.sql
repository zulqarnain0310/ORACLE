--------------------------------------------------------
--  DDL for Table WRH$_ROWCACHE_SUMMARY
--------------------------------------------------------

  CREATE TABLE "SYS"."WRH$_ROWCACHE_SUMMARY" SHARING=METADATA 
   (	"SNAP_ID" NUMBER, 
	"DBID" NUMBER, 
	"INSTANCE_NUMBER" NUMBER, 
	"PARAMETER" VARCHAR2(32 BYTE), 
	"TOTAL_USAGE" NUMBER, 
	"USAGE" NUMBER, 
	"GETS" NUMBER, 
	"GETMISSES" NUMBER, 
	"SCANS" NUMBER, 
	"SCANMISSES" NUMBER, 
	"SCANCOMPLETES" NUMBER, 
	"MODIFICATIONS" NUMBER, 
	"FLUSHES" NUMBER, 
	"DLM_REQUESTS" NUMBER, 
	"DLM_CONFLICTS" NUMBER, 
	"DLM_RELEASES" NUMBER, 
	"CON_DBID" NUMBER DEFAULT 0, 
	"PER_PDB" NUMBER DEFAULT null
   ) PCTFREE 1 PCTUSED 40 INITRANS 1 MAXTRANS 255 
  STORAGE(
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" 
  PARTITION BY RANGE ("DBID","SNAP_ID") 
 (PARTITION "WRH$_ROWCACHE_SUMMARY_692950692_0"  VALUES LESS THAN (692950692, MAXVALUE) 
  PCTFREE 1 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING 
  STORAGE(
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" , 
 PARTITION "WRH$_ROWCACHE_SU_MXDB_MXSN"  VALUES LESS THAN (MAXVALUE, MAXVALUE) 
  PCTFREE 1 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING 
  STORAGE(
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" )  ENABLE ROW MOVEMENT ;
  GRANT DELETE ON "SYS"."WRH$_ROWCACHE_SUMMARY" TO "SYSUMF_ROLE";
  GRANT INSERT ON "SYS"."WRH$_ROWCACHE_SUMMARY" TO "SYSUMF_ROLE";
  GRANT SELECT ON "SYS"."WRH$_ROWCACHE_SUMMARY" TO "SYSUMF_ROLE";
  GRANT UPDATE ON "SYS"."WRH$_ROWCACHE_SUMMARY" TO "SYSUMF_ROLE";
