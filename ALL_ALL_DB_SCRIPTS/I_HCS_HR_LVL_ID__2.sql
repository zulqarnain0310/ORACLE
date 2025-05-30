--------------------------------------------------------
--  DDL for Index I_HCS_HR_LVL_ID$_2
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."I_HCS_HR_LVL_ID$_2" ON "SYS"."HCS_HR_LVL_ID$" ("HIER#", "LVL_NAME", "ORDER_NUM") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
