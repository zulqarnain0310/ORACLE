--------------------------------------------------------
--  DDL for Index SCHEDULER$_LOBJ_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."SCHEDULER$_LOBJ_PK" ON "SYS"."SCHEDULER$_LWJOB_OBJ" ("OBJ#") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
