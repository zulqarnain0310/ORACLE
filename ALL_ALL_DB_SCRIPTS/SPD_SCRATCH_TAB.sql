--------------------------------------------------------
--  DDL for Table SPD_SCRATCH_TAB
--------------------------------------------------------

  CREATE GLOBAL TEMPORARY TABLE "SYS"."SPD_SCRATCH_TAB" SHARING=METADATA 
   (	"C1" VARCHAR2(130 BYTE), 
	"C2" VARCHAR2(130 BYTE), 
	"N1" NUMBER
   ) ON COMMIT PRESERVE ROWS ;
  GRANT INSERT ON "SYS"."SPD_SCRATCH_TAB" TO PUBLIC;
  GRANT SELECT ON "SYS"."SPD_SCRATCH_TAB" TO PUBLIC;
