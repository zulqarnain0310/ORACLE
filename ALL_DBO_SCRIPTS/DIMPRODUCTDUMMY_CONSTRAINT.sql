--------------------------------------------------------
--  Constraints for Table DIMPRODUCTDUMMY
--------------------------------------------------------

  ALTER TABLE "RBL_MISDB_PROD"."DIMPRODUCTDUMMY" MODIFY ("PRODUCT_KEY" NOT NULL ENABLE);
  ALTER TABLE "RBL_MISDB_PROD"."DIMPRODUCTDUMMY" MODIFY ("PRODUCTALT_KEY" NOT NULL ENABLE);
  ALTER TABLE "RBL_MISDB_PROD"."DIMPRODUCTDUMMY" MODIFY ("D2KTIMESTAMP" NOT NULL ENABLE);
