--------------------------------------------------------
--  Constraints for Table STREAMS$_APPLY_SPILL_MSGS_PART
--------------------------------------------------------

  ALTER TABLE "SYS"."STREAMS$_APPLY_SPILL_MSGS_PART" MODIFY ("TXNKEY" NOT NULL ENABLE);
  ALTER TABLE "SYS"."STREAMS$_APPLY_SPILL_MSGS_PART" MODIFY ("SEQUENCE" NOT NULL ENABLE);
