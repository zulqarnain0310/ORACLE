--------------------------------------------------------
--  DDL for Index I_SQL$TEXT_PKEY
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."I_SQL$TEXT_PKEY" ON "SYS"."SQL$TEXT" ("SIGNATURE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
