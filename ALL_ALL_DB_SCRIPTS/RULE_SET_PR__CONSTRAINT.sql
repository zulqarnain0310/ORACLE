--------------------------------------------------------
--  Constraints for Table RULE_SET_PR$
--------------------------------------------------------

  ALTER TABLE "SYS"."RULE_SET_PR$" MODIFY ("PR_ID" NOT NULL ENABLE);
  ALTER TABLE "SYS"."RULE_SET_PR$" ADD PRIMARY KEY ("RS_OBJ#", "EC_OBJ#", "RULE_ID", "RULE_OR_PIECE", "ROP_ID", "AROP_ID", "EVAL_ID", "PR_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX"  ENABLE;
