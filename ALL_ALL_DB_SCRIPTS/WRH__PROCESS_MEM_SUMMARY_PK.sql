--------------------------------------------------------
--  DDL for Index WRH$_PROCESS_MEM_SUMMARY_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."WRH$_PROCESS_MEM_SUMMARY_PK" ON "SYS"."WRH$_PROCESS_MEMORY_SUMMARY" ("DBID", "SNAP_ID", "INSTANCE_NUMBER", "CATEGORY", "CON_DBID", "PER_PDB_NN") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
