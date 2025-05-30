--------------------------------------------------------
--  DDL for Index WRM$_SNAP_ERROR_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."WRM$_SNAP_ERROR_PK" ON "SYS"."WRM$_SNAP_ERROR" ("DBID", "SNAP_ID", "INSTANCE_NUMBER", "TABLE_NAME", "STEP_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
