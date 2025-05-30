--------------------------------------------------------
--  Constraints for Table WRI$_ADV_SQLW_STMTS
--------------------------------------------------------

  ALTER TABLE "SYS"."WRI$_ADV_SQLW_STMTS" ADD CONSTRAINT "WRI$_ADV_SQLW_STMTS_PK" PRIMARY KEY ("WORKLOAD_ID", "SQL_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX"  ENABLE;
