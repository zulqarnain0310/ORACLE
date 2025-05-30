--------------------------------------------------------
--  DDL for Table PDB_INV_TYPE$
--------------------------------------------------------

  CREATE TABLE "SYS"."PDB_INV_TYPE$" SHARING=METADATA 
   (	"OWNER" VARCHAR2(128 BYTE), 
	"TYPE_NAME" VARCHAR2(128 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSTEM" ;
  GRANT SELECT ON "SYS"."PDB_INV_TYPE$" TO "XDB";
