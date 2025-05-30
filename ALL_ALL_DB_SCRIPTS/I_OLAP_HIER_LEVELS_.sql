--------------------------------------------------------
--  DDL for Index I_OLAP_HIER_LEVELS$
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."I_OLAP_HIER_LEVELS$" ON "SYS"."OLAP_HIER_LEVELS$" ("HIERARCHY_ID", "ORDER_NUM") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
