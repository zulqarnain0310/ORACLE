--------------------------------------------------------
--  DDL for Index WRI$_ALERT_HISTORY_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."WRI$_ALERT_HISTORY_PK" ON "SYS"."WRI$_ALERT_HISTORY" ("SEQUENCE_ID", "STATE_TRANSITION_NUMBER") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
