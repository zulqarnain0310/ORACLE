--------------------------------------------------------
--  DDL for Index I_XSTREAM_PRIVILEGES
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."I_XSTREAM_PRIVILEGES" ON "SYS"."XSTREAM$_PRIVILEGES" ("USERNAME", "PRIVILEGE_TYPE", "PRIVILEGE_LEVEL") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
