--------------------------------------------------------
--  DDL for Index WRH$_TEMPFILE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."WRH$_TEMPFILE_PK" ON "SYS"."WRH$_TEMPFILE" ("DBID", "FILE#", "CREATION_CHANGE#", "CON_DBID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
