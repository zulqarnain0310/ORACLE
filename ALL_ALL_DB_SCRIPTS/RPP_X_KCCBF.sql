--------------------------------------------------------
--  DDL for Table RPP$X$KCCBF
--------------------------------------------------------

  CREATE TABLE "SYS"."RPP$X$KCCBF" SHARING=METADATA 
   (	"INDX" NUMBER, 
	"INST_ID" NUMBER DEFAULT 1, 
	"UNPLUG_CON_ID" NUMBER, 
	"BFRID" NUMBER, 
	"BFTSM" VARCHAR2(20 BYTE), 
	"BFSTM" NUMBER, 
	"BFBSS" NUMBER, 
	"BFBSC" NUMBER, 
	"BFFLG" NUMBER, 
	"BFDFP" NUMBER, 
	"BFLVL" NUMBER, 
	"BFCRS" VARCHAR2(20 BYTE), 
	"BFCRT" VARCHAR2(20 BYTE), 
	"BFCPS" VARCHAR2(20 BYTE), 
	"BFCPT" VARCHAR2(20 BYTE), 
	"BFRLS" VARCHAR2(20 BYTE), 
	"BFRLC" VARCHAR2(20 BYTE), 
	"BFICS" VARCHAR2(20 BYTE), 
	"BFAFS" VARCHAR2(20 BYTE), 
	"BFNCB" NUMBER, 
	"BFMCB" NUMBER, 
	"BFLCB" NUMBER, 
	"BFFSZ" NUMBER, 
	"BFBCT" NUMBER, 
	"BFBSZ" NUMBER, 
	"BFLOR" NUMBER, 
	"BFBRD" NUMBER, 
	"BFSIX" NUMBER, 
	"BFFDI" NUMBER, 
	"BFPLUS" NUMBER, 
	"BFPRLS" NUMBER, 
	"BFPRLT" DATE, 
	"BFPTSN" NUMBER, 
	"BFSSB" NUMBER, 
	"BFSSZ" NUMBER, 
	"BFGUID" RAW(16), 
	"RPP_CDBDBID" NUMBER, 
	"RPP_TIMESTAMP" NUMBER, 
	"RPP_META_SPARE1" NUMBER, 
	"RPP_META_SPARE2" NUMBER
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSAUX" ;
  GRANT SELECT ON "SYS"."RPP$X$KCCBF" TO "SELECT_CATALOG_ROLE";
