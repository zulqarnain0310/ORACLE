--------------------------------------------------------
--  DDL for Index I_DIR$MIGRATE_STATUS
--------------------------------------------------------

  CREATE INDEX "SYS"."I_DIR$MIGRATE_STATUS" ON "SYS"."DIR$MIGRATE_OPERATIONS" ("STATUS") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
