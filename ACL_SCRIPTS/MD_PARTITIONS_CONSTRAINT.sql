--------------------------------------------------------
--  Constraints for Table MD_PARTITIONS
--------------------------------------------------------

  ALTER TABLE "ACL_RBL_MISDB_PROD"."MD_PARTITIONS" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "ACL_RBL_MISDB_PROD"."MD_PARTITIONS" MODIFY ("TABLE_ID_FK" NOT NULL ENABLE);
  ALTER TABLE "ACL_RBL_MISDB_PROD"."MD_PARTITIONS" MODIFY ("SECURITY_GROUP_ID" NOT NULL ENABLE);
  ALTER TABLE "ACL_RBL_MISDB_PROD"."MD_PARTITIONS" MODIFY ("CREATED_ON" NOT NULL ENABLE);
  ALTER TABLE "ACL_RBL_MISDB_PROD"."MD_PARTITIONS" ADD CONSTRAINT "MD_PARTITIONS_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS"  ENABLE;
