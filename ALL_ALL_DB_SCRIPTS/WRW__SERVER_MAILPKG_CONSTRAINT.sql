--------------------------------------------------------
--  Constraints for Table WRW$_SERVER_MAILPKG
--------------------------------------------------------

  ALTER TABLE "SYS"."WRW$_SERVER_MAILPKG" MODIFY ("CLIENT_NAME" NOT NULL ENABLE);
  ALTER TABLE "SYS"."WRW$_SERVER_MAILPKG" MODIFY ("SEQ_NUM" NOT NULL ENABLE);
  ALTER TABLE "SYS"."WRW$_SERVER_MAILPKG" MODIFY ("MPK_NAME" NOT NULL ENABLE);
  ALTER TABLE "SYS"."WRW$_SERVER_MAILPKG" MODIFY ("MAILBOX" NOT NULL ENABLE);
  ALTER TABLE "SYS"."WRW$_SERVER_MAILPKG" MODIFY ("DBID" NOT NULL ENABLE);
  ALTER TABLE "SYS"."WRW$_SERVER_MAILPKG" ADD CONSTRAINT "WRW$_SERVER_MAILPKG_PK" PRIMARY KEY ("CLIENT_NAME", "SEQ_NUM")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX"  ENABLE;
