--------------------------------------------------------
--  DDL for Index WRR$_REPLAY_SEQ_DATA_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."WRR$_REPLAY_SEQ_DATA_PK" ON "SYS"."WRR$_REPLAY_SEQ_DATA" ("SCHEDULE_CAP_ID", "FILE_ID", "CALL_CTR", "RANK", "SEQ_NAME", "SEQ_BNM", "SEQ_BOW") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS NOLOGGING 
  TABLESPACE "SYSAUX" ;
