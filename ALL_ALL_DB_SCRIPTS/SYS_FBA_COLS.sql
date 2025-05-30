--------------------------------------------------------
--  DDL for Table SYS_FBA_COLS
--------------------------------------------------------

  CREATE TABLE "SYS"."SYS_FBA_COLS" SHARING=METADATA 
   (	"OBJ#" NUMBER, 
	"COLUMNNAME" VARCHAR2(255 BYTE), 
	"FLAGS" NUMBER, 
	"SPARE" NUMBER
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSTEM" ;
