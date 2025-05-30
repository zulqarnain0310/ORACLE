--------------------------------------------------------
--  DDL for Index I_CONDATA1
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."I_CONDATA1" ON "SYS"."CONDATA$" ("USER#", "OBJ#", "CON#") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
