--------------------------------------------------------
--  DDL for Table RULE_SET_VE$
--------------------------------------------------------

  CREATE TABLE "SYS"."RULE_SET_VE$" SHARING=METADATA 
   (	"RS_OBJ#" NUMBER, 
	"EC_OBJ#" NUMBER, 
	"VAR_ID" NUMBER, 
	"NUM_ATTRS" NUMBER, 
	"NUM_MTHDS" NUMBER, 
	"SRCHATTRS" RAW(2000)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSTEM" ;
