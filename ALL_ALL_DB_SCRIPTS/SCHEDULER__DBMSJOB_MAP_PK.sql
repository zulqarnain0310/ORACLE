--------------------------------------------------------
--  DDL for Index SCHEDULER$_DBMSJOB_MAP_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."SCHEDULER$_DBMSJOB_MAP_PK" ON "SYS"."SCHEDULER$_DBMSJOB_MAP" ("DBMS_JOB_NUMBER") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
