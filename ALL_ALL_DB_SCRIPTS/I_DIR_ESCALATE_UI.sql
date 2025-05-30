--------------------------------------------------------
--  DDL for Index I_DIR$ESCALATE_UI
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."I_DIR$ESCALATE_UI" ON "SYS"."DIR$ESCALATE_OPERATIONS" ("ESCALATION_ID", "STATUS") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
