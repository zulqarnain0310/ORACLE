--------------------------------------------------------
--  DDL for Index WRH$_DATAFILE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."WRH$_DATAFILE_PK" ON "SYS"."WRH$_DATAFILE" ("DBID", "FILE#", "CREATION_CHANGE#", "CON_DBID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
