--------------------------------------------------------
--  DDL for Index WRI$_SQLSET_STATEMENTS_IDX_02
--------------------------------------------------------

  CREATE INDEX "SYS"."WRI$_SQLSET_STATEMENTS_IDX_02" ON "SYS"."WRI$_SQLSET_STATEMENTS" ("SQLSET_ID", "FORCE_MATCHING_SIGNATURE", "CON_DBID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
