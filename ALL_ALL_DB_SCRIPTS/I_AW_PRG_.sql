--------------------------------------------------------
--  DDL for Index I_AW_PRG$
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."I_AW_PRG$" ON "SYS"."AW_PRG$" ("AWSEQ#", "OID", "GEN#", "STM#") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
