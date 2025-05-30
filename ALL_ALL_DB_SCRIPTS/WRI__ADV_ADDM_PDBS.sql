--------------------------------------------------------
--  DDL for Table WRI$_ADV_ADDM_PDBS
--------------------------------------------------------

  CREATE GLOBAL TEMPORARY TABLE "SYS"."WRI$_ADV_ADDM_PDBS" SHARING=METADATA 
   (	"CON_DBID" NUMBER, 
	"PDB_NAME" VARCHAR2(128 BYTE)
   ) ON COMMIT PRESERVE ROWS ;
