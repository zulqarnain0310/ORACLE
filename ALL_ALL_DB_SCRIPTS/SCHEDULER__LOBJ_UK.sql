--------------------------------------------------------
--  DDL for Index SCHEDULER$_LOBJ_UK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."SCHEDULER$_LOBJ_UK" ON "SYS"."SCHEDULER$_LWJOB_OBJ" ("USERID", "NAME", "SUBNAME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
