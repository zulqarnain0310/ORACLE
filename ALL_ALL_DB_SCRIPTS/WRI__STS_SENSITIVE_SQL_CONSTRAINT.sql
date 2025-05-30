--------------------------------------------------------
--  Constraints for Table WRI$_STS_SENSITIVE_SQL
--------------------------------------------------------

  ALTER TABLE "SYS"."WRI$_STS_SENSITIVE_SQL" ADD CONSTRAINT "WRI$_STS_SENSITIVE_SQL_PK" PRIMARY KEY ("SCRIPT_ID", "STMT_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM"  ENABLE;
