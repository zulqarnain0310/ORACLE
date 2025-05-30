--------------------------------------------------------
--  Constraints for Table SQLOBJ$PLAN
--------------------------------------------------------

  ALTER TABLE "SYS"."SQLOBJ$PLAN" ADD CONSTRAINT "SQLOBJ$PLAN_PKEY" PRIMARY KEY ("SIGNATURE", "CATEGORY", "OBJ_TYPE", "PLAN_ID", "ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX"  ENABLE;
