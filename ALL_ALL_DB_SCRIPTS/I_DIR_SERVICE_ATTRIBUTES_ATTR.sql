--------------------------------------------------------
--  DDL for Index I_DIR$SERVICE_ATTRIBUTES_ATTR
--------------------------------------------------------

  CREATE INDEX "SYS"."I_DIR$SERVICE_ATTRIBUTES_ATTR" ON "SYS"."DIR$SERVICE_ATTRIBUTES" ("ATTRIBUTE_NAME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
