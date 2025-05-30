--------------------------------------------------------
--  Ref Constraints for Table MD_USER_PRIVILEGES
--------------------------------------------------------

  ALTER TABLE "ACL_RBL_MISDB_PROD"."MD_USER_PRIVILEGES" ADD CONSTRAINT "MD_USER_PRIVILEGES_MD_PRI_FK1" FOREIGN KEY ("PRIVILEGE_ID_FK")
	  REFERENCES "ACL_RBL_MISDB_PROD"."MD_PRIVILEGES" ("ID") ON DELETE CASCADE ENABLE;
  ALTER TABLE "ACL_RBL_MISDB_PROD"."MD_USER_PRIVILEGES" ADD CONSTRAINT "MD_USER_PRIVILEGES_MD_USE_FK1" FOREIGN KEY ("USER_ID_FK")
	  REFERENCES "ACL_RBL_MISDB_PROD"."MD_USERS" ("ID") ON DELETE CASCADE ENABLE;
