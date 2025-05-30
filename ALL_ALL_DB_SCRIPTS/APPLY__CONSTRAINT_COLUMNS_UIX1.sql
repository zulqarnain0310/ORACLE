--------------------------------------------------------
--  DDL for Index APPLY$_CONSTRAINT_COLUMNS_UIX1
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."APPLY$_CONSTRAINT_COLUMNS_UIX1" ON "SYS"."APPLY$_CONSTRAINT_COLUMNS" ("OWNER", "NAME", "CONSTRAINT_NAME", "CNAME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
