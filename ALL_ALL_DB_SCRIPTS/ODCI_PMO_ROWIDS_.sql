--------------------------------------------------------
--  DDL for Table ODCI_PMO_ROWIDS$
--------------------------------------------------------

  CREATE GLOBAL TEMPORARY TABLE "SYS"."ODCI_PMO_ROWIDS$" SHARING=METADATA 
   (	"OLD_ROWID" VARCHAR2(18 BYTE), 
	"NEW_ROWID" VARCHAR2(18 BYTE)
   ) ON COMMIT PRESERVE ROWS ;
  GRANT READ ON "SYS"."ODCI_PMO_ROWIDS$" TO PUBLIC;
