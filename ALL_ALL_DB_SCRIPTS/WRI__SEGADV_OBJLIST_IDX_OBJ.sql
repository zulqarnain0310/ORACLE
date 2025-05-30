--------------------------------------------------------
--  DDL for Index WRI$_SEGADV_OBJLIST_IDX_OBJ
--------------------------------------------------------

  CREATE INDEX "SYS"."WRI$_SEGADV_OBJLIST_IDX_OBJ" ON "SYS"."WRI$_SEGADV_OBJLIST" ("TS_ID", "OBJN", "OBJD") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
