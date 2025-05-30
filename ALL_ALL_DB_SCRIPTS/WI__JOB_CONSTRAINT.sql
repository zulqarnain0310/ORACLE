--------------------------------------------------------
--  Constraints for Table WI$_JOB
--------------------------------------------------------

  ALTER TABLE "SYS"."WI$_JOB" MODIFY ("JOBID" NOT NULL ENABLE);
  ALTER TABLE "SYS"."WI$_JOB" MODIFY ("JOBNAME" NOT NULL ENABLE);
  ALTER TABLE "SYS"."WI$_JOB" MODIFY ("PATH" NOT NULL ENABLE);
  ALTER TABLE "SYS"."WI$_JOB" ADD CONSTRAINT "WI$_JOB_PK" PRIMARY KEY ("JOBID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX"  ENABLE;
  ALTER TABLE "SYS"."WI$_JOB" ADD CONSTRAINT "WI$_JOB_UK_1" UNIQUE ("JOBNAME")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX"  ENABLE;
