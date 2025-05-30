--------------------------------------------------------
--  DDL for Index PK_DBMS_PARALLEL_EXECUTE_1
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."PK_DBMS_PARALLEL_EXECUTE_1" ON "SYS"."DBMS_PARALLEL_EXECUTE_TASK$" ("TASK_OWNER#", "TASK_NAME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
