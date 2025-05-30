--------------------------------------------------------
--  DDL for Index I_DIR$ALERT_HISTORY_ACTION_ID
--------------------------------------------------------

  CREATE INDEX "SYS"."I_DIR$ALERT_HISTORY_ACTION_ID" ON "SYS"."DIR$ALERT_HISTORY" ("ACTION_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
