--------------------------------------------------------
--  DDL for Index I_INDSUBPART_POBJSUBPART$
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."I_INDSUBPART_POBJSUBPART$" ON "SYS"."INDSUBPART$" ("POBJ#", "SUBPART#") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
