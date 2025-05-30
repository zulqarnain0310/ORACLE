--------------------------------------------------------
--  Constraints for Table HANG_MANAGER_PARAMETERS
--------------------------------------------------------

  ALTER TABLE "SYS"."HANG_MANAGER_PARAMETERS" ADD CONSTRAINT "NAME_PK" PRIMARY KEY ("NAME")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM"  ENABLE;
