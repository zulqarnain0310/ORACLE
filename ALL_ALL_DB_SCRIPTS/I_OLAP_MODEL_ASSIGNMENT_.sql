--------------------------------------------------------
--  DDL for Index I_OLAP_MODEL_ASSIGNMENT$
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."I_OLAP_MODEL_ASSIGNMENT$" ON "SYS"."OLAP_MODEL_ASSIGNMENTS$" ("MODEL_ID", "ORDER_NUM") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
