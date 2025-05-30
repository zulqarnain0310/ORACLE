--------------------------------------------------------
--  DDL for Index WRH$_OSSTAT_NAME_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."WRH$_OSSTAT_NAME_PK" ON "SYS"."WRH$_OSSTAT_NAME" ("DBID", "STAT_ID", "CON_DBID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
