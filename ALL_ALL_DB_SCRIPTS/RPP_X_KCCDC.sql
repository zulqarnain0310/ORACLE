--------------------------------------------------------
--  DDL for Table RPP$X$KCCDC
--------------------------------------------------------

  CREATE TABLE "SYS"."RPP$X$KCCDC" SHARING=METADATA 
   (	"INDX" NUMBER, 
	"INST_ID" NUMBER DEFAULT 1, 
	"UNPLUG_CON_ID" NUMBER, 
	"DCRID" NUMBER, 
	"DCTSM" VARCHAR2(20 BYTE), 
	"DCSTM" NUMBER, 
	"DCFLG" NUMBER, 
	"DCDFP" NUMBER, 
	"DCRFN" NUMBER, 
	"DCDBI" NUMBER, 
	"DCCRS" VARCHAR2(20 BYTE), 
	"DCCRT" VARCHAR2(20 BYTE), 
	"DCCPS" VARCHAR2(20 BYTE), 
	"DCCPT" VARCHAR2(20 BYTE), 
	"DCRLS" VARCHAR2(20 BYTE), 
	"DCRLC" VARCHAR2(20 BYTE), 
	"DCRFS" VARCHAR2(20 BYTE), 
	"DCRFT" VARCHAR2(20 BYTE), 
	"DCAFS" VARCHAR2(20 BYTE), 
	"DCNCB" NUMBER, 
	"DCMCB" NUMBER, 
	"DCLCB" NUMBER, 
	"DCBCT" NUMBER, 
	"DCBSZ" NUMBER, 
	"DCLOR" NUMBER, 
	"DCKPT" VARCHAR2(20 BYTE), 
	"DCTAG" VARCHAR2(32 BYTE), 
	"DCNAM" VARCHAR2(513 BYTE), 
	"DCRSI" NUMBER, 
	"DCRST" NUMBER, 
	"DCFDI" NUMBER, 
	"DCPLUS" NUMBER, 
	"DCPRLS" NUMBER, 
	"DCPRLT" DATE, 
	"DCPTSN" NUMBER, 
	"DCCPTHR" NUMBER, 
	"DCFLG2" NUMBER, 
	"DCGUID" RAW(16), 
	"RPP_CDBDBID" NUMBER, 
	"RPP_TIMESTAMP" NUMBER, 
	"RPP_META_SPARE1" NUMBER, 
	"RPP_META_SPARE2" NUMBER
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSAUX" ;
  GRANT SELECT ON "SYS"."RPP$X$KCCDC" TO "SELECT_CATALOG_ROLE";
