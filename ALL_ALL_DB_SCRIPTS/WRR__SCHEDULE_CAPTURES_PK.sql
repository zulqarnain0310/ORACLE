--------------------------------------------------------
--  DDL for Index WRR$_SCHEDULE_CAPTURES_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."WRR$_SCHEDULE_CAPTURES_PK" ON "SYS"."WRR$_SCHEDULE_CAPTURES" ("SCHEDULE_NAME", "SCHEDULE_CAP_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
