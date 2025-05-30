--------------------------------------------------------
--  Constraints for Table LOGMNR_BUILDLOG
--------------------------------------------------------

  ALTER TABLE "SYS"."LOGMNR_BUILDLOG" ADD CONSTRAINT "LOGMNR_BUILDLOG_PK" PRIMARY KEY ("INITIAL_XID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM"  ENABLE;
