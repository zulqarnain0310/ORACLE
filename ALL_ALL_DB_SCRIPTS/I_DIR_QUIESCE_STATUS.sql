--------------------------------------------------------
--  DDL for Index I_DIR$QUIESCE_STATUS
--------------------------------------------------------

  CREATE INDEX "SYS"."I_DIR$QUIESCE_STATUS" ON "SYS"."DIR$QUIESCE_OPERATIONS" ("STATUS") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
