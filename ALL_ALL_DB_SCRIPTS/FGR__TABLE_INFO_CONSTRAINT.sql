--------------------------------------------------------
--  Constraints for Table FGR$_TABLE_INFO
--------------------------------------------------------

  ALTER TABLE "SYS"."FGR$_TABLE_INFO" MODIFY ("VERSION_GUID" NOT NULL ENABLE);
  ALTER TABLE "SYS"."FGR$_TABLE_INFO" MODIFY ("SCHEMA_NAME" NOT NULL ENABLE);
  ALTER TABLE "SYS"."FGR$_TABLE_INFO" MODIFY ("TABLE_NAME" NOT NULL ENABLE);
