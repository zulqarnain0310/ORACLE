--------------------------------------------------------
--  Constraints for Table UMF$_TOPOLOGY
--------------------------------------------------------

  ALTER TABLE "SYS"."UMF$_TOPOLOGY" MODIFY ("TOPOLOGY_NAME" NOT NULL ENABLE);
  ALTER TABLE "SYS"."UMF$_TOPOLOGY" MODIFY ("TOPOLOGY_VERSION" NOT NULL ENABLE);
  ALTER TABLE "SYS"."UMF$_TOPOLOGY" MODIFY ("TOPOLOGY_STATE" NOT NULL ENABLE);
  ALTER TABLE "SYS"."UMF$_TOPOLOGY" ADD CONSTRAINT "UMF$_TOPOLOGY_PK" PRIMARY KEY ("TOPOLOGY_NAME")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX"  ENABLE;
