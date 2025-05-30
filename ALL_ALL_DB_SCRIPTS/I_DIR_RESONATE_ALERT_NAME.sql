--------------------------------------------------------
--  DDL for Index I_DIR$RESONATE_ALERT_NAME
--------------------------------------------------------

  CREATE INDEX "SYS"."I_DIR$RESONATE_ALERT_NAME" ON "SYS"."DIR$RESONATE_OPERATIONS" ("ALERT_NAME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
