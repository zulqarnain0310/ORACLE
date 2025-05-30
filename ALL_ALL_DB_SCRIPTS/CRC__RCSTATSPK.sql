--------------------------------------------------------
--  DDL for Index CRC$_RCSTATSPK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."CRC$_RCSTATSPK" ON "SYS"."CRC$_RESULT_CACHE_STATS" ("CACHE_ID", "STAT_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
