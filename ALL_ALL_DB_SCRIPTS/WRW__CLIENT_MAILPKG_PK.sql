--------------------------------------------------------
--  DDL for Index WRW$_CLIENT_MAILPKG_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."WRW$_CLIENT_MAILPKG_PK" ON "SYS"."WRW$_CLIENT_MAILPKG" ("CLIENT_NAME", "SEQ_NUM") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
