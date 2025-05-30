--------------------------------------------------------
--  DDL for Index WRH$_RSRC_PLAN_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."WRH$_RSRC_PLAN_PK" ON "SYS"."WRH$_RSRC_PLAN" ("DBID", "SNAP_ID", "INSTANCE_NUMBER", "SEQUENCE#", "CON_DBID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
