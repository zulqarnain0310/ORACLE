--------------------------------------------------------
--  Constraints for Table DBA_SENSITIVE_DATA_TBL
--------------------------------------------------------

  ALTER TABLE "SYS"."DBA_SENSITIVE_DATA_TBL" MODIFY ("SENSITIVE#" NOT NULL ENABLE);
  ALTER TABLE "SYS"."DBA_SENSITIVE_DATA_TBL" MODIFY ("SCHEMA_NAME" NOT NULL ENABLE);
  ALTER TABLE "SYS"."DBA_SENSITIVE_DATA_TBL" MODIFY ("TABLE_NAME" NOT NULL ENABLE);
  ALTER TABLE "SYS"."DBA_SENSITIVE_DATA_TBL" MODIFY ("COLUMN_NAME" NOT NULL ENABLE);
