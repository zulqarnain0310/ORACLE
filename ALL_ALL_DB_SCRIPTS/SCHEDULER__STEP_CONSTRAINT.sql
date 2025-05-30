--------------------------------------------------------
--  Constraints for Table SCHEDULER$_STEP
--------------------------------------------------------

  ALTER TABLE "SYS"."SCHEDULER$_STEP" MODIFY ("OID" NOT NULL ENABLE);
  ALTER TABLE "SYS"."SCHEDULER$_STEP" MODIFY ("VAR_NAME" NOT NULL ENABLE);
  ALTER TABLE "SYS"."SCHEDULER$_STEP" MODIFY ("FLAGS" NOT NULL ENABLE);
