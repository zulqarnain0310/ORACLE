--------------------------------------------------------
--  DDL for Index I_DIR$ALERT_HISTORY_AT
--------------------------------------------------------

  CREATE INDEX "SYS"."I_DIR$ALERT_HISTORY_AT" ON "SYS"."DIR$ALERT_HISTORY" ("ACTION_TIME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
