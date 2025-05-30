--------------------------------------------------------
--  DDL for Index I_DIR$ESCALATE_END_TIME
--------------------------------------------------------

  CREATE INDEX "SYS"."I_DIR$ESCALATE_END_TIME" ON "SYS"."DIR$ESCALATE_OPERATIONS" ("END_TIME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
