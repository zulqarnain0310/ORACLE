--------------------------------------------------------
--  DDL for Index I_CDBTS1
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."I_CDBTS1" ON "SYS"."CDB_TS$" ("TS#", "CON_ID#") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
