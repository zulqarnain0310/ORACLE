--------------------------------------------------------
--  DDL for Index I_DIR$SERVICE_STATUS
--------------------------------------------------------

  CREATE INDEX "SYS"."I_DIR$SERVICE_STATUS" ON "SYS"."DIR$SERVICE_OPERATIONS" ("STATUS") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
