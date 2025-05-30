--------------------------------------------------------
--  DDL for Index WRH$_CLUSTER_INTERCON_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."WRH$_CLUSTER_INTERCON_PK" ON "SYS"."WRH$_CLUSTER_INTERCON" ("DBID", "SNAP_ID", "INSTANCE_NUMBER", "NAME", "IP_ADDRESS", "CON_DBID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
