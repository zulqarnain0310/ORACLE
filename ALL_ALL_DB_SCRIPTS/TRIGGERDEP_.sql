--------------------------------------------------------
--  DDL for Table TRIGGERDEP$
--------------------------------------------------------

  CREATE TABLE "SYS"."TRIGGERDEP$" SHARING=METADATA 
   (	"OBJ#" NUMBER, 
	"P_TRGOWNER" VARCHAR2(128 BYTE), 
	"P_TRGNAME" VARCHAR2(128 BYTE), 
	"FLAG" NUMBER, 
	"SPARE1" NUMBER, 
	"SPARE2" NUMBER
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSTEM" ;
