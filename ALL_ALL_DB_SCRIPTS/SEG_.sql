--------------------------------------------------------
--  DDL for Table SEG$
--------------------------------------------------------

  CREATE TABLE "SYS"."SEG$" SHARING=METADATA 
   (	"FILE#" NUMBER, 
	"BLOCK#" NUMBER, 
	"TYPE#" NUMBER, 
	"TS#" NUMBER, 
	"BLOCKS" NUMBER, 
	"EXTENTS" NUMBER, 
	"INIEXTS" NUMBER, 
	"MINEXTS" NUMBER, 
	"MAXEXTS" NUMBER, 
	"EXTSIZE" NUMBER, 
	"EXTPCT" NUMBER, 
	"USER#" NUMBER, 
	"LISTS" NUMBER, 
	"GROUPS" NUMBER, 
	"BITMAPRANGES" NUMBER, 
	"CACHEHINT" NUMBER, 
	"SCANHINT" NUMBER, 
	"HWMINCR" NUMBER, 
	"SPARE1" NUMBER, 
	"SPARE2" NUMBER
   ) CLUSTER "SYS"."C_FILE#_BLOCK#" ("TS#", "FILE#", "BLOCK#");
