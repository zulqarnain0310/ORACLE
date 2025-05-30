--------------------------------------------------------
--  Constraints for Table DST$ERROR_TABLE
--------------------------------------------------------

  ALTER TABLE "SYS"."DST$ERROR_TABLE" MODIFY ("TABLE_OWNER" NOT NULL ENABLE);
  ALTER TABLE "SYS"."DST$ERROR_TABLE" MODIFY ("TABLE_NAME" NOT NULL ENABLE);
  ALTER TABLE "SYS"."DST$ERROR_TABLE" MODIFY ("COLUMN_NAME" NOT NULL ENABLE);
