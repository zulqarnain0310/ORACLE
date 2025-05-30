--------------------------------------------------------
--  DDL for Index WRI$_SQLSET_REFERENCES_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."WRI$_SQLSET_REFERENCES_PK" ON "SYS"."WRI$_SQLSET_REFERENCES" ("ID", "SQLSET_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
