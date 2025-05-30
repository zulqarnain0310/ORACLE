--------------------------------------------------------
--  DDL for Index WRR$_WORKLOAD_GROUPS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."WRR$_WORKLOAD_GROUPS_PK" ON "SYS"."WRR$_WORKLOAD_GROUPS" ("GID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
