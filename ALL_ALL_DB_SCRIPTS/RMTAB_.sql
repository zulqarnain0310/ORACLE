--------------------------------------------------------
--  DDL for Table RMTAB$
--------------------------------------------------------

  CREATE TABLE "SYS"."RMTAB$" SHARING=METADATA 
   (	"OBJ#" NUMBER, 
	"STAB#" NUMBER, 
	"SOBJ#" NUMBER, 
	"SOBJD#" NUMBER, 
	"TTAB#" NUMBER, 
	"TOBJ#" NUMBER, 
	"TOBJD#" NUMBER, 
	"MFLAGS" NUMBER, 
	"NAME" VARCHAR2(128 BYTE), 
	"USER#" NUMBER
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSTEM" ;
