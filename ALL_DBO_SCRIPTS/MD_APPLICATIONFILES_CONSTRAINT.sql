--------------------------------------------------------
--  Constraints for Table MD_APPLICATIONFILES
--------------------------------------------------------

  ALTER TABLE "RBL_MISDB_PROD"."MD_APPLICATIONFILES" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "RBL_MISDB_PROD"."MD_APPLICATIONFILES" MODIFY ("APPLICATIONS_ID_FK" NOT NULL ENABLE);
  ALTER TABLE "RBL_MISDB_PROD"."MD_APPLICATIONFILES" MODIFY ("NAME" NOT NULL ENABLE);
  ALTER TABLE "RBL_MISDB_PROD"."MD_APPLICATIONFILES" MODIFY ("URI" NOT NULL ENABLE);
  ALTER TABLE "RBL_MISDB_PROD"."MD_APPLICATIONFILES" MODIFY ("TYPE" NOT NULL ENABLE);
  ALTER TABLE "RBL_MISDB_PROD"."MD_APPLICATIONFILES" MODIFY ("STATE" NOT NULL ENABLE);
  ALTER TABLE "RBL_MISDB_PROD"."MD_APPLICATIONFILES" MODIFY ("SECURITY_GROUP_ID" NOT NULL ENABLE);
  ALTER TABLE "RBL_MISDB_PROD"."MD_APPLICATIONFILES" MODIFY ("CREATED_ON" NOT NULL ENABLE);
  ALTER TABLE "RBL_MISDB_PROD"."MD_APPLICATIONFILES" ADD CONSTRAINT "MD_APPLICATIONFILES_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS"  ENABLE;
