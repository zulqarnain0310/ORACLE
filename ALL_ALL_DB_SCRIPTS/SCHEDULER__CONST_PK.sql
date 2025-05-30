--------------------------------------------------------
--  DDL for Index SCHEDULER$_CONST_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."SCHEDULER$_CONST_PK" ON "SYS"."SCHEDULER$_CONSTRAINTS" ("OID", "RESOID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
