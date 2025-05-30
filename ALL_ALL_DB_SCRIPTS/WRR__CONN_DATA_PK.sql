--------------------------------------------------------
--  DDL for Index WRR$_CONN_DATA_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."WRR$_CONN_DATA_PK" ON "SYS"."WRR$_REPLAY_CONN_DATA" ("CONN_ID", "SLAVE_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
