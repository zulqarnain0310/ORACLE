--------------------------------------------------------
--  DDL for Table RULE_SET_PR$
--------------------------------------------------------

  CREATE TABLE "SYS"."RULE_SET_PR$" SHARING=METADATA 
   (	"RS_OBJ#" NUMBER, 
	"EC_OBJ#" NUMBER, 
	"RULE_ID" NUMBER, 
	"RULE_OR_PIECE" NUMBER, 
	"ROP_ID" NUMBER, 
	"AROP_ID" NUMBER, 
	"EVAL_ID" NUMBER, 
	"PR_ID" NUMBER, 
	"VALUE" RAW(300), 
	 PRIMARY KEY ("RS_OBJ#", "EC_OBJ#", "RULE_ID", "RULE_OR_PIECE", "ROP_ID", "AROP_ID", "EVAL_ID", "PR_ID") ENABLE
   ) ORGANIZATION INDEX NOCOMPRESS PCTFREE 10 INITRANS 2 MAXTRANS 255 LOGGING
  STORAGE(
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" 
 PCTTHRESHOLD 50 OVERFLOW
 PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 LOGGING
  TABLESPACE "SYSAUX" ;
