--------------------------------------------------------
--  Constraints for Table STREAMS$_APPLY_SPILL_TXN
--------------------------------------------------------

  ALTER TABLE "SYS"."STREAMS$_APPLY_SPILL_TXN" MODIFY ("APPLYNAME" NOT NULL ENABLE);
  ALTER TABLE "SYS"."STREAMS$_APPLY_SPILL_TXN" MODIFY ("XIDUSN" NOT NULL ENABLE);
  ALTER TABLE "SYS"."STREAMS$_APPLY_SPILL_TXN" MODIFY ("XIDSLT" NOT NULL ENABLE);
  ALTER TABLE "SYS"."STREAMS$_APPLY_SPILL_TXN" MODIFY ("XIDSQN" NOT NULL ENABLE);
  ALTER TABLE "SYS"."STREAMS$_APPLY_SPILL_TXN" MODIFY ("FIRST_SCN" NOT NULL ENABLE);
