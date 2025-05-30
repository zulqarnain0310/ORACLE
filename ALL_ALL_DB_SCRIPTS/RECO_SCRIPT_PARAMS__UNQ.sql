--------------------------------------------------------
--  DDL for Index RECO_SCRIPT_PARAMS$_UNQ
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."RECO_SCRIPT_PARAMS$_UNQ" ON "SYS"."RECO_SCRIPT_PARAMS$" ("OID", "NAME", "PARAM_INDEX") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
