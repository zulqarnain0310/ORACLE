--------------------------------------------------------
--  DDL for Index I_OLAP_MEASURE_FOLDERS$
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."I_OLAP_MEASURE_FOLDERS$" ON "SYS"."OLAP_MEASURE_FOLDERS$" ("OBJ#") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
