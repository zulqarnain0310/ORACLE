--------------------------------------------------------
--  Constraints for Table SQLOBJ$
--------------------------------------------------------

  ALTER TABLE "SYS"."SQLOBJ$" MODIFY ("NAME" NOT NULL ENABLE);
  ALTER TABLE "SYS"."SQLOBJ$" MODIFY ("FLAGS" NOT NULL ENABLE);
  ALTER TABLE "SYS"."SQLOBJ$" ADD CONSTRAINT "SQLOBJ$_PKEY" PRIMARY KEY ("SIGNATURE", "CATEGORY", "OBJ_TYPE", "PLAN_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX"  ENABLE;
