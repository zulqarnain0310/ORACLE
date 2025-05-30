--------------------------------------------------------
--  Constraints for Table STREAMS$_APPLY_SPILL_MESSAGES
--------------------------------------------------------

  ALTER TABLE "SYS"."STREAMS$_APPLY_SPILL_MESSAGES" MODIFY ("TXNKEY" NOT NULL ENABLE);
  ALTER TABLE "SYS"."STREAMS$_APPLY_SPILL_MESSAGES" MODIFY ("SEQUENCE" NOT NULL ENABLE);
