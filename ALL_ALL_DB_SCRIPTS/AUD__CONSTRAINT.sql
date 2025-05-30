--------------------------------------------------------
--  Constraints for Table AUD$
--------------------------------------------------------

  ALTER TABLE "SYS"."AUD$" MODIFY ("SESSIONID" NOT NULL ENABLE);
  ALTER TABLE "SYS"."AUD$" MODIFY ("ENTRYID" NOT NULL ENABLE);
  ALTER TABLE "SYS"."AUD$" MODIFY ("STATEMENT" NOT NULL ENABLE);
  ALTER TABLE "SYS"."AUD$" MODIFY ("ACTION#" NOT NULL ENABLE);
  ALTER TABLE "SYS"."AUD$" MODIFY ("RETURNCODE" NOT NULL ENABLE);
