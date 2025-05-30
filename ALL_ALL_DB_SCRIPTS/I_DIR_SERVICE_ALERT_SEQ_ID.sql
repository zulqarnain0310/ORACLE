--------------------------------------------------------
--  DDL for Index I_DIR$SERVICE_ALERT_SEQ_ID
--------------------------------------------------------

  CREATE INDEX "SYS"."I_DIR$SERVICE_ALERT_SEQ_ID" ON "SYS"."DIR$SERVICE_OPERATIONS" ("ALERT_SEQ_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
