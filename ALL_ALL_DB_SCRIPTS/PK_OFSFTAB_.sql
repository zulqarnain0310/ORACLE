--------------------------------------------------------
--  DDL for Index PK_OFSFTAB$
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."PK_OFSFTAB$" ON "SYS"."OFSFTAB$" ("FSTYPE", "FSNAME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
