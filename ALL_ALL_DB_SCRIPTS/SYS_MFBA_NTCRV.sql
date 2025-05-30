--------------------------------------------------------
--  DDL for Table SYS_MFBA_NTCRV
--------------------------------------------------------

  CREATE GLOBAL TEMPORARY TABLE "SYS"."SYS_MFBA_NTCRV" SHARING=METADATA 
   (	"RID" VARCHAR2(4000 BYTE), 
	"STARTSCN" NUMBER, 
	"ENDSCN" NUMBER, 
	"XID" RAW(8), 
	"OP" VARCHAR2(1 BYTE)
   ) ON COMMIT PRESERVE ROWS ;
