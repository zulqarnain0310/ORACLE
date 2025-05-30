--------------------------------------------------------
--  DDL for Index I_DIR$INSTANCE_JOB_NAME
--------------------------------------------------------

  CREATE INDEX "SYS"."I_DIR$INSTANCE_JOB_NAME" ON "SYS"."DIR$INSTANCE_ACTIONS" ("JOB_NAME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
