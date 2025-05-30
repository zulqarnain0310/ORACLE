--------------------------------------------------------
--  DDL for Index I_PROXY_ROLE_INFO$_1
--------------------------------------------------------

  CREATE INDEX "SYS"."I_PROXY_ROLE_INFO$_1" ON "SYS"."PROXY_ROLE_INFO$" ("CLIENT#", "PROXY#") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
