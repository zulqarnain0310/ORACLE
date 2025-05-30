--------------------------------------------------------
--  DDL for Index WI$_FREQUENT_PATTERN_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."WI$_FREQUENT_PATTERN_PK" ON "SYS"."WI$_FREQUENT_PATTERN" ("JOBID", "PATTERNID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
