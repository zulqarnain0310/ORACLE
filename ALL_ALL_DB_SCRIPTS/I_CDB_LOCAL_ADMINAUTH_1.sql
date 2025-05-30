--------------------------------------------------------
--  DDL for Index I_CDB_LOCAL_ADMINAUTH_1
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."I_CDB_LOCAL_ADMINAUTH_1" ON "SYS"."CDB_LOCAL_ADMINAUTH$" ("CON_UID", "GRANTEE$") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
