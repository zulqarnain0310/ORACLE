--------------------------------------------------------
--  Constraints for Table STATS_TARGET$
--------------------------------------------------------

  ALTER TABLE "SYS"."STATS_TARGET$" MODIFY ("STALENESS" NOT NULL ENABLE);
  ALTER TABLE "SYS"."STATS_TARGET$" MODIFY ("OSIZE" NOT NULL ENABLE);
  ALTER TABLE "SYS"."STATS_TARGET$" MODIFY ("OBJ#" NOT NULL ENABLE);
  ALTER TABLE "SYS"."STATS_TARGET$" MODIFY ("TYPE#" NOT NULL ENABLE);
  ALTER TABLE "SYS"."STATS_TARGET$" MODIFY ("FLAGS" NOT NULL ENABLE);
  ALTER TABLE "SYS"."STATS_TARGET$" MODIFY ("STATUS" NOT NULL ENABLE);
