--------------------------------------------------------
--  Constraints for Table STREAMS$_CAPTURE_PROCESS
--------------------------------------------------------

  ALTER TABLE "SYS"."STREAMS$_CAPTURE_PROCESS" MODIFY ("QUEUE_OID" NOT NULL ENABLE);
  ALTER TABLE "SYS"."STREAMS$_CAPTURE_PROCESS" MODIFY ("QUEUE_OWNER" NOT NULL ENABLE);
  ALTER TABLE "SYS"."STREAMS$_CAPTURE_PROCESS" MODIFY ("QUEUE_NAME" NOT NULL ENABLE);
  ALTER TABLE "SYS"."STREAMS$_CAPTURE_PROCESS" MODIFY ("CAPTURE#" NOT NULL ENABLE);
  ALTER TABLE "SYS"."STREAMS$_CAPTURE_PROCESS" MODIFY ("CAPTURE_NAME" NOT NULL ENABLE);
