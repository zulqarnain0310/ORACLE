--------------------------------------------------------
--  Constraints for Table USERAUTH$
--------------------------------------------------------

  ALTER TABLE "SYS"."USERAUTH$" MODIFY ("USER#" NOT NULL ENABLE);
  ALTER TABLE "SYS"."USERAUTH$" MODIFY ("GRANTOR#" NOT NULL ENABLE);
  ALTER TABLE "SYS"."USERAUTH$" MODIFY ("GRANTEE#" NOT NULL ENABLE);
  ALTER TABLE "SYS"."USERAUTH$" MODIFY ("PRIVILEGE#" NOT NULL ENABLE);
  ALTER TABLE "SYS"."USERAUTH$" MODIFY ("SEQUENCE#" NOT NULL ENABLE);
