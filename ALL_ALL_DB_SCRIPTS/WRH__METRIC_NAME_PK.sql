--------------------------------------------------------
--  DDL for Index WRH$_METRIC_NAME_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."WRH$_METRIC_NAME_PK" ON "SYS"."WRH$_METRIC_NAME" ("DBID", "GROUP_ID", "METRIC_ID", "CON_DBID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
