--------------------------------------------------------
--  DDL for Index RECO_SCRIPT_BLOCK$_UNQ
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."RECO_SCRIPT_BLOCK$_UNQ" ON "SYS"."RECO_SCRIPT_BLOCK$" ("OID", "BLOCK_NUM") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
