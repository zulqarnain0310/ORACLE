--------------------------------------------------------
--  Ref Constraints for Table DBMS_PARALLEL_EXECUTE_CHUNKS$
--------------------------------------------------------

  ALTER TABLE "SYS"."DBMS_PARALLEL_EXECUTE_CHUNKS$" ADD CONSTRAINT "FK_DBMS_PARALLEL_EXECUTE_1" FOREIGN KEY ("TASK_OWNER#", "TASK_NAME")
	  REFERENCES "SYS"."DBMS_PARALLEL_EXECUTE_TASK$" ("TASK_OWNER#", "TASK_NAME") ON DELETE CASCADE ENABLE;
