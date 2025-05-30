--------------------------------------------------------
--  DDL for Index IS_DBFS$_MOUNTS
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."IS_DBFS$_MOUNTS" ON "SYS"."DBFS$_MOUNTS" (DECODE("S_MOUNT",NULL,"S_OWNER",NULL)) 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
