--------------------------------------------------------
--  Constraints for Table MD_USERS
--------------------------------------------------------

  ALTER TABLE "SYS"."MD_USERS" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "SYS"."MD_USERS" MODIFY ("SCHEMA_ID_FK" NOT NULL ENABLE);
  ALTER TABLE "SYS"."MD_USERS" MODIFY ("USERNAME" NOT NULL ENABLE);
  ALTER TABLE "SYS"."MD_USERS" MODIFY ("SECURITY_GROUP_ID" NOT NULL ENABLE);
  ALTER TABLE "SYS"."MD_USERS" MODIFY ("CREATED_ON" NOT NULL ENABLE);
  ALTER TABLE "SYS"."MD_USERS" ADD CONSTRAINT "MD_USERS_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
