--------------------------------------------------------
--  DDL for Index XS$INSTSET_INH_KEY_UK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."XS$INSTSET_INH_KEY_UK" ON "SYS"."XS$INSTSET_INH_KEY" ("XDSID#", "ORDER#", "PKEY") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
