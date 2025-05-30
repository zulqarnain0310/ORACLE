--------------------------------------------------------
--  DDL for Index I_SQLOBJ$AUXDATA_PKEY
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."I_SQLOBJ$AUXDATA_PKEY" ON "SYS"."SQLOBJ$AUXDATA" ("SIGNATURE", "CATEGORY", "OBJ_TYPE", "PLAN_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
