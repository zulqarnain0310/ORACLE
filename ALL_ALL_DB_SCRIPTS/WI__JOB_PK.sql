--------------------------------------------------------
--  DDL for Index WI$_JOB_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."WI$_JOB_PK" ON "SYS"."WI$_JOB" ("JOBID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
