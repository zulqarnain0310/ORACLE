--------------------------------------------------------
--  Constraints for Table XS$INSTSET_INH_KEY
--------------------------------------------------------

  ALTER TABLE "SYS"."XS$INSTSET_INH_KEY" ADD CONSTRAINT "XS$INSTSET_INH_KEY_UK" UNIQUE ("XDSID#", "ORDER#", "PKEY")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM"  ENABLE;
