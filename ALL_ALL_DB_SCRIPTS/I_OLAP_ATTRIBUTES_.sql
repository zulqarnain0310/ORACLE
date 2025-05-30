--------------------------------------------------------
--  DDL for Index I_OLAP_ATTRIBUTES$
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."I_OLAP_ATTRIBUTES$" ON "SYS"."OLAP_ATTRIBUTES$" ("DIM_OBJ#", "ATTRIBUTE_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
