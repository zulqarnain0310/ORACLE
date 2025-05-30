--------------------------------------------------------
--  DDL for Table JIJOIN$
--------------------------------------------------------

  CREATE TABLE "SYS"."JIJOIN$" SHARING=METADATA 
   (	"OBJ#" NUMBER, 
	"TAB1OBJ#" NUMBER, 
	"TAB1COL#" NUMBER, 
	"TAB2OBJ#" NUMBER, 
	"TAB2COL#" NUMBER, 
	"JOINOP" NUMBER, 
	"FLAGS" NUMBER, 
	"TAB1INST#" NUMBER DEFAULT 0, 
	"TAB2INST#" NUMBER DEFAULT 0      /* instance of table 2 (for multiple refs) */
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSTEM" ;
