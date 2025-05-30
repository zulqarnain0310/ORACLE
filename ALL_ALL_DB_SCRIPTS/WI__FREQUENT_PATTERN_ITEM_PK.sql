--------------------------------------------------------
--  DDL for Index WI$_FREQUENT_PATTERN_ITEM_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."WI$_FREQUENT_PATTERN_ITEM_PK" ON "SYS"."WI$_FREQUENT_PATTERN_ITEM" ("JOBID", "PATTERNID", "RANK") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
