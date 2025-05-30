--------------------------------------------------------
--  DDL for Index I_RULE_SET_VE
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."I_RULE_SET_VE" ON "SYS"."RULE_SET_VE$" ("RS_OBJ#", "EC_OBJ#", "VAR_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
