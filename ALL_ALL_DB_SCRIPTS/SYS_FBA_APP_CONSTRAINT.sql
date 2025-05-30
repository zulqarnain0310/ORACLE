--------------------------------------------------------
--  Constraints for Table SYS_FBA_APP
--------------------------------------------------------

  ALTER TABLE "SYS"."SYS_FBA_APP" MODIFY ("APPNAME" NOT NULL ENABLE);
  ALTER TABLE "SYS"."SYS_FBA_APP" ADD UNIQUE ("APPNAME") DISABLE;
