--------------------------------------------------------
--  Constraints for Table ADMINAUTH$
--------------------------------------------------------

  ALTER TABLE "SYS"."ADMINAUTH$" MODIFY ("USER#" NOT NULL ENABLE);
  ALTER TABLE "SYS"."ADMINAUTH$" MODIFY ("SYSPRIV" NOT NULL ENABLE);
  ALTER TABLE "SYS"."ADMINAUTH$" MODIFY ("COMMON" NOT NULL ENABLE);
  ALTER TABLE "SYS"."ADMINAUTH$" MODIFY ("FEDPRIV" NOT NULL ENABLE);
