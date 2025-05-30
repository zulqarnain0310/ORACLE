--------------------------------------------------------
--  DDL for Index WRR$_REPLAY_DIRS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."WRR$_REPLAY_DIRS_PK" ON "SYS"."WRR$_REPLAY_DIRECTORY" ("DIRECTORY") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
