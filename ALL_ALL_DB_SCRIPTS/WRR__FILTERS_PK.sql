--------------------------------------------------------
--  DDL for Index WRR$_FILTERS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."WRR$_FILTERS_PK" ON "SYS"."WRR$_FILTERS" ("WRR_ID", "FILTER_TYPE", "NAME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
