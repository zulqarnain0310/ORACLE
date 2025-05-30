--------------------------------------------------------
--  DDL for Table OLAP_TAB_COL$
--------------------------------------------------------

  CREATE TABLE "SYS"."OLAP_TAB_COL$" SHARING=METADATA 
   (	"OBJ#" NUMBER, 
	"COL#" NUMBER, 
	"PCOL#" NUMBER, 
	"COLTYPE" NUMBER, 
	"OID" NUMBER, 
	"QDROID" NUMBER, 
	"QDRVAL" VARCHAR2(100 BYTE), 
	"HIER#" NUMBER, 
	"FLAGS" NUMBER
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSTEM" ;
