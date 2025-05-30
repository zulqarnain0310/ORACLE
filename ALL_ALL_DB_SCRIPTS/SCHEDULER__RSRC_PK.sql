--------------------------------------------------------
--  DDL for Index SCHEDULER$_RSRC_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."SCHEDULER$_RSRC_PK" ON "SYS"."SCHEDULER$_RESOURCES" ("OBJ#") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
