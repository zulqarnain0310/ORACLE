--------------------------------------------------------
--  DDL for Index I_DIR$ALERT_HISTORY_REASON_ID
--------------------------------------------------------

  CREATE INDEX "SYS"."I_DIR$ALERT_HISTORY_REASON_ID" ON "SYS"."DIR$ALERT_HISTORY" ("REASON_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
