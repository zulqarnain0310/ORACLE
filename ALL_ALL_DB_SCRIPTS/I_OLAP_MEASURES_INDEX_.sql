--------------------------------------------------------
--  DDL for Index I_OLAP_MEASURES_INDEX$
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."I_OLAP_MEASURES_INDEX$" ON "SYS"."OLAP_MEASURES$" ("CUBE_OBJ#", "MEASURE_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
