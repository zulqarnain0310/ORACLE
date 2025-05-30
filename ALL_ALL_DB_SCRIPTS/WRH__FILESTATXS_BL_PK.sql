--------------------------------------------------------
--  DDL for Index WRH$_FILESTATXS_BL_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."WRH$_FILESTATXS_BL_PK" ON "SYS"."WRH$_FILESTATXS_BL" ("DBID", "SNAP_ID", "INSTANCE_NUMBER", "FILE#", "CON_DBID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
