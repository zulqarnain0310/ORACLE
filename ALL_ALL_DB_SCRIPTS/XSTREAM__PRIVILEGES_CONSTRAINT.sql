--------------------------------------------------------
--  Constraints for Table XSTREAM$_PRIVILEGES
--------------------------------------------------------

  ALTER TABLE "SYS"."XSTREAM$_PRIVILEGES" MODIFY ("USERNAME" NOT NULL ENABLE);
  ALTER TABLE "SYS"."XSTREAM$_PRIVILEGES" MODIFY ("PRIVILEGE_TYPE" NOT NULL ENABLE);
  ALTER TABLE "SYS"."XSTREAM$_PRIVILEGES" MODIFY ("PRIVILEGE_LEVEL" NOT NULL ENABLE);
