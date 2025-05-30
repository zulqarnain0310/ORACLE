--------------------------------------------------------
--  DDL for Index LINK_LOGONS$_SRCID_IDX
--------------------------------------------------------

  CREATE INDEX "SYS"."LINK_LOGONS$_SRCID_IDX" ON "SYS"."LINK_LOGONS$" ("SOURCE_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
