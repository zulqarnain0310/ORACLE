--------------------------------------------------------
--  DDL for Index WRH$_RULE_SET_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."WRH$_RULE_SET_PK" ON "SYS"."WRH$_RULE_SET" ("DBID", "SNAP_ID", "INSTANCE_NUMBER", "OWNER", "NAME", "CON_DBID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
