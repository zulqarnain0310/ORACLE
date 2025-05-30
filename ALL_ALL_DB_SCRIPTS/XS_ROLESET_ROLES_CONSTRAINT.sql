--------------------------------------------------------
--  Constraints for Table XS$ROLESET_ROLES
--------------------------------------------------------

  ALTER TABLE "SYS"."XS$ROLESET_ROLES" ADD CONSTRAINT "XS$ROLESET_ROLES_UK" UNIQUE ("RSID#", "ROLE#")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM"  ENABLE;
