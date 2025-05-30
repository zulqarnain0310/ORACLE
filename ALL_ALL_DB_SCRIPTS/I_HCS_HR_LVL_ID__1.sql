--------------------------------------------------------
--  DDL for Index I_HCS_HR_LVL_ID$_1
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."I_HCS_HR_LVL_ID$_1" ON "SYS"."HCS_HR_LVL_ID$" ("HIER#", "LVL_NAME", "ATTR_NAME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
