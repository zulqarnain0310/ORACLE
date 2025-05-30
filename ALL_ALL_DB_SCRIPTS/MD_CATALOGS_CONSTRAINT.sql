--------------------------------------------------------
--  Constraints for Table MD_CATALOGS
--------------------------------------------------------

  ALTER TABLE "SYS"."MD_CATALOGS" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "SYS"."MD_CATALOGS" MODIFY ("CONNECTION_ID_FK" NOT NULL ENABLE);
  ALTER TABLE "SYS"."MD_CATALOGS" MODIFY ("SECURITY_GROUP_ID" NOT NULL ENABLE);
  ALTER TABLE "SYS"."MD_CATALOGS" MODIFY ("CREATED_ON" NOT NULL ENABLE);
  ALTER TABLE "SYS"."MD_CATALOGS" ADD CONSTRAINT "MD_CATALOGS_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
