--------------------------------------------------------
--  DDL for Index I_OLAP_CALCULATED_MEMBERS$
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."I_OLAP_CALCULATED_MEMBERS$" ON "SYS"."OLAP_CALCULATED_MEMBERS$" ("DIM_OBJ#", "MEMBER_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
