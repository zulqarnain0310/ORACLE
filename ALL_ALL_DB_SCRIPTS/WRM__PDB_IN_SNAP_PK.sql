--------------------------------------------------------
--  DDL for Index WRM$_PDB_IN_SNAP_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."WRM$_PDB_IN_SNAP_PK" ON "SYS"."WRM$_PDB_IN_SNAP" ("DBID", "SNAP_ID", "INSTANCE_NUMBER", "CON_DBID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX"  LOCAL
 (PARTITION "WRM$_PDB_IN_SNAP_692950692_0" NOCOMPRESS 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 LOGGING 
  STORAGE(
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" , 
 PARTITION "WRM$_PDB_IN_SNAP_MXDB_MXSN" NOCOMPRESS 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 LOGGING 
  STORAGE(
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" ) ;
