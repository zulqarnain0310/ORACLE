--------------------------------------------------------
--  DDL for Table WRH$_CELL_DB
--------------------------------------------------------

  CREATE TABLE "SYS"."WRH$_CELL_DB" SHARING=METADATA 
   (	"SNAP_ID" NUMBER, 
	"DBID" NUMBER, 
	"CELL_HASH" NUMBER, 
	"INCARNATION_NUM" NUMBER, 
	"CON_DBID" NUMBER DEFAULT 0, 
	"SRC_DBID" NUMBER, 
	"SRC_DBNAME" VARCHAR2(256 BYTE), 
	"DISK_REQUESTS" NUMBER, 
	"DISK_BYTES" NUMBER, 
	"FLASH_REQUESTS" NUMBER, 
	"FLASH_BYTES" NUMBER, 
	"DISK_SMALL_IO_REQS" NUMBER, 
	"DISK_LARGE_IO_REQS" NUMBER, 
	"FLASH_SMALL_IO_REQS" NUMBER, 
	"FLASH_LARGE_IO_REQS" NUMBER, 
	"DISK_SMALL_IO_SERVICE_TIME" NUMBER, 
	"DISK_SMALL_IO_QUEUE_TIME" NUMBER, 
	"DISK_LARGE_IO_SERVICE_TIME" NUMBER, 
	"DISK_LARGE_IO_QUEUE_TIME" NUMBER, 
	"FLASH_SMALL_IO_SERVICE_TIME" NUMBER, 
	"FLASH_SMALL_IO_QUEUE_TIME" NUMBER, 
	"FLASH_LARGE_IO_SERVICE_TIME" NUMBER, 
	"FLASH_LARGE_IO_QUEUE_TIME" NUMBER, 
	"PER_PDB" NUMBER DEFAULT null, 
	"IS_CURRENT_SRC_DB" NUMBER DEFAULT null
   ) PCTFREE 1 PCTUSED 40 INITRANS 1 MAXTRANS 255 
  STORAGE(
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" 
  PARTITION BY RANGE ("DBID","SNAP_ID") 
 (PARTITION "WRH$_CELL_DB_692950692_0"  VALUES LESS THAN (692950692, MAXVALUE) 
  PCTFREE 1 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING 
  STORAGE(
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" , 
 PARTITION "WRH$_CELL_DB_MXDB_MXSN"  VALUES LESS THAN (MAXVALUE, MAXVALUE) 
  PCTFREE 1 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING 
  STORAGE(
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" )  ENABLE ROW MOVEMENT ;
  GRANT DELETE ON "SYS"."WRH$_CELL_DB" TO "SYSUMF_ROLE";
  GRANT INSERT ON "SYS"."WRH$_CELL_DB" TO "SYSUMF_ROLE";
  GRANT SELECT ON "SYS"."WRH$_CELL_DB" TO "SYSUMF_ROLE";
  GRANT UPDATE ON "SYS"."WRH$_CELL_DB" TO "SYSUMF_ROLE";
