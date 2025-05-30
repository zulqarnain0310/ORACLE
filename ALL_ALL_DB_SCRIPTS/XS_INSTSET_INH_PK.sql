--------------------------------------------------------
--  DDL for Index XS$INSTSET_INH_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."XS$INSTSET_INH_PK" ON "SYS"."XS$INSTSET_INH" ("XDSID#", "ORDER#") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
