--------------------------------------------------------
--  Constraints for Table WRR$_MASKING_PARAMETERS
--------------------------------------------------------

  ALTER TABLE "SYS"."WRR$_MASKING_PARAMETERS" ADD CONSTRAINT "WRR$_MASKING_PARAMETERS_PK" PRIMARY KEY ("SCRIPT_ID", "NAME")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM"  ENABLE;
