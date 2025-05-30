--------------------------------------------------------
--  Constraints for Table SYSDBIMFSDBA$
--------------------------------------------------------

  ALTER TABLE "SYS"."SYSDBIMFSDBA$" ADD CONSTRAINT "SYSDBIMFSDBA_PK$" PRIMARY KEY ("SEGID", "BASEDBA")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSAUX"  ENABLE;
