--------------------------------------------------------
--  DDL for Index I_DIR$DB_ATTRIBUTES_UI
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."I_DIR$DB_ATTRIBUTES_UI" ON "SYS"."DIR$DATABASE_ATTRIBUTES" ("DATABASE_NAME", "ATTRIBUTE_NAME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
