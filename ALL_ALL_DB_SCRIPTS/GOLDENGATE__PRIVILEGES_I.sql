--------------------------------------------------------
--  DDL for Index GOLDENGATE$_PRIVILEGES_I
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."GOLDENGATE$_PRIVILEGES_I" ON "SYS"."GOLDENGATE$_PRIVILEGES" ("USERNAME", "PRIVILEGE_TYPE", "PRIVILEGE_LEVEL") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
