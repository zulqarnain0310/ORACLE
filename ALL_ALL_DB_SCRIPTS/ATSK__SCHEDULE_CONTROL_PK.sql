--------------------------------------------------------
--  DDL for Index ATSK$_SCHEDULE_CONTROL_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."ATSK$_SCHEDULE_CONTROL_PK" ON "SYS"."ATSK$_SCHEDULE_CONTROL" ("DBID", "ATSKID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
