--------------------------------------------------------
--  Constraints for Table WRR$_CAPTURE_LONG_SQLTEXT
--------------------------------------------------------

  ALTER TABLE "SYS"."WRR$_CAPTURE_LONG_SQLTEXT" ADD CONSTRAINT "WRR$_CAPTURE_LONG_SQLTEXT_PK" PRIMARY KEY ("CAPTURE_ID", "SQL_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX"  ENABLE;
