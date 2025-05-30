--------------------------------------------------------
--  DDL for Index I_HEATMAPEXTSTAT$
--------------------------------------------------------

  CREATE INDEX "SYS"."I_HEATMAPEXTSTAT$" ON "SYS"."HEAT_MAP_EXTENT_STAT$" ("OBJ#", "DATAOBJ#") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
