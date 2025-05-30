--------------------------------------------------------
--  DDL for Index WRI$_ADV_DIRINST_IDX_02
--------------------------------------------------------

  CREATE INDEX "SYS"."WRI$_ADV_DIRINST_IDX_02" ON "SYS"."WRI$_ADV_DIRECTIVE_INSTANCES" ("TASK_ID", "NAME", "DIR_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
