--------------------------------------------------------
--  DDL for Index WRH$_FILEMETRIC_HISTORY_INDEX
--------------------------------------------------------

  CREATE INDEX "SYS"."WRH$_FILEMETRIC_HISTORY_INDEX" ON "SYS"."WRH$_FILEMETRIC_HISTORY" ("DBID", "SNAP_ID", "INSTANCE_NUMBER", "GROUP_ID", "FILEID", "BEGIN_TIME", "CON_DBID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
