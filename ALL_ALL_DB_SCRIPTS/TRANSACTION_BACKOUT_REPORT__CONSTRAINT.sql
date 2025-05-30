--------------------------------------------------------
--  Constraints for Table TRANSACTION_BACKOUT_REPORT$
--------------------------------------------------------

  ALTER TABLE "SYS"."TRANSACTION_BACKOUT_REPORT$" ADD PRIMARY KEY ("COMPENSATING_XID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX"  ENABLE;
