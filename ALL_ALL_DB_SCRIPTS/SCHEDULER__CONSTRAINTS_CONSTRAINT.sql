--------------------------------------------------------
--  Constraints for Table SCHEDULER$_CONSTRAINTS
--------------------------------------------------------

  ALTER TABLE "SYS"."SCHEDULER$_CONSTRAINTS" ADD CONSTRAINT "SCHEDULER$_CONST_PK" PRIMARY KEY ("OID", "RESOID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM"  ENABLE;
