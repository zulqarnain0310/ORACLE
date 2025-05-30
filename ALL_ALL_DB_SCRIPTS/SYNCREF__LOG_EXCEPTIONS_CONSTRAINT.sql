--------------------------------------------------------
--  Constraints for Table SYNCREF$_LOG_EXCEPTIONS
--------------------------------------------------------

  ALTER TABLE "SYS"."SYNCREF$_LOG_EXCEPTIONS" MODIFY ("TABLE_OBJ#" NOT NULL ENABLE);
  ALTER TABLE "SYS"."SYNCREF$_LOG_EXCEPTIONS" MODIFY ("STAGING_LOG_OBJ#" NOT NULL ENABLE);
  ALTER TABLE "SYS"."SYNCREF$_LOG_EXCEPTIONS" MODIFY ("BAD_ROWID" NOT NULL ENABLE);
