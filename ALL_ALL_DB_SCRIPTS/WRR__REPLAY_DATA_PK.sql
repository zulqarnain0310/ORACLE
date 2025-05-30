--------------------------------------------------------
--  DDL for Index WRR$_REPLAY_DATA_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."WRR$_REPLAY_DATA_PK" ON "SYS"."WRR$_REPLAY_DATA" ("FILE_ID", "CALL_CTR", "RANK", "DATA_TYPE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS NOLOGGING 
  TABLESPACE "SYSAUX" ;
