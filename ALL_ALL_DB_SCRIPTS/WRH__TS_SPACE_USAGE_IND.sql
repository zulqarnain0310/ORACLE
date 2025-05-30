--------------------------------------------------------
--  DDL for Index WRH$_TS_SPACE_USAGE_IND
--------------------------------------------------------

  CREATE INDEX "SYS"."WRH$_TS_SPACE_USAGE_IND" ON "SYS"."WRH$_TABLESPACE_SPACE_USAGE" ("DBID", "SNAP_ID", "TABLESPACE_ID", "CON_DBID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
