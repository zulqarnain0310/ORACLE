--------------------------------------------------------
--  DDL for Index WRM$_SNAPSHOT_DETAILS_INDEX
--------------------------------------------------------

  CREATE INDEX "SYS"."WRM$_SNAPSHOT_DETAILS_INDEX" ON "SYS"."WRM$_SNAPSHOT_DETAILS" ("SNAP_ID", "DBID", "INSTANCE_NUMBER", "TABLE_ID", "STEP_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
