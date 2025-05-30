--------------------------------------------------------
--  Constraints for Table LOG$
--------------------------------------------------------

  ALTER TABLE "SYS"."LOG$" MODIFY ("BTABLE#" NOT NULL ENABLE);
  ALTER TABLE "SYS"."LOG$" MODIFY ("COLNAME" NOT NULL ENABLE);
  ALTER TABLE "SYS"."LOG$" MODIFY ("REFCOUNT" NOT NULL ENABLE);
  ALTER TABLE "SYS"."LOG$" MODIFY ("LTABLE#" NOT NULL ENABLE);
