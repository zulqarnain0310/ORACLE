--------------------------------------------------------
--  Constraints for Table DBFS$_MOUNTS
--------------------------------------------------------

  ALTER TABLE "SYS"."DBFS$_MOUNTS" MODIFY ("S_OWNER" NOT NULL ENABLE);
  ALTER TABLE "SYS"."DBFS$_MOUNTS" MODIFY ("S_NAME" NOT NULL ENABLE);
  ALTER TABLE "SYS"."DBFS$_MOUNTS" MODIFY ("CREATED" NOT NULL ENABLE);
  ALTER TABLE "SYS"."DBFS$_MOUNTS" ADD UNIQUE ("S_PROPS") RELY
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "SYS"."DBFS$_MOUNTS" ADD UNIQUE ("S_OWNER", "S_MOUNT")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM"  ENABLE;
