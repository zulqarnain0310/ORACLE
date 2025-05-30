--------------------------------------------------------
--  DDL for Index WRH$_CR_BLOCK_SERVER_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."WRH$_CR_BLOCK_SERVER_PK" ON "SYS"."WRH$_CR_BLOCK_SERVER" ("DBID", "SNAP_ID", "INSTANCE_NUMBER", "CON_DBID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
