--------------------------------------------------------
--  DDL for Index ADVACOTHERDETAIL_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "PREMOC_RBL_MISDB_PROD"."ADVACOTHERDETAIL_PK" ON "PREMOC_RBL_MISDB_PROD"."ADVACOTHERDETAIL" ("ACCOUNTENTITYID", "EFFECTIVEFROMTIMEKEY", "EFFECTIVETOTIMEKEY") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
