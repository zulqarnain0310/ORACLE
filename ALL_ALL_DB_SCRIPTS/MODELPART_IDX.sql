--------------------------------------------------------
--  DDL for Index MODELPART$IDX
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."MODELPART$IDX" ON "SYS"."MODELPART$" ("MOD#", "PART#", "POS#") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE( MAXEXTENTS 2147483645)
  TABLESPACE "SYSTEM" ;
