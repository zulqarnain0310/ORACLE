--------------------------------------------------------
--  DDL for Index SQLOBJ$PLAN_PKEY
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."SQLOBJ$PLAN_PKEY" ON "SYS"."SQLOBJ$PLAN" ("SIGNATURE", "CATEGORY", "OBJ_TYPE", "PLAN_ID", "ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
