--------------------------------------------------------
--  DDL for Index I_DIR$MIGRATE_UI
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."I_DIR$MIGRATE_UI" ON "SYS"."DIR$MIGRATE_OPERATIONS" ("JOB_NAME", "STATUS") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
