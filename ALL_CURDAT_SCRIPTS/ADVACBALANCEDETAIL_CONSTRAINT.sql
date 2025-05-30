--------------------------------------------------------
--  Constraints for Table ADVACBALANCEDETAIL
--------------------------------------------------------

  ALTER TABLE "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL" MODIFY ("ENTITYKEY" NOT NULL ENABLE);
  ALTER TABLE "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL" MODIFY ("ACCOUNTENTITYID" NOT NULL ENABLE);
  ALTER TABLE "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL" MODIFY ("EFFECTIVEFROMTIMEKEY" NOT NULL ENABLE);
  ALTER TABLE "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL" MODIFY ("EFFECTIVETOTIMEKEY" NOT NULL ENABLE);
  ALTER TABLE "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL" ADD CONSTRAINT "ADVACBALANCEDETAIL_ACCOUNTENTITYID" PRIMARY KEY ("ACCOUNTENTITYID", "EFFECTIVEFROMTIMEKEY", "EFFECTIVETOTIMEKEY")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL" ADD CONSTRAINT "CK__ADVACBALA__EFFEC__02AB670B" CHECK (
   ( EffectiveToTimeKey = (49999) )
) ENABLE;
