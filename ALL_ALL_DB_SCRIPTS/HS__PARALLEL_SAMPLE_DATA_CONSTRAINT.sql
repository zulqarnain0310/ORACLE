--------------------------------------------------------
--  Constraints for Table HS$_PARALLEL_SAMPLE_DATA
--------------------------------------------------------

  ALTER TABLE "SYS"."HS$_PARALLEL_SAMPLE_DATA" MODIFY ("DBLINK" NOT NULL ENABLE);
  ALTER TABLE "SYS"."HS$_PARALLEL_SAMPLE_DATA" MODIFY ("REMOTE_TABLE_NAME" NOT NULL ENABLE);
  ALTER TABLE "SYS"."HS$_PARALLEL_SAMPLE_DATA" MODIFY ("REMOTE_SCHEMA_NAME" NOT NULL ENABLE);
