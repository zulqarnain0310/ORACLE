--------------------------------------------------------
--  DDL for Index WRH$_INST_CACHE_TRANSFER_BL_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."WRH$_INST_CACHE_TRANSFER_BL_PK" ON "SYS"."WRH$_INST_CACHE_TRANSFER_BL" ("DBID", "SNAP_ID", "INSTANCE_NUMBER", "INSTANCE", "CLASS", "CON_DBID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
