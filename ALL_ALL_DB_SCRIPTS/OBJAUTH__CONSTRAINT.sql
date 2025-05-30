--------------------------------------------------------
--  Constraints for Table OBJAUTH$
--------------------------------------------------------

  ALTER TABLE "SYS"."OBJAUTH$" MODIFY ("OBJ#" NOT NULL ENABLE);
  ALTER TABLE "SYS"."OBJAUTH$" MODIFY ("GRANTOR#" NOT NULL ENABLE);
  ALTER TABLE "SYS"."OBJAUTH$" MODIFY ("GRANTEE#" NOT NULL ENABLE);
  ALTER TABLE "SYS"."OBJAUTH$" MODIFY ("PRIVILEGE#" NOT NULL ENABLE);
  ALTER TABLE "SYS"."OBJAUTH$" MODIFY ("SEQUENCE#" NOT NULL ENABLE);
