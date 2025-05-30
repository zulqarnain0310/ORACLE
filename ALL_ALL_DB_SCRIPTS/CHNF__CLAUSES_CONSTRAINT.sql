--------------------------------------------------------
--  Constraints for Table CHNF$_CLAUSES
--------------------------------------------------------

  ALTER TABLE "SYS"."CHNF$_CLAUSES" ADD PRIMARY KEY ("CLAUSEID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX"  ENABLE;
