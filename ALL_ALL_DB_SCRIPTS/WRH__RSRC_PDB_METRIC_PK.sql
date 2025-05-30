--------------------------------------------------------
--  DDL for Index WRH$_RSRC_PDB_METRIC_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."WRH$_RSRC_PDB_METRIC_PK" ON "SYS"."WRH$_RSRC_PDB_METRIC" ("DBID", "SNAP_ID", "INSTANCE_NUMBER", "BEGIN_TIME", "SEQUENCE#", "CON_DBID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
