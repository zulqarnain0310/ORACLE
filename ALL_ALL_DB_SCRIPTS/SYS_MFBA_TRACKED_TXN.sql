--------------------------------------------------------
--  DDL for Table SYS_MFBA_TRACKED_TXN
--------------------------------------------------------

  CREATE GLOBAL TEMPORARY TABLE "SYS"."SYS_MFBA_TRACKED_TXN" SHARING=METADATA 
   (	"USN" NUMBER, 
	"SLOT" NUMBER, 
	"SEQ" NUMBER
   ) ON COMMIT PRESERVE ROWS ;
