--------------------------------------------------------
--  DDL for Index I_CACHE_STATS_1
--------------------------------------------------------

  CREATE INDEX "SYS"."I_CACHE_STATS_1" ON "SYS"."CACHE_STATS_1$" ("DATAOBJ#", "INST_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE( MAXEXTENTS 2147483645)
  TABLESPACE "SYSTEM" ;
