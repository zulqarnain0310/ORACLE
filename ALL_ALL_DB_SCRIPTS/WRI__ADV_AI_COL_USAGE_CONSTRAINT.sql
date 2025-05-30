--------------------------------------------------------
--  Constraints for Table WRI$_ADV_AI_COL_USAGE
--------------------------------------------------------

  ALTER TABLE "SYS"."WRI$_ADV_AI_COL_USAGE" ADD CONSTRAINT "WRI$_ADV_AI_COL_USAGE_PK" PRIMARY KEY ("OBJ#", "COLS")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX"  ENABLE;
