--------------------------------------------------------
--  DDL for Index WI$_OBJECT_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."WI$_OBJECT_PK" ON "SYS"."WI$_OBJECT" ("JOBID", "TEMPLATEID", "OBJECTID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
