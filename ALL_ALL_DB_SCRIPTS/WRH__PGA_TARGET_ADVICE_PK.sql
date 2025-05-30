--------------------------------------------------------
--  DDL for Index WRH$_PGA_TARGET_ADVICE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."WRH$_PGA_TARGET_ADVICE_PK" ON "SYS"."WRH$_PGA_TARGET_ADVICE" ("DBID", "SNAP_ID", "INSTANCE_NUMBER", "PGA_TARGET_FOR_ESTIMATE", "CON_DBID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
