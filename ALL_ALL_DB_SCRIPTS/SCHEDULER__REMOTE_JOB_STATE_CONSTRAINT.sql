--------------------------------------------------------
--  Constraints for Table SCHEDULER$_REMOTE_JOB_STATE
--------------------------------------------------------

  ALTER TABLE "SYS"."SCHEDULER$_REMOTE_JOB_STATE" ADD CONSTRAINT "SCHEDULER$_RJS_PK" PRIMARY KEY ("JOBOID", "DESTINATION")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM"  ENABLE;
