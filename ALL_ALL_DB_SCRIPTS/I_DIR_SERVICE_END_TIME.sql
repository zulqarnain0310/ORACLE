--------------------------------------------------------
--  DDL for Index I_DIR$SERVICE_END_TIME
--------------------------------------------------------

  CREATE INDEX "SYS"."I_DIR$SERVICE_END_TIME" ON "SYS"."DIR$SERVICE_OPERATIONS" ("END_TIME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
