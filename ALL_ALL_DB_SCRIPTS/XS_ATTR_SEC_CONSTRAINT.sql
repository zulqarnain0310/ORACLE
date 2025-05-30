--------------------------------------------------------
--  Constraints for Table XS$ATTR_SEC
--------------------------------------------------------

  ALTER TABLE "SYS"."XS$ATTR_SEC" ADD CONSTRAINT "XS$ATTR_SEC_UK" UNIQUE ("XDSID#", "ATTR_NAME", "PRIV#")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM"  ENABLE;
