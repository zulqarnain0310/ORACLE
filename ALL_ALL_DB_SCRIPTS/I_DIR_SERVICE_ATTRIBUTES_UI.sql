--------------------------------------------------------
--  DDL for Index I_DIR$SERVICE_ATTRIBUTES_UI
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."I_DIR$SERVICE_ATTRIBUTES_UI" ON "SYS"."DIR$SERVICE_ATTRIBUTES" ("SERVICE_ID", "ATTRIBUTE_NAME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
