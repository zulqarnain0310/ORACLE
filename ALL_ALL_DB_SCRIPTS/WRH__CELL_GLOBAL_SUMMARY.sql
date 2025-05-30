--------------------------------------------------------
--  DDL for Table WRH$_CELL_GLOBAL_SUMMARY
--------------------------------------------------------

  CREATE TABLE "SYS"."WRH$_CELL_GLOBAL_SUMMARY" SHARING=METADATA 
   (	"SNAP_ID" NUMBER, 
	"DBID" NUMBER, 
	"CELL_HASH" NUMBER, 
	"INCARNATION_NUM" NUMBER, 
	"CON_DBID" NUMBER DEFAULT 0, 
	"NUM_SAMPLES" NUMBER, 
	"CPU_USAGE_SUM" NUMBER, 
	"SYS_USAGE_SUM" NUMBER, 
	"USER_USAGE_SUM" NUMBER, 
	"NETWORK_BYTES_RECD_SUM" NUMBER, 
	"NETWORK_BYTES_SENT_SUM" NUMBER, 
	"CPU_USAGE_SUMX2" NUMBER, 
	"SYS_USAGE_SUMX2" NUMBER, 
	"USER_USAGE_SUMX2" NUMBER, 
	"NETWORK_BYTES_RECD_SUMX2" NUMBER, 
	"NETWORK_BYTES_SENT_SUMX2" NUMBER, 
	"PER_PDB" NUMBER DEFAULT null
   ) PCTFREE 1 PCTUSED 40 INITRANS 1 MAXTRANS 255 
  STORAGE(
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" 
  PARTITION BY RANGE ("DBID","SNAP_ID") 
 (PARTITION "WRH$_CELL_GLOBAL_SUMMARY_692950692_0"  VALUES LESS THAN (692950692, MAXVALUE) 
  PCTFREE 1 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING 
  STORAGE(
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" , 
 PARTITION "WRH$_CELL_GLOB_SUMM_MXDB_MXSN"  VALUES LESS THAN (MAXVALUE, MAXVALUE) 
  PCTFREE 1 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING 
  STORAGE(
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" )  ENABLE ROW MOVEMENT ;
  GRANT DELETE ON "SYS"."WRH$_CELL_GLOBAL_SUMMARY" TO "SYSUMF_ROLE";
  GRANT INSERT ON "SYS"."WRH$_CELL_GLOBAL_SUMMARY" TO "SYSUMF_ROLE";
  GRANT SELECT ON "SYS"."WRH$_CELL_GLOBAL_SUMMARY" TO "SYSUMF_ROLE";
  GRANT UPDATE ON "SYS"."WRH$_CELL_GLOBAL_SUMMARY" TO "SYSUMF_ROLE";
