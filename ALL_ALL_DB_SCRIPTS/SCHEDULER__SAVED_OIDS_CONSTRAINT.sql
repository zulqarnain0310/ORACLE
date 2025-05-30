--------------------------------------------------------
--  Constraints for Table SCHEDULER$_SAVED_OIDS
--------------------------------------------------------

  ALTER TABLE "SYS"."SCHEDULER$_SAVED_OIDS" MODIFY ("OIDIDX" NOT NULL ENABLE);
  ALTER TABLE "SYS"."SCHEDULER$_SAVED_OIDS" MODIFY ("SAVEDOID" NOT NULL ENABLE);
  ALTER TABLE "SYS"."SCHEDULER$_SAVED_OIDS" ADD CONSTRAINT "SCHEDULER$_SOID_PK" PRIMARY KEY ("OIDIDX")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
