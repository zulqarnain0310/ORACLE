--------------------------------------------------------
--  DDL for Index WRR$_REPLAY_GROUP_ASSIGNS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."WRR$_REPLAY_GROUP_ASSIGNS_PK" ON "SYS"."WRR$_REPLAY_GROUP_ASSIGNMENTS" ("REPLAY_DIR_NUMBER", "INST_ID", "GID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
