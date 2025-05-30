--------------------------------------------------------
--  DDL for Index I_SQLOBJ$AUXDATA_TASK
--------------------------------------------------------

  CREATE INDEX "SYS"."I_SQLOBJ$AUXDATA_TASK" ON "SYS"."SQLOBJ$AUXDATA" ("TASK_ID", "TASK_EXEC_NAME", "TASK_OBJ_ID", "TASK_FND_ID", "TASK_REC_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
