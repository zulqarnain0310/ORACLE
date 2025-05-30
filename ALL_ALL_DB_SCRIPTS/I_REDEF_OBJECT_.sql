--------------------------------------------------------
--  DDL for Index I_REDEF_OBJECT$
--------------------------------------------------------

  CREATE INDEX "SYS"."I_REDEF_OBJECT$" ON "SYS"."REDEF_OBJECT$" ("REDEF_ID", "OBJ_TYPE", "OBJ_OWNER", "OBJ_NAME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
