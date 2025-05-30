--------------------------------------------------------
--  DDL for Index XS$ACL_PARAM_I1
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."XS$ACL_PARAM_I1" ON "SYS"."XS$ACL_PARAM" ("PNAME", "XDSID#", "ACL#") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
