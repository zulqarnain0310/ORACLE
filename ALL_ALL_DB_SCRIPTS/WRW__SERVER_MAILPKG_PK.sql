--------------------------------------------------------
--  DDL for Index WRW$_SERVER_MAILPKG_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."WRW$_SERVER_MAILPKG_PK" ON "SYS"."WRW$_SERVER_MAILPKG" ("CLIENT_NAME", "SEQ_NUM") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX" ;
