--------------------------------------------------------
--  DDL for Table INDREBUILD$
--------------------------------------------------------

  CREATE TABLE "SYS"."INDREBUILD$" SHARING=METADATA 
   (	"OBJ#" NUMBER, 
	"DATAOBJ#" NUMBER, 
	"TS#" NUMBER, 
	"FILE#" NUMBER, 
	"BLOCK#" NUMBER, 
	"PCTFREE$" NUMBER, 
	"INITRANS" NUMBER, 
	"MAXTRANS" NUMBER, 
	"COMPCOLS" NUMBER, 
	"FLAGS" NUMBER
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSTEM" ;
