--------------------------------------------------------
--  DDL for Index WRR$_REPLAY_FILTER_SET_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."WRR$_REPLAY_FILTER_SET_PK" ON "SYS"."WRR$_REPLAY_FILTER_SET" ("CAPTURE_ID", "SET_NAME", "FILTER_NAME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
