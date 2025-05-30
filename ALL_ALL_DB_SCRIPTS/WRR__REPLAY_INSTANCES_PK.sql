--------------------------------------------------------
--  DDL for Index WRR$_REPLAY_INSTANCES_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."WRR$_REPLAY_INSTANCES_PK" ON "SYS"."WRR$_REPLAY_INSTANCES" ("REPLAY_DIR_NUMBER", "INST_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
