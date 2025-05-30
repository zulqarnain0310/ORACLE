--------------------------------------------------------
--  DDL for Index I_PROXY_INFO$
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."I_PROXY_INFO$" ON "SYS"."PROXY_INFO$" ("CLIENT#", "PROXY#") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
