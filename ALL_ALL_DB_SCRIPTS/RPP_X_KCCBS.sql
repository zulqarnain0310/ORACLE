--------------------------------------------------------
--  DDL for Table RPP$X$KCCBS
--------------------------------------------------------

  CREATE TABLE "SYS"."RPP$X$KCCBS" SHARING=METADATA 
   (	"INDX" NUMBER, 
	"INST_ID" NUMBER DEFAULT 1, 
	"UNPLUG_CON_ID" NUMBER, 
	"BSRID" NUMBER, 
	"BSTSM" VARCHAR2(20 BYTE), 
	"BSSTM" NUMBER, 
	"BSBSS" NUMBER, 
	"BSBST" VARCHAR2(20 BYTE), 
	"BSBSC" NUMBER, 
	"BSPCT" NUMBER, 
	"BSTYP" NUMBER, 
	"BSLVL" NUMBER, 
	"BSBSZ" NUMBER, 
	"BSKPT" VARCHAR2(20 BYTE), 
	"BSPFW" NUMBER, 
	"BSPLW" NUMBER, 
	"BSCAL" NUMBER, 
	"BSFLG2" NUMBER, 
	"BSGUID" RAW(16), 
	"RPP_CDBDBID" NUMBER, 
	"RPP_TIMESTAMP" NUMBER, 
	"RPP_META_SPARE1" NUMBER, 
	"RPP_META_SPARE2" NUMBER
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSAUX" ;
  GRANT SELECT ON "SYS"."RPP$X$KCCBS" TO "SELECT_CATALOG_ROLE";
