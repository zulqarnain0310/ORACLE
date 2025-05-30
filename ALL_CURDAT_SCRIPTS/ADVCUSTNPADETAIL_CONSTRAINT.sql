--------------------------------------------------------
--  Constraints for Table ADVCUSTNPADETAIL
--------------------------------------------------------

  ALTER TABLE "CURDAT_RBL_MISDB_PROD"."ADVCUSTNPADETAIL" MODIFY ("ENTITYKEY" NOT NULL ENABLE);
  ALTER TABLE "CURDAT_RBL_MISDB_PROD"."ADVCUSTNPADETAIL" MODIFY ("CUSTOMERENTITYID" NOT NULL ENABLE);
  ALTER TABLE "CURDAT_RBL_MISDB_PROD"."ADVCUSTNPADETAIL" MODIFY ("EFFECTIVEFROMTIMEKEY" NOT NULL ENABLE);
  ALTER TABLE "CURDAT_RBL_MISDB_PROD"."ADVCUSTNPADETAIL" MODIFY ("EFFECTIVETOTIMEKEY" NOT NULL ENABLE);
  ALTER TABLE "CURDAT_RBL_MISDB_PROD"."ADVCUSTNPADETAIL" ADD CONSTRAINT "ADVCUSTNPADETAIL_ACCOUNTENTITYID" PRIMARY KEY ("CUSTOMERENTITYID", "EFFECTIVEFROMTIMEKEY", "EFFECTIVETOTIMEKEY")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "CURDAT_RBL_MISDB_PROD"."ADVCUSTNPADETAIL" ADD CONSTRAINT "CK__ADVCUSTNP__EFFEC__082F3637" CHECK (
   ( EffectiveToTimeKey = (49999) )
) ENABLE;
