--------------------------------------------------------
--  DDL for Index I_DIR$RESONATE_STATUS
--------------------------------------------------------

  CREATE INDEX "SYS"."I_DIR$RESONATE_STATUS" ON "SYS"."DIR$RESONATE_OPERATIONS" ("STATUS") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
