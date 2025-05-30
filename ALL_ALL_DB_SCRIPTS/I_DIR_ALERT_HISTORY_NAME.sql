--------------------------------------------------------
--  DDL for Index I_DIR$ALERT_HISTORY_NAME
--------------------------------------------------------

  CREATE INDEX "SYS"."I_DIR$ALERT_HISTORY_NAME" ON "SYS"."DIR$ALERT_HISTORY" ("ALERT_NAME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
