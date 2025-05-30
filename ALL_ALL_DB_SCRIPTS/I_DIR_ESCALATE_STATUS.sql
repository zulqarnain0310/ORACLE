--------------------------------------------------------
--  DDL for Index I_DIR$ESCALATE_STATUS
--------------------------------------------------------

  CREATE INDEX "SYS"."I_DIR$ESCALATE_STATUS" ON "SYS"."DIR$ESCALATE_OPERATIONS" ("STATUS") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
