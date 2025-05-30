--------------------------------------------------------
--  Constraints for Table WRI$_ADV_ADDM_TASKS
--------------------------------------------------------

  ALTER TABLE "SYS"."WRI$_ADV_ADDM_TASKS" MODIFY ("TASK_ID" NOT NULL ENABLE);
  ALTER TABLE "SYS"."WRI$_ADV_ADDM_TASKS" ADD PRIMARY KEY ("TASK_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX"  ENABLE;
