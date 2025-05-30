--------------------------------------------------------
--  Constraints for Table SYS_FBA_USERS
--------------------------------------------------------

  ALTER TABLE "SYS"."SYS_FBA_USERS" MODIFY ("USER#" NOT NULL ENABLE);
  ALTER TABLE "SYS"."SYS_FBA_USERS" ADD UNIQUE ("FA#", "USER#") DISABLE;
