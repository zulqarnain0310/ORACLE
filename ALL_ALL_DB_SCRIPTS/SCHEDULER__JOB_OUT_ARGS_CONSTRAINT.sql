--------------------------------------------------------
--  Constraints for Table SCHEDULER$_JOB_OUT_ARGS
--------------------------------------------------------

  ALTER TABLE "SYS"."SCHEDULER$_JOB_OUT_ARGS" ADD CONSTRAINT "SCHEDULER$_JOB_OUT_ARGS_PK" PRIMARY KEY ("LOG_ID", "ARGUMENT_POSITION")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX"  ENABLE;
