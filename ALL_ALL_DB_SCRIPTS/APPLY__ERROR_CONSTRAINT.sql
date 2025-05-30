--------------------------------------------------------
--  Constraints for Table APPLY$_ERROR
--------------------------------------------------------

  ALTER TABLE "SYS"."APPLY$_ERROR" MODIFY ("QUEUE_OWNER" NOT NULL ENABLE);
  ALTER TABLE "SYS"."APPLY$_ERROR" MODIFY ("QUEUE_NAME" NOT NULL ENABLE);
  ALTER TABLE "SYS"."APPLY$_ERROR" MODIFY ("APPLY#" NOT NULL ENABLE);
