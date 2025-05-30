--------------------------------------------------------
--  DDL for Index I_SQL$TEXT_HANDLE
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."I_SQL$TEXT_HANDLE" ON "SYS"."SQL$TEXT" ("SQL_HANDLE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
