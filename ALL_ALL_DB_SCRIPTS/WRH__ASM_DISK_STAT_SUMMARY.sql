--------------------------------------------------------
--  DDL for Table WRH$_ASM_DISK_STAT_SUMMARY
--------------------------------------------------------

  CREATE TABLE "SYS"."WRH$_ASM_DISK_STAT_SUMMARY" SHARING=METADATA 
   (	"SNAP_ID" NUMBER, 
	"DBID" NUMBER, 
	"INSTANCE_NUMBER" NUMBER, 
	"GROUP_NUMBER" NUMBER, 
	"READS" NUMBER, 
	"WRITES" NUMBER, 
	"READ_ERRS" NUMBER, 
	"WRITE_ERRS" NUMBER, 
	"READ_TIMEOUT" NUMBER, 
	"WRITE_TIMEOUT" NUMBER, 
	"READ_TIME" NUMBER, 
	"WRITE_TIME" NUMBER, 
	"BYTES_READ" NUMBER, 
	"BYTES_WRITTEN" NUMBER, 
	"CON_DBID" NUMBER, 
	"PER_PDB" NUMBER
   ) PCTFREE 1 PCTUSED 40 INITRANS 1 MAXTRANS 255 
  STORAGE(
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" 
  PARTITION BY RANGE ("DBID","SNAP_ID") 
 (PARTITION "WRH$_ASM_DISK_STAT_SUMMARY_692950692_0"  VALUES LESS THAN (692950692, MAXVALUE) 
  PCTFREE 1 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING 
  STORAGE(
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" , 
 PARTITION "WRH$_ASM_DISK_ST_MXDB_MXSN"  VALUES LESS THAN (MAXVALUE, MAXVALUE) 
  PCTFREE 1 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING 
  STORAGE(
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" )  ENABLE ROW MOVEMENT ;
  GRANT DELETE ON "SYS"."WRH$_ASM_DISK_STAT_SUMMARY" TO "SYSUMF_ROLE";
  GRANT INSERT ON "SYS"."WRH$_ASM_DISK_STAT_SUMMARY" TO "SYSUMF_ROLE";
  GRANT SELECT ON "SYS"."WRH$_ASM_DISK_STAT_SUMMARY" TO "SYSUMF_ROLE";
  GRANT UPDATE ON "SYS"."WRH$_ASM_DISK_STAT_SUMMARY" TO "SYSUMF_ROLE";
