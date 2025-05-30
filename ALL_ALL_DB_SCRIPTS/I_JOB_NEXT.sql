--------------------------------------------------------
--  DDL for Index I_JOB_NEXT
--------------------------------------------------------

  CREATE INDEX "SYS"."I_JOB_NEXT" ON "SYS"."JOB$" ("NEXT_DATE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
