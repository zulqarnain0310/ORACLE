--------------------------------------------------------
--  DDL for Index WRI$_ADV_ADDM_TASKS_IDX_01
--------------------------------------------------------

  CREATE INDEX "SYS"."WRI$_ADV_ADDM_TASKS_IDX_01" ON "SYS"."WRI$_ADV_ADDM_TASKS" ("DBID", "BEGIN_SNAP_ID", "END_SNAP_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
