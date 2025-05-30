--------------------------------------------------------
--  DDL for Index I_DIR$NODE_ATTRIBUTES_ATTR
--------------------------------------------------------

  CREATE INDEX "SYS"."I_DIR$NODE_ATTRIBUTES_ATTR" ON "SYS"."DIR$NODE_ATTRIBUTES" ("ATTRIBUTE_NAME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
