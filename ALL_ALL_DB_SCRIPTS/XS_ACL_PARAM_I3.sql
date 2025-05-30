--------------------------------------------------------
--  DDL for Index XS$ACL_PARAM_I3
--------------------------------------------------------

  CREATE INDEX "SYS"."XS$ACL_PARAM_I3" ON "SYS"."XS$ACL_PARAM" (SUBSTRB("PVALUE2",1,2000)) 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
