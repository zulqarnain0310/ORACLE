--------------------------------------------------------
--  Constraints for Table BDSQL_USER_MAP
--------------------------------------------------------

  ALTER TABLE "SYS"."BDSQL_USER_MAP" MODIFY ("CLUSTER_NAME" NOT NULL ENABLE);
  ALTER TABLE "SYS"."BDSQL_USER_MAP" MODIFY ("CURRENT_DATABASE_USER" NOT NULL ENABLE);
  ALTER TABLE "SYS"."BDSQL_USER_MAP" MODIFY ("SYSCONTEXT_PARM_HADOOP_USER" NOT NULL ENABLE);
