--------------------------------------------------------
--  Constraints for Table SCHEDULER$_JOB_DESTINATIONS
--------------------------------------------------------

  ALTER TABLE "SYS"."SCHEDULER$_JOB_DESTINATIONS" ADD CONSTRAINT "SCHEDULER$_JOBDEST_PK" PRIMARY KEY ("OID", "JOB_DEST_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM"  ENABLE;
