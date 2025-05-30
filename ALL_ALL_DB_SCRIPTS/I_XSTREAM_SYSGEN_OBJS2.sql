--------------------------------------------------------
--  DDL for Index I_XSTREAM_SYSGEN_OBJS2
--------------------------------------------------------

  CREATE INDEX "SYS"."I_XSTREAM_SYSGEN_OBJS2" ON "SYS"."XSTREAM$_SYSGEN_OBJS" ("OBJECT_OWNER", "OBJECT_NAME", "OBJECT_TYPE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
