--------------------------------------------------------
--  DDL for Index WRR$_CONNECTION_MAP_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."WRR$_CONNECTION_MAP_PK" ON "SYS"."WRR$_CONNECTION_MAP" ("REPLAY_ID", "CONN_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
