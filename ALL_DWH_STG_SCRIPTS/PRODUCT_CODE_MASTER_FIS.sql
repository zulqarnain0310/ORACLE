--------------------------------------------------------
--  DDL for Table PRODUCT_CODE_MASTER_FIS
--------------------------------------------------------

  CREATE TABLE "DWH_STG"."PRODUCT_CODE_MASTER_FIS" 
   (	"SOURCE" VARCHAR2(50 BYTE), 
	"SCHEME_CODE" VARCHAR2(30 BYTE), 
	"SCHEME_DESC" VARCHAR2(200 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
