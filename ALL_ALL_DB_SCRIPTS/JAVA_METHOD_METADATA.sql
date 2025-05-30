--------------------------------------------------------
--  DDL for Table JAVA$METHOD$METADATA
--------------------------------------------------------

  CREATE TABLE "SYS"."JAVA$METHOD$METADATA" SHARING=METADATA 
   (	"OBJ#" NUMBER, 
	"METHOD#" NUMBER, 
	"PIECE#" NUMBER, 
	"LENGTH" NUMBER, 
	"PIECE" LONG RAW
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSTEM" ;
