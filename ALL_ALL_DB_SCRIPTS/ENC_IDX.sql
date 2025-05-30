--------------------------------------------------------
--  DDL for Index ENC_IDX
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."ENC_IDX" ON "SYS"."ENC$" ("OBJ#", "OWNER#") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
