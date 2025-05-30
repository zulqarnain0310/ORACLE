--------------------------------------------------------
--  DDL for Index I_RXS$SESSIONS1
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."I_RXS$SESSIONS1" ON "SYS"."RXS$SESSIONS" ("COOKIE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
