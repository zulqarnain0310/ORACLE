--------------------------------------------------------
--  DDL for Index WRH$_TEMPSTATXS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."WRH$_TEMPSTATXS_PK" ON "SYS"."WRH$_TEMPSTATXS" ("DBID", "SNAP_ID", "INSTANCE_NUMBER", "FILE#", "CON_DBID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
