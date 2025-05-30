--------------------------------------------------------
--  DDL for Index I_COLUMNSTAT$
--------------------------------------------------------

  CREATE INDEX "SYS"."I_COLUMNSTAT$" ON "SYS"."COLUMN_STAT$" ("OBJ#", "COLID", "STAT_TYPE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
