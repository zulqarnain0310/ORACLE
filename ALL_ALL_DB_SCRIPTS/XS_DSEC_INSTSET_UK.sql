--------------------------------------------------------
--  DDL for Index XS$DSEC_INSTSET_UK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."XS$DSEC_INSTSET_UK" ON "SYS"."XS$INSTSET_LIST" ("XDSID#", "ORDER#") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
