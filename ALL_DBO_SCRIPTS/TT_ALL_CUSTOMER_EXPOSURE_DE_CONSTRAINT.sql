--------------------------------------------------------
--  Constraints for Table TT_ALL_CUSTOMER_EXPOSURE_DE
--------------------------------------------------------

  ALTER TABLE "RBL_MISDB_PROD"."TT_ALL_CUSTOMER_EXPOSURE_DE" MODIFY ("CUSTOMERENTITYID" NOT NULL ENABLE);
  ALTER TABLE "RBL_MISDB_PROD"."TT_ALL_CUSTOMER_EXPOSURE_DE" MODIFY ("EFFECTIVEFROMTIMEKEY" NOT NULL ENABLE);
  ALTER TABLE "RBL_MISDB_PROD"."TT_ALL_CUSTOMER_EXPOSURE_DE" MODIFY ("EFFECTIVETOTIMEKEY" NOT NULL ENABLE);
  ALTER TABLE "RBL_MISDB_PROD"."TT_ALL_CUSTOMER_EXPOSURE_DE" MODIFY ("D2KTIMESTAMP" NOT NULL ENABLE);
