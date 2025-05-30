--------------------------------------------------------
--  DDL for Table EVCOL$
--------------------------------------------------------

  CREATE TABLE "SYS"."EVCOL$" SHARING=METADATA 
   (	"EV_OBJ#" NUMBER, 
	"EV_COL_ID" NUMBER, 
	"BASE_TBL_COL_NAME" VARCHAR2(128 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSTEM" ;
