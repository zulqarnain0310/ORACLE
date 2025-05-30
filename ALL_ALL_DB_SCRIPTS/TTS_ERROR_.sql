--------------------------------------------------------
--  DDL for Table TTS_ERROR$
--------------------------------------------------------

  CREATE GLOBAL TEMPORARY TABLE "SYS"."TTS_ERROR$" SHARING=METADATA 
   (	"VIOLATIONS" VARCHAR2(2000 BYTE)
   ) ON COMMIT PRESERVE ROWS ;
  GRANT SELECT ON "SYS"."TTS_ERROR$" TO "SELECT_CATALOG_ROLE";
