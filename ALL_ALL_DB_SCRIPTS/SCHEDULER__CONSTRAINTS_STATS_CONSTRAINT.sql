--------------------------------------------------------
--  Constraints for Table SCHEDULER$_CONSTRAINTS_STATS
--------------------------------------------------------

  ALTER TABLE "SYS"."SCHEDULER$_CONSTRAINTS_STATS" ADD CONSTRAINT "SCHEDULER$_CONST_STATS_PK" PRIMARY KEY ("OID", "RESOID", "JOBOID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX"  ENABLE;
