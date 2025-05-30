--------------------------------------------------------
--  Constraints for Table XSDB$SCHEMA_ACL
--------------------------------------------------------

  ALTER TABLE "SYS"."XSDB$SCHEMA_ACL" MODIFY ("ACL_PATH" NOT NULL ENABLE);
  ALTER TABLE "SYS"."XSDB$SCHEMA_ACL" ADD PRIMARY KEY ("SCHEMA_NAME")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM"  ENABLE;
