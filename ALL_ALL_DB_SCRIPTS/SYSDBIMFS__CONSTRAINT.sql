--------------------------------------------------------
--  Constraints for Table SYSDBIMFS$
--------------------------------------------------------

  ALTER TABLE "SYS"."SYSDBIMFS$" ADD CHECK (valid='T' or valid='F') ENABLE;
  ALTER TABLE "SYS"."SYSDBIMFS$" ADD CHECK (endness='B' or endness='L') ENABLE;
  ALTER TABLE "SYS"."SYSDBIMFS$" ADD CONSTRAINT "SYSDBIMFS_PK$" PRIMARY KEY ("CUID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX"  ENABLE;
