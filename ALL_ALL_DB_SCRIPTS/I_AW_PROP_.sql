--------------------------------------------------------
--  DDL for Index I_AW_PROP$
--------------------------------------------------------

  CREATE INDEX "SYS"."I_AW_PROP$" ON "SYS"."AW_PROP$" ("AWSEQ#", "OID", "PROPNAME", "GEN#") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
