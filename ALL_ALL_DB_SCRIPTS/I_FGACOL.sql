--------------------------------------------------------
--  DDL for Index I_FGACOL
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."I_FGACOL" ON "SYS"."FGACOL$" ("OBJ#", "PNAME", "INTCOL#") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
