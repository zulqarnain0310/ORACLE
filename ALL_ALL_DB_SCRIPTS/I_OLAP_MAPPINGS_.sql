--------------------------------------------------------
--  DDL for Index I_OLAP_MAPPINGS$
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."I_OLAP_MAPPINGS$" ON "SYS"."OLAP_MAPPINGS$" ("MAP_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
