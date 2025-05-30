--------------------------------------------------------
--  DDL for Table ODCI_WARNINGS$
--------------------------------------------------------

  CREATE GLOBAL TEMPORARY TABLE "SYS"."ODCI_WARNINGS$" SHARING=METADATA 
   (	"C1" NUMBER, 
	"C2" VARCHAR2(2000 BYTE)
   ) ON COMMIT PRESERVE ROWS ;
  GRANT INSERT ON "SYS"."ODCI_WARNINGS$" TO PUBLIC;
  GRANT SELECT ON "SYS"."ODCI_WARNINGS$" TO PUBLIC;
