--------------------------------------------------------
--  Constraints for Table XS$DSEC
--------------------------------------------------------

  ALTER TABLE "SYS"."XS$DSEC" ADD CONSTRAINT "XS$DSEC_PK" PRIMARY KEY ("XDSID#")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM"  ENABLE;
