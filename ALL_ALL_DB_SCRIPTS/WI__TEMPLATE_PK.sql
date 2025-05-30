--------------------------------------------------------
--  DDL for Index WI$_TEMPLATE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."WI$_TEMPLATE_PK" ON "SYS"."WI$_TEMPLATE" ("JOBID", "TEMPLATEID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
