--------------------------------------------------------
--  Constraints for Table DGU_SMA_REPORT
--------------------------------------------------------

  ALTER TABLE "RBL_MISDB_PROD"."DGU_SMA_REPORT" MODIFY ("BALANCE" NOT NULL ENABLE);
  ALTER TABLE "RBL_MISDB_PROD"."DGU_SMA_REPORT" MODIFY ("PRINCOUTSTD" NOT NULL ENABLE);
  ALTER TABLE "RBL_MISDB_PROD"."DGU_SMA_REPORT" MODIFY ("PRINCOVERDUE" NOT NULL ENABLE);
  ALTER TABLE "RBL_MISDB_PROD"."DGU_SMA_REPORT" MODIFY ("INTOVERDUE" NOT NULL ENABLE);
  ALTER TABLE "RBL_MISDB_PROD"."DGU_SMA_REPORT" MODIFY ("OTHEROVERDUE" NOT NULL ENABLE);
  ALTER TABLE "RBL_MISDB_PROD"."DGU_SMA_REPORT" MODIFY ("OVERDUEAMT" NOT NULL ENABLE);
  ALTER TABLE "RBL_MISDB_PROD"."DGU_SMA_REPORT" MODIFY ("CURRENTLIMIT" NOT NULL ENABLE);
