--------------------------------------------------------
--  DDL for Index I_DBMS_PARALLEL_EXECUTE_CHUNKS
--------------------------------------------------------

  CREATE INDEX "SYS"."I_DBMS_PARALLEL_EXECUTE_CHUNKS" ON "SYS"."DBMS_PARALLEL_EXECUTE_CHUNKS$" ("TASK_OWNER#", "TASK_NAME", "STATUS") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
