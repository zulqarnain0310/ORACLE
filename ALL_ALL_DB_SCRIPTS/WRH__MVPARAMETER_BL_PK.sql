--------------------------------------------------------
--  DDL for Index WRH$_MVPARAMETER_BL_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."WRH$_MVPARAMETER_BL_PK" ON "SYS"."WRH$_MVPARAMETER_BL" ("DBID", "SNAP_ID", "INSTANCE_NUMBER", "PARAMETER_HASH", "ORDINAL", "CON_DBID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
