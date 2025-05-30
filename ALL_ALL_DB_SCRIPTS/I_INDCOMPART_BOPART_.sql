--------------------------------------------------------
--  DDL for Index I_INDCOMPART_BOPART$
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."I_INDCOMPART_BOPART$" ON "SYS"."INDCOMPART$" ("BO#", "PART#") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
