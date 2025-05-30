--------------------------------------------------------
--  DDL for Index WRH$_SESS_NETWORK_BL_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."WRH$_SESS_NETWORK_BL_PK" ON "SYS"."WRH$_SESS_NETWORK_BL" ("DBID", "SNAP_ID", "INSTANCE_NUMBER", "CON_DBID", "SESSION_ID", "SERIAL#", "CHANNEL_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
