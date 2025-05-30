--------------------------------------------------------
--  Constraints for Table ADVSECURITYDETAIL
--------------------------------------------------------

  ALTER TABLE "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" MODIFY ("SECURITYENTITYID" NOT NULL ENABLE);
  ALTER TABLE "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" MODIFY ("REFCUSTOMERID" NOT NULL ENABLE);
  ALTER TABLE "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" MODIFY ("EFFECTIVEFROMTIMEKEY" NOT NULL ENABLE);
  ALTER TABLE "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" MODIFY ("EFFECTIVETOTIMEKEY" NOT NULL ENABLE);
  ALTER TABLE "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" ADD CONSTRAINT "ADVSECURITYDETAIL_ACCOUNTENTITYID" PRIMARY KEY ("SECURITYENTITYID", "EFFECTIVEFROMTIMEKEY", "EFFECTIVETOTIMEKEY")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" ADD CONSTRAINT "CK__ADVSECURI__EFFEC__5A686B87" CHECK (
   ( EffectiveToTimeKey = (49999) )
) ENABLE;
