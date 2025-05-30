--------------------------------------------------------
--  Constraints for Table XS$INSTSET_LIST
--------------------------------------------------------

  ALTER TABLE "SYS"."XS$INSTSET_LIST" ADD CONSTRAINT "XS$DSEC_INSTSET_UK" PRIMARY KEY ("XDSID#", "ORDER#")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM"  ENABLE;
