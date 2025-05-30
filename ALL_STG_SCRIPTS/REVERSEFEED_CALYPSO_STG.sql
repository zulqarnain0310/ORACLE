--------------------------------------------------------
--  DDL for Table REVERSEFEED_CALYPSO_STG
--------------------------------------------------------

  CREATE TABLE "RBL_STGDB"."REVERSEFEED_CALYPSO_STG" 
   (	"DATE_OF_DATA" DATE, 
	"SOURCE_SYSTEM_NAME" VARCHAR2(30 BYTE), 
	"BRANCH_CODE" VARCHAR2(64 BYTE), 
	"UCIC_ID" VARCHAR2(64 BYTE), 
	"ISSUERID" CLOB, 
	"ISSUUERNAME" VARCHAR2(256 BYTE), 
	"REF_TXN_SYS_CUST_ID" VARCHAR2(256 BYTE), 
	"PAN" VARCHAR2(64 BYTE), 
	"ISSUER_CATEGORY_CODE" VARCHAR2(64 BYTE), 
	"GRPENTITYOFBANK" VARCHAR2(256 BYTE), 
	"CP_HOLIDAY" VARCHAR2(20 BYTE), 
	"CP_EXTERNAL_REF" VARCHAR2(64 BYTE), 
	"CP_FINANCIAL" VARCHAR2(20 BYTE), 
	"CP_PARENT" VARCHAR2(256 BYTE), 
	"CP_COMMENT" VARCHAR2(256 BYTE), 
	"CP_STATUS" VARCHAR2(64 BYTE), 
	"COUNTERPARTY_SHORTNAME" VARCHAR2(256 BYTE), 
	"COUNTERPARTY_FULLNAME" VARCHAR2(256 BYTE), 
	"COUNTERPARTY_ROLE1" VARCHAR2(64 BYTE), 
	"COUNTERPARTY_COUNTRY" VARCHAR2(64 BYTE), 
	"COUNTERPARTY_ROLE2" VARCHAR2(64 BYTE), 
	"COUNTERPARTY_ROLE3" VARCHAR2(64 BYTE), 
	"COUNTERPARTY_ROLE4" VARCHAR2(64 BYTE), 
	"COUNTERPARTY_ROLE5" VARCHAR2(64 BYTE), 
	"CIF_ID" VARCHAR2(64 BYTE), 
	"ENPA_ASSET_CODE" VARCHAR2(64 BYTE), 
	"ENPA_DESCRIPTION" VARCHAR2(64 BYTE), 
	"ENPA_ASSET_CODE_DATE" VARCHAR2(64 BYTE), 
	"ENPA_D2K_NPA_DATE" VARCHAR2(64 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" 
 LOB ("ISSUERID") STORE AS SECUREFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192
  NOCACHE LOGGING  NOCOMPRESS  KEEP_DUPLICATES 
  STORAGE(INITIAL 106496 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)) ;
