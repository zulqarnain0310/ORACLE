--------------------------------------------------------
--  Constraints for Table XS$INSTSET_INH
--------------------------------------------------------

  ALTER TABLE "SYS"."XS$INSTSET_INH" ADD CONSTRAINT "XS$INSTSET_INH_PK" PRIMARY KEY ("XDSID#", "ORDER#")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM"  ENABLE;
