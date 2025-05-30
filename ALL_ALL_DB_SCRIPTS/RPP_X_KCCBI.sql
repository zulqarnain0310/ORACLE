--------------------------------------------------------
--  DDL for Table RPP$X$KCCBI
--------------------------------------------------------

  CREATE TABLE "SYS"."RPP$X$KCCBI" SHARING=METADATA 
   (	"INDX" NUMBER, 
	"INST_ID" NUMBER DEFAULT 1, 
	"UNPLUG_CON_ID" NUMBER, 
	"BIRID" NUMBER, 
	"BITSM" VARCHAR2(20 BYTE), 
	"BISTM" NUMBER, 
	"BIBSS" NUMBER, 
	"BIBSC" NUMBER, 
	"BIMDT" VARCHAR2(20 BYTE), 
	"BIFSZ" NUMBER, 
	"BISIX" NUMBER, 
	"BIDUN" VARCHAR2(30 BYTE), 
	"BIFLG" NUMBER, 
	"BIGUID" RAW(16), 
	"RPP_CDBDBID" NUMBER, 
	"RPP_TIMESTAMP" NUMBER, 
	"RPP_META_SPARE1" NUMBER, 
	"RPP_META_SPARE2" NUMBER
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSAUX" ;
  GRANT SELECT ON "SYS"."RPP$X$KCCBI" TO "SELECT_CATALOG_ROLE";
