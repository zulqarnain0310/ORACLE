--------------------------------------------------------
--  Constraints for Table REGISTRY$SQLPATCH_RU_INFO
--------------------------------------------------------

  ALTER TABLE "SYS"."REGISTRY$SQLPATCH_RU_INFO" ADD CONSTRAINT "REGISTRY$SQLPATCH_RU_INFO_PK" PRIMARY KEY ("PATCH_ID", "PATCH_UID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM"  ENABLE;
