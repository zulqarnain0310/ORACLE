--------------------------------------------------------
--  Constraints for Table WRH$_TABLESPACE_SPACE_USAGE
--------------------------------------------------------

  ALTER TABLE "SYS"."WRH$_TABLESPACE_SPACE_USAGE" MODIFY ("DBID" NOT NULL ENABLE);
  ALTER TABLE "SYS"."WRH$_TABLESPACE_SPACE_USAGE" MODIFY ("CON_DBID" NOT NULL ENABLE);
