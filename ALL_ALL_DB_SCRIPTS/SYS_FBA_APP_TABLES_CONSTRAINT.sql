--------------------------------------------------------
--  Constraints for Table SYS_FBA_APP_TABLES
--------------------------------------------------------

  ALTER TABLE "SYS"."SYS_FBA_APP_TABLES" MODIFY ("OBJ#" NOT NULL ENABLE);
  ALTER TABLE "SYS"."SYS_FBA_APP_TABLES" ADD UNIQUE ("OBJ#") DISABLE;
