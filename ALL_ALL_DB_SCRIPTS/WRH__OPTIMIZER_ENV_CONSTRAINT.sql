--------------------------------------------------------
--  Constraints for Table WRH$_OPTIMIZER_ENV
--------------------------------------------------------

  ALTER TABLE "SYS"."WRH$_OPTIMIZER_ENV" MODIFY ("DBID" NOT NULL ENABLE);
  ALTER TABLE "SYS"."WRH$_OPTIMIZER_ENV" MODIFY ("OPTIMIZER_ENV_HASH_VALUE" NOT NULL ENABLE);
  ALTER TABLE "SYS"."WRH$_OPTIMIZER_ENV" MODIFY ("CON_DBID" NOT NULL ENABLE);
  ALTER TABLE "SYS"."WRH$_OPTIMIZER_ENV" ADD CONSTRAINT "WRH$_OPTIMIZER_ENV_PK" PRIMARY KEY ("DBID", "OPTIMIZER_ENV_HASH_VALUE", "CON_DBID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX"  ENABLE;
