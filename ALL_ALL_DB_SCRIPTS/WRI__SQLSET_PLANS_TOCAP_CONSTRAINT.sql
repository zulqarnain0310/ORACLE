--------------------------------------------------------
--  Constraints for Table WRI$_SQLSET_PLANS_TOCAP
--------------------------------------------------------

  ALTER TABLE "SYS"."WRI$_SQLSET_PLANS_TOCAP" ADD CONSTRAINT "WRI$_SQLSET_PLANS_TOCAP_PK" PRIMARY KEY ("STMT_ID", "PLAN_HASH_VALUE", "CON_DBID") ENABLE;
