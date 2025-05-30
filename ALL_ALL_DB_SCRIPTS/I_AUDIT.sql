--------------------------------------------------------
--  DDL for Index I_AUDIT
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."I_AUDIT" ON "SYS"."AUDIT$" ("USER#", "PROXY#", "OPTION#") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
