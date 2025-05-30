--------------------------------------------------------
--  Constraints for Table SCHEDULER$_RESOURCES
--------------------------------------------------------

  ALTER TABLE "SYS"."SCHEDULER$_RESOURCES" ADD CONSTRAINT "SCHEDULER$_RSRC_PK" PRIMARY KEY ("OBJ#")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM"  ENABLE;
