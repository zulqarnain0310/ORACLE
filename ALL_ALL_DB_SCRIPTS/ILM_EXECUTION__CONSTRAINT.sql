--------------------------------------------------------
--  Constraints for Table ILM_EXECUTION$
--------------------------------------------------------

  ALTER TABLE "SYS"."ILM_EXECUTION$" ADD CONSTRAINT "PK_TASKID" PRIMARY KEY ("EXECUTION_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX"  ENABLE;
