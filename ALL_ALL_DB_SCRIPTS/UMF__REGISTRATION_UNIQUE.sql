--------------------------------------------------------
--  DDL for Index UMF$_REGISTRATION_UNIQUE
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."UMF$_REGISTRATION_UNIQUE" ON "SYS"."UMF$_REGISTRATION" ("NODE_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
