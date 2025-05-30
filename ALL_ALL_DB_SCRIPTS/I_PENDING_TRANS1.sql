--------------------------------------------------------
--  DDL for Index I_PENDING_TRANS1
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."I_PENDING_TRANS1" ON "SYS"."PENDING_TRANS$" ("LOCAL_TRAN_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
