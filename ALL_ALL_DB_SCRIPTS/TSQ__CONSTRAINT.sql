--------------------------------------------------------
--  Constraints for Table TSQ$
--------------------------------------------------------

  ALTER TABLE "SYS"."TSQ$" MODIFY ("TS#" NOT NULL ENABLE);
  ALTER TABLE "SYS"."TSQ$" MODIFY ("USER#" NOT NULL ENABLE);
  ALTER TABLE "SYS"."TSQ$" MODIFY ("GRANTOR#" NOT NULL ENABLE);
  ALTER TABLE "SYS"."TSQ$" MODIFY ("BLOCKS" NOT NULL ENABLE);
  ALTER TABLE "SYS"."TSQ$" MODIFY ("PRIV1" NOT NULL ENABLE);
  ALTER TABLE "SYS"."TSQ$" MODIFY ("PRIV2" NOT NULL ENABLE);
  ALTER TABLE "SYS"."TSQ$" MODIFY ("PRIV3" NOT NULL ENABLE);
