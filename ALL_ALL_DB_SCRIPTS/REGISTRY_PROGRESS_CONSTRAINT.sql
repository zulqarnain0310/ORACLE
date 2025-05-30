--------------------------------------------------------
--  Constraints for Table REGISTRY$PROGRESS
--------------------------------------------------------

  ALTER TABLE "SYS"."REGISTRY$PROGRESS" ADD CONSTRAINT "REGISTRY_PROGRESS_PK" PRIMARY KEY ("CID", "NAMESPACE", "ACTION")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM"  ENABLE;
