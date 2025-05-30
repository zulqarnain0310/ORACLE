--------------------------------------------------------
--  DDL for Table ROPP$X$KCCAL
--------------------------------------------------------

  CREATE TABLE "SYS"."ROPP$X$KCCAL" SHARING=METADATA 
   (	"INDX" NUMBER, 
	"CON_ID" NUMBER, 
	"ALRID" NUMBER, 
	"ALPRC" NUMBER, 
	"ALTSM" VARCHAR2(20 BYTE), 
	"ALSTM" NUMBER, 
	"ALFLG" NUMBER, 
	"ALTHP" NUMBER, 
	"ALSEQ" NUMBER, 
	"ALRLS" VARCHAR2(20 BYTE), 
	"ALRLC" VARCHAR2(20 BYTE), 
	"ALLOS" VARCHAR2(20 BYTE), 
	"ALLOT" VARCHAR2(20 BYTE), 
	"ALNXS" VARCHAR2(20 BYTE), 
	"ALNXT" VARCHAR2(20 BYTE), 
	"ALBCT" NUMBER, 
	"ALBSZ" NUMBER, 
	"ALDST" NUMBER, 
	"ALNAM" VARCHAR2(513 BYTE), 
	"ALFL2" NUMBER, 
	"ALTOA" NUMBER, 
	"ALDLY" NUMBER, 
	"ALACD" NUMBER, 
	"ALXLC" NUMBER, 
	"INST_ID" NUMBER DEFAULT 1, 
	"RPP_CDBDBID" NUMBER, 
	"RPP_TIMESTAMP" NUMBER, 
	"RPP_META_SPARE1" NUMBER, 
	"RPP_META_SPARE2" NUMBER
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
  STORAGE(
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" 
  PARTITION BY LIST ("CON_ID") 
 (PARTITION "P0"  VALUES (0) 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING 
  STORAGE(
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" ) ;
  GRANT SELECT ON "SYS"."ROPP$X$KCCAL" TO "SELECT_CATALOG_ROLE";
