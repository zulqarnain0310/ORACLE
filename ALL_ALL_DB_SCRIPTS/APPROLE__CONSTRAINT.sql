--------------------------------------------------------
--  Constraints for Table APPROLE$
--------------------------------------------------------

  ALTER TABLE "SYS"."APPROLE$" MODIFY ("ROLE#" NOT NULL ENABLE);
  ALTER TABLE "SYS"."APPROLE$" MODIFY ("SCHEMA" NOT NULL ENABLE);
  ALTER TABLE "SYS"."APPROLE$" MODIFY ("PACKAGE" NOT NULL ENABLE);
