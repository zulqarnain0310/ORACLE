--------------------------------------------------------
--  DDL for Index I_DIR$ESCALATE_ALERT_SEQ_ID
--------------------------------------------------------

  CREATE INDEX "SYS"."I_DIR$ESCALATE_ALERT_SEQ_ID" ON "SYS"."DIR$ESCALATE_OPERATIONS" ("ALERT_SEQ_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
