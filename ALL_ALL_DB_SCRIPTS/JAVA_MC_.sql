--------------------------------------------------------
--  DDL for Table JAVA$MC$
--------------------------------------------------------

  CREATE TABLE "SYS"."JAVA$MC$" SHARING=METADATA 
   (	"OBJ#" NUMBER, 
	"METHOD#" NUMBER, 
	"PIECE#" NUMBER, 
	"LENGTH" NUMBER, 
	"PIECE" LONG RAW
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSTEM" ;
