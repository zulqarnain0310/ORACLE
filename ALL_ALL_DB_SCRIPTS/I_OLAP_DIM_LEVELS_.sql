--------------------------------------------------------
--  DDL for Index I_OLAP_DIM_LEVELS$
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."I_OLAP_DIM_LEVELS$" ON "SYS"."OLAP_DIM_LEVELS$" ("LEVEL_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
