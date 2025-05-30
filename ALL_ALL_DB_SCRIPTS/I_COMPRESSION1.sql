--------------------------------------------------------
--  DDL for Index I_COMPRESSION1
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."I_COMPRESSION1" ON "SYS"."COMPRESSION$" ("OBJ#", "ULEVEL", "MTIME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
