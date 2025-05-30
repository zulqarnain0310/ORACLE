--------------------------------------------------------
--  DDL for Index I_ILM$
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."I_ILM$" ON "SYS"."ILM$" ("NAME", "OWNER#") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
