--------------------------------------------------------
--  DDL for Table OLAP_TAB_HIER$
--------------------------------------------------------

  CREATE TABLE "SYS"."OLAP_TAB_HIER$" SHARING=METADATA 
   (	"OBJ#" NUMBER, 
	"HIER#" NUMBER, 
	"COL#" NUMBER, 
	"ORD" NUMBER, 
	"FLAGS" NUMBER
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSTEM" ;
