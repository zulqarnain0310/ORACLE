--------------------------------------------------------
--  Constraints for Table FGR$_TABLESPACE_INFO
--------------------------------------------------------

  ALTER TABLE "SYS"."FGR$_TABLESPACE_INFO" MODIFY ("VERSION_GUID" NOT NULL ENABLE);
  ALTER TABLE "SYS"."FGR$_TABLESPACE_INFO" MODIFY ("TABLESPACE_NAME" NOT NULL ENABLE);
