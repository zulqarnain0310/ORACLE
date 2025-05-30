--------------------------------------------------------
--  DDL for Index WRI$_ADV_AI_COL_USAGE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."WRI$_ADV_AI_COL_USAGE_PK" ON "SYS"."WRI$_ADV_AI_COL_USAGE" ("OBJ#", "COLS") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
