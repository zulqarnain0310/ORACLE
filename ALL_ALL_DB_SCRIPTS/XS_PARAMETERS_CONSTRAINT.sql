--------------------------------------------------------
--  Constraints for Table XS$PARAMETERS
--------------------------------------------------------

  ALTER TABLE "SYS"."XS$PARAMETERS" MODIFY ("NAME" NOT NULL ENABLE);
  ALTER TABLE "SYS"."XS$PARAMETERS" MODIFY ("VALUE" NOT NULL ENABLE);
  ALTER TABLE "SYS"."XS$PARAMETERS" MODIFY ("DESCRIPTION" NOT NULL ENABLE);
  ALTER TABLE "SYS"."XS$PARAMETERS" MODIFY ("REGISTRATION_SEQUENCE" NOT NULL ENABLE);
  ALTER TABLE "SYS"."XS$PARAMETERS" MODIFY ("FLAGS" NOT NULL ENABLE);
