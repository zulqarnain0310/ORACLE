--------------------------------------------------------
--  DDL for Index I_DIR$INSTANCE_ACTTYP
--------------------------------------------------------

  CREATE INDEX "SYS"."I_DIR$INSTANCE_ACTTYP" ON "SYS"."DIR$INSTANCE_ACTIONS" ("ACTION_TYPE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
