--------------------------------------------------------
--  DDL for Table SYS_MFBA_STAGE_RID
--------------------------------------------------------

  CREATE GLOBAL TEMPORARY TABLE "SYS"."SYS_MFBA_STAGE_RID" SHARING=METADATA 
   (	"OBJN" NUMBER, 
	"RID" VARCHAR2(4000 BYTE), 
	"ESCN" NUMBER
   ) ON COMMIT PRESERVE ROWS ;
