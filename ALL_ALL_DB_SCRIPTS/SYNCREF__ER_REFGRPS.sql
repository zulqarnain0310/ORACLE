--------------------------------------------------------
--  DDL for Table SYNCREF$_ER_REFGRPS
--------------------------------------------------------

  CREATE TABLE "SYS"."SYNCREF$_ER_REFGRPS" SHARING=METADATA 
   (	"GROUP_ID" NUMBER, 
	"REF_GRP_NUM" NUMBER, 
	"MV_OBJ#" NUMBER, 
	"STATUS" NUMBER, 
	"FIRST_STMT" NUMBER, 
	"LAST_STMT" NUMBER
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSTEM" ;
