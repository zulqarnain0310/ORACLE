--------------------------------------------------------
--  Constraints for Table STREAMS$_PROCESS_PARAMS
--------------------------------------------------------

  ALTER TABLE "SYS"."STREAMS$_PROCESS_PARAMS" MODIFY ("PROCESS_TYPE" NOT NULL ENABLE);
  ALTER TABLE "SYS"."STREAMS$_PROCESS_PARAMS" MODIFY ("PROCESS#" NOT NULL ENABLE);
  ALTER TABLE "SYS"."STREAMS$_PROCESS_PARAMS" MODIFY ("NAME" NOT NULL ENABLE);
