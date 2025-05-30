--------------------------------------------------------
--  DDL for Index WRH$_MEM_DYNAMIC_COMP_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."WRH$_MEM_DYNAMIC_COMP_PK" ON "SYS"."WRH$_MEM_DYNAMIC_COMP" ("DBID", "SNAP_ID", "INSTANCE_NUMBER", "COMPONENT", "CON_DBID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
