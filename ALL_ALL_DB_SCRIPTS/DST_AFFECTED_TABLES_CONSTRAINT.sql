--------------------------------------------------------
--  Constraints for Table DST$AFFECTED_TABLES
--------------------------------------------------------

  ALTER TABLE "SYS"."DST$AFFECTED_TABLES" MODIFY ("TABLE_OWNER" NOT NULL ENABLE);
  ALTER TABLE "SYS"."DST$AFFECTED_TABLES" MODIFY ("TABLE_NAME" NOT NULL ENABLE);
  ALTER TABLE "SYS"."DST$AFFECTED_TABLES" MODIFY ("COLUMN_NAME" NOT NULL ENABLE);
