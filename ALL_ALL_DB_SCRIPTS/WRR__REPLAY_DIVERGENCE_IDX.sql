--------------------------------------------------------
--  DDL for Index WRR$_REPLAY_DIVERGENCE_IDX
--------------------------------------------------------

  CREATE INDEX "SYS"."WRR$_REPLAY_DIVERGENCE_IDX" ON "SYS"."WRR$_REPLAY_DIVERGENCE" ("FILE_ID", "ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
