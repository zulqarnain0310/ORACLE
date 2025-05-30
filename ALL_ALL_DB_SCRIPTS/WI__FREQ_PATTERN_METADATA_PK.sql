--------------------------------------------------------
--  DDL for Index WI$_FREQ_PATTERN_METADATA_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."WI$_FREQ_PATTERN_METADATA_PK" ON "SYS"."WI$_FREQUENT_PATTERN_METADATA" ("JOBID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
