--------------------------------------------------------
--  Constraints for Table DEGRADE_CHECK_DATA
--------------------------------------------------------

  ALTER TABLE "RBL_MISDB_PROD"."DEGRADE_CHECK_DATA" MODIFY ("ENTITYKEY" NOT NULL ENABLE);
  ALTER TABLE "RBL_MISDB_PROD"."DEGRADE_CHECK_DATA" MODIFY ("ACCOUNTENTITYID" NOT NULL ENABLE);
  ALTER TABLE "RBL_MISDB_PROD"."DEGRADE_CHECK_DATA" MODIFY ("EFFECTIVEFROMTIMEKEY" NOT NULL ENABLE);
  ALTER TABLE "RBL_MISDB_PROD"."DEGRADE_CHECK_DATA" MODIFY ("EFFECTIVETOTIMEKEY" NOT NULL ENABLE);
