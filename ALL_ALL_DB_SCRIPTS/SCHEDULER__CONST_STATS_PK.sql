--------------------------------------------------------
--  DDL for Index SCHEDULER$_CONST_STATS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."SCHEDULER$_CONST_STATS_PK" ON "SYS"."SCHEDULER$_CONSTRAINTS_STATS" ("OID", "RESOID", "JOBOID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
