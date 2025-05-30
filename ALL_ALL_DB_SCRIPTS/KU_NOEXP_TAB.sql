--------------------------------------------------------
--  DDL for Table KU$NOEXP_TAB
--------------------------------------------------------

  CREATE GLOBAL TEMPORARY TABLE "SYS"."KU$NOEXP_TAB" SHARING=METADATA 
   (	"OBJ_TYPE" VARCHAR2(30 BYTE), 
	"SCHEMA" VARCHAR2(128 BYTE), 
	"NAME" VARCHAR2(128 BYTE)
   ) ON COMMIT PRESERVE ROWS ;
  GRANT INSERT ON "SYS"."KU$NOEXP_TAB" TO PUBLIC;
  GRANT SELECT ON "SYS"."KU$NOEXP_TAB" TO PUBLIC;
