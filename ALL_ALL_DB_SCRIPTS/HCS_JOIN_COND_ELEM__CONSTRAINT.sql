--------------------------------------------------------
--  Constraints for Table HCS_JOIN_COND_ELEM$
--------------------------------------------------------

  ALTER TABLE "SYS"."HCS_JOIN_COND_ELEM$" MODIFY ("DIM#" NOT NULL ENABLE);
  ALTER TABLE "SYS"."HCS_JOIN_COND_ELEM$" MODIFY ("JOINPATH#" NOT NULL ENABLE);
  ALTER TABLE "SYS"."HCS_JOIN_COND_ELEM$" MODIFY ("LHS_SRC_COL#" NOT NULL ENABLE);
  ALTER TABLE "SYS"."HCS_JOIN_COND_ELEM$" MODIFY ("RHS_SRC_COL#" NOT NULL ENABLE);
  ALTER TABLE "SYS"."HCS_JOIN_COND_ELEM$" MODIFY ("ORDER_NUM" NOT NULL ENABLE);
