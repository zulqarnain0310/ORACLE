--------------------------------------------------------
--  DDL for Index WRH$_LATCH_NAME_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."WRH$_LATCH_NAME_PK" ON "SYS"."WRH$_LATCH_NAME" ("DBID", "LATCH_HASH", "CON_DBID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
