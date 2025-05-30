--------------------------------------------------------
--  DDL for Index I_DIR$SERVICE_UI
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."I_DIR$SERVICE_UI" ON "SYS"."DIR$SERVICE_OPERATIONS" ("JOB_NAME", "STATUS") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
