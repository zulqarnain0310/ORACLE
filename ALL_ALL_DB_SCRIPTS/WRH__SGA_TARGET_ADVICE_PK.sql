--------------------------------------------------------
--  DDL for Index WRH$_SGA_TARGET_ADVICE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."WRH$_SGA_TARGET_ADVICE_PK" ON "SYS"."WRH$_SGA_TARGET_ADVICE" ("DBID", "SNAP_ID", "INSTANCE_NUMBER", "SGA_SIZE", "CON_DBID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
