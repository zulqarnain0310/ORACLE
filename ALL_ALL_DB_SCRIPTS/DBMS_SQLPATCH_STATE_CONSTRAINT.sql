--------------------------------------------------------
--  Constraints for Table DBMS_SQLPATCH_STATE
--------------------------------------------------------

  ALTER TABLE "SYS"."DBMS_SQLPATCH_STATE" ADD CONSTRAINT "DBMS_SQLPATCH_STATE_PK" PRIMARY KEY ("S_CURRENT_PATCH_ID", "S_CURRENT_PATCH_UID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM"  ENABLE;
