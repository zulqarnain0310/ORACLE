--------------------------------------------------------
--  Constraints for Table AUDITPUR
--------------------------------------------------------

  ALTER TABLE "RBL_MISDB_PROD"."AUDITPUR" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "RBL_MISDB_PROD"."AUDITPUR" ADD CONSTRAINT "PK__AUDITPUR__3213E83FE9DE5F2B" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS"  ENABLE;
