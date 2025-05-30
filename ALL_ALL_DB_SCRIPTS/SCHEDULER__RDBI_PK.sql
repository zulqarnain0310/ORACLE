--------------------------------------------------------
--  DDL for Index SCHEDULER$_RDBI_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."SCHEDULER$_RDBI_PK" ON "SYS"."SCHEDULER$_RJOB_SRC_DB_INFO" ("JOBOID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
