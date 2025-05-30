--------------------------------------------------------
--  DDL for Index WRI$_ADV_AI_COL_USAGE_02
--------------------------------------------------------

  CREATE INDEX "SYS"."WRI$_ADV_AI_COL_USAGE_02" ON "SYS"."WRI$_ADV_AI_COL_USAGE" ("OBJ#", "SEL_COLS") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
