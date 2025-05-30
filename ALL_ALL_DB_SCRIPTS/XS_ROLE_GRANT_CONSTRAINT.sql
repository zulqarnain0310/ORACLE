--------------------------------------------------------
--  Constraints for Table XS$ROLE_GRANT
--------------------------------------------------------

  ALTER TABLE "SYS"."XS$ROLE_GRANT" ADD CONSTRAINT "XS$ROLE_GRANT_UK" UNIQUE ("GRANTEE#", "ROLE#")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM"  ENABLE;
