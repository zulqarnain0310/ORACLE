--------------------------------------------------------
--  DDL for Index MODELPARTCOL$IDX
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."MODELPARTCOL$IDX" ON "SYS"."MODELPARTCOL$" ("OBJ#", "POS#") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE( MAXEXTENTS 2147483645)
  TABLESPACE "SYSTEM" ;
