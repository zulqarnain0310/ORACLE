--------------------------------------------------------
--  Constraints for Table UPGRADEREPORT_PACKAGE_WEEKWISE
--------------------------------------------------------

  ALTER TABLE "RBL_MISDB_PROD"."UPGRADEREPORT_PACKAGE_WEEKWISE" MODIFY ("DPD_MAX" NOT NULL ENABLE);
  ALTER TABLE "RBL_MISDB_PROD"."UPGRADEREPORT_PACKAGE_WEEKWISE" MODIFY ("DPD_OVERDRAWN" NOT NULL ENABLE);
  ALTER TABLE "RBL_MISDB_PROD"."UPGRADEREPORT_PACKAGE_WEEKWISE" MODIFY ("DPD_RENEWAL" NOT NULL ENABLE);
  ALTER TABLE "RBL_MISDB_PROD"."UPGRADEREPORT_PACKAGE_WEEKWISE" MODIFY ("DPD_STOCKSTMT" NOT NULL ENABLE);
  ALTER TABLE "RBL_MISDB_PROD"."UPGRADEREPORT_PACKAGE_WEEKWISE" MODIFY ("DPD_NOCREDIT" NOT NULL ENABLE);
  ALTER TABLE "RBL_MISDB_PROD"."UPGRADEREPORT_PACKAGE_WEEKWISE" MODIFY ("DPD_INTSERVICE" NOT NULL ENABLE);
  ALTER TABLE "RBL_MISDB_PROD"."UPGRADEREPORT_PACKAGE_WEEKWISE" MODIFY ("CC_OD_INTEREST_SERVICE" NOT NULL ENABLE);
  ALTER TABLE "RBL_MISDB_PROD"."UPGRADEREPORT_PACKAGE_WEEKWISE" MODIFY ("DPD_OVERDUE" NOT NULL ENABLE);
  ALTER TABLE "RBL_MISDB_PROD"."UPGRADEREPORT_PACKAGE_WEEKWISE" MODIFY ("DPD_PRINCOVERDUE" NOT NULL ENABLE);
  ALTER TABLE "RBL_MISDB_PROD"."UPGRADEREPORT_PACKAGE_WEEKWISE" MODIFY ("DPD_INTOVERDUESINCE" NOT NULL ENABLE);
  ALTER TABLE "RBL_MISDB_PROD"."UPGRADEREPORT_PACKAGE_WEEKWISE" MODIFY ("DPD_OTHEROVERDUESINCE" NOT NULL ENABLE);
  ALTER TABLE "RBL_MISDB_PROD"."UPGRADEREPORT_PACKAGE_WEEKWISE" MODIFY ("BILL_PC_OVERDUE_AMOUNT" NOT NULL ENABLE);
  ALTER TABLE "RBL_MISDB_PROD"."UPGRADEREPORT_PACKAGE_WEEKWISE" MODIFY ("OVERDUE_BILL_PC_ID" NOT NULL ENABLE);
  ALTER TABLE "RBL_MISDB_PROD"."UPGRADEREPORT_PACKAGE_WEEKWISE" MODIFY ("BILL_PC_OVERDUE_DATE" NOT NULL ENABLE);
  ALTER TABLE "RBL_MISDB_PROD"."UPGRADEREPORT_PACKAGE_WEEKWISE" MODIFY ("DPD_BILL_PC" NOT NULL ENABLE);
