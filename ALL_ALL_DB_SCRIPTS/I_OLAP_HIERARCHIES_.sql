--------------------------------------------------------
--  DDL for Index I_OLAP_HIERARCHIES$
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."I_OLAP_HIERARCHIES$" ON "SYS"."OLAP_HIERARCHIES$" ("DIM_OBJ#", "HIERARCHY_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
