--------------------------------------------------------
--  Constraints for Table DEGRADE_CHECK_MOC_CUSTOMER
--------------------------------------------------------

  ALTER TABLE "RBL_MISDB_PROD"."DEGRADE_CHECK_MOC_CUSTOMER" MODIFY ("ENTITYKEY" NOT NULL ENABLE);
  ALTER TABLE "RBL_MISDB_PROD"."DEGRADE_CHECK_MOC_CUSTOMER" MODIFY ("CUSTOMERENTITYID" NOT NULL ENABLE);
  ALTER TABLE "RBL_MISDB_PROD"."DEGRADE_CHECK_MOC_CUSTOMER" MODIFY ("EFFECTIVEFROMTIMEKEY" NOT NULL ENABLE);
  ALTER TABLE "RBL_MISDB_PROD"."DEGRADE_CHECK_MOC_CUSTOMER" MODIFY ("EFFECTIVETOTIMEKEY" NOT NULL ENABLE);
