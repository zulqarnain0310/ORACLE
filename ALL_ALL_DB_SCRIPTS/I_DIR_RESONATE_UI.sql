--------------------------------------------------------
--  DDL for Index I_DIR$RESONATE_UI
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."I_DIR$RESONATE_UI" ON "SYS"."DIR$RESONATE_OPERATIONS" ("JOB_NAME", "STATUS") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
