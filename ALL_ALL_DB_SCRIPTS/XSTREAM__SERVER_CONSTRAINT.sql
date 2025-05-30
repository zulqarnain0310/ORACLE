--------------------------------------------------------
--  Constraints for Table XSTREAM$_SERVER
--------------------------------------------------------

  ALTER TABLE "SYS"."XSTREAM$_SERVER" MODIFY ("SERVER_NAME" NOT NULL ENABLE);
  ALTER TABLE "SYS"."XSTREAM$_SERVER" MODIFY ("QUEUE_OWNER" NOT NULL ENABLE);
  ALTER TABLE "SYS"."XSTREAM$_SERVER" MODIFY ("QUEUE_NAME" NOT NULL ENABLE);
