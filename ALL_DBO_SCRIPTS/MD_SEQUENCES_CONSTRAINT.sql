--------------------------------------------------------
--  Constraints for Table MD_SEQUENCES
--------------------------------------------------------

  ALTER TABLE "RBL_MISDB_PROD"."MD_SEQUENCES" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "RBL_MISDB_PROD"."MD_SEQUENCES" MODIFY ("SCHEMA_ID_FK" NOT NULL ENABLE);
  ALTER TABLE "RBL_MISDB_PROD"."MD_SEQUENCES" MODIFY ("NAME" NOT NULL ENABLE);
  ALTER TABLE "RBL_MISDB_PROD"."MD_SEQUENCES" MODIFY ("SEQ_START" NOT NULL ENABLE);
  ALTER TABLE "RBL_MISDB_PROD"."MD_SEQUENCES" MODIFY ("INCR" NOT NULL ENABLE);
  ALTER TABLE "RBL_MISDB_PROD"."MD_SEQUENCES" MODIFY ("SECURITY_GROUP_ID" NOT NULL ENABLE);
  ALTER TABLE "RBL_MISDB_PROD"."MD_SEQUENCES" MODIFY ("CREATED_ON" NOT NULL ENABLE);
  ALTER TABLE "RBL_MISDB_PROD"."MD_SEQUENCES" MODIFY ("CREATED_BY" NOT NULL ENABLE);
  ALTER TABLE "RBL_MISDB_PROD"."MD_SEQUENCES" ADD CONSTRAINT "MD_SEQUENCES_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS"  ENABLE;
