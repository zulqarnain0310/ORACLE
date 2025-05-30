--------------------------------------------------------
--  Constraints for Table XS$PROXY_ROLE
--------------------------------------------------------

  ALTER TABLE "SYS"."XS$PROXY_ROLE" ADD CONSTRAINT "XS$PROXY_ROLE_UK" UNIQUE ("PROXY#", "CLIENT#", "ROLE#")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM"  ENABLE;
