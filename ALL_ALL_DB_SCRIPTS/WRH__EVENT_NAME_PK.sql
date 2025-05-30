--------------------------------------------------------
--  DDL for Index WRH$_EVENT_NAME_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."WRH$_EVENT_NAME_PK" ON "SYS"."WRH$_EVENT_NAME" ("DBID", "EVENT_ID", "CON_DBID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
