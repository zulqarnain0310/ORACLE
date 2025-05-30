--------------------------------------------------------
--  DDL for Index PK_TASKID
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."PK_TASKID" ON "SYS"."ILM_EXECUTION$" ("EXECUTION_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
