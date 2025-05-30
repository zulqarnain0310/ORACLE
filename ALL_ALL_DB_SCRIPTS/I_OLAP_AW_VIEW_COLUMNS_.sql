--------------------------------------------------------
--  DDL for Index I_OLAP_AW_VIEW_COLUMNS$
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."I_OLAP_AW_VIEW_COLUMNS$" ON "SYS"."OLAP_AW_VIEW_COLUMNS$" ("VIEW_OBJ#", "COLUMN_OBJ#") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
