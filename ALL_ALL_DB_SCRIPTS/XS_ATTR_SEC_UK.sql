--------------------------------------------------------
--  DDL for Index XS$ATTR_SEC_UK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."XS$ATTR_SEC_UK" ON "SYS"."XS$ATTR_SEC" ("XDSID#", "ATTR_NAME", "PRIV#") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
