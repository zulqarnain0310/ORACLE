--------------------------------------------------------
--  Constraints for Table DIMTYPESERVICESUMMON
--------------------------------------------------------

  ALTER TABLE "RBL_MISDB_PROD"."DIMTYPESERVICESUMMON" MODIFY ("SERVICESUMMON_KEY" NOT NULL ENABLE);
  ALTER TABLE "RBL_MISDB_PROD"."DIMTYPESERVICESUMMON" MODIFY ("SERVICESUMMONALT_KEY" NOT NULL ENABLE);
  ALTER TABLE "RBL_MISDB_PROD"."DIMTYPESERVICESUMMON" MODIFY ("D2KTIMESTAMP" NOT NULL ENABLE);
