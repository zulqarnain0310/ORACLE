--------------------------------------------------------
--  DDL for Index I_DAM_LAST_ARCH_TS$
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."I_DAM_LAST_ARCH_TS$" ON "SYS"."DAM_LAST_ARCH_TS$" ("AUDIT_TRAIL_TYPE#", "RAC_INSTANCE#", "DATABASE_ID", "CONTAINER_GUID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
