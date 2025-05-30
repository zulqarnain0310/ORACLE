--------------------------------------------------------
--  DDL for Index I_DIR$QUIESCE_UI
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."I_DIR$QUIESCE_UI" ON "SYS"."DIR$QUIESCE_OPERATIONS" ("JOB_NAME", "STATUS") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
