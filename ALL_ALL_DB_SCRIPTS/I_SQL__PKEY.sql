--------------------------------------------------------
--  DDL for Index I_SQL$_PKEY
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."I_SQL$_PKEY" ON "SYS"."SQL$" ("SIGNATURE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
