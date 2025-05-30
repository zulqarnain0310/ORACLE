--------------------------------------------------------
--  Constraints for Table SYSDBIMFSSEG$
--------------------------------------------------------

  ALTER TABLE "SYS"."SYSDBIMFSSEG$" ADD CONSTRAINT "SYSDBIMFSSEG_PK$" PRIMARY KEY ("SEGID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX"  ENABLE;
