--------------------------------------------------------
--  DDL for Table ACCOUNT_DATA_FINACLE
--------------------------------------------------------

  CREATE TABLE "DWH_STG"."ACCOUNT_DATA_FINACLE" 
   (	"SOURCE_SYSTEM" VARCHAR2(30 BYTE), 
	"BRANCH_CODE" VARCHAR2(10 BYTE), 
	"UCIC" VARCHAR2(50 BYTE), 
	"CUSTOMER_ID" VARCHAR2(20 BYTE), 
	"CUSTOMER_AC_ID" VARCHAR2(20 BYTE), 
	"SCHEME_TYPE" VARCHAR2(30 BYTE), 
	"SCHEME_PRODUCT_CODE" VARCHAR2(30 BYTE), 
	"AC_SEGMENT_CODE" VARCHAR2(100 BYTE), 
	"FACILITY_TYPE" VARCHAR2(10 BYTE), 
	"GL_CODE" VARCHAR2(30 BYTE), 
	"SECTOR" VARCHAR2(10 BYTE), 
	"PURPOSE_OF_ADVANCE" VARCHAR2(100 BYTE), 
	"INDUSTRY_CODE" VARCHAR2(10 BYTE), 
	"INTT_RATE" NUMBER(13,0), 
	"BANKING_ARRANGEMENT" VARCHAR2(10 BYTE), 
	"CURRENCY_CODE" VARCHAR2(10 BYTE), 
	"UNHEDGED_FCY_AMOUNT" NUMBER(9,0), 
	"BALANCE_OUTSTANDING_INR" NUMBER(9,0), 
	"BALANCE_IN_ACTUAL_AC_CURRENCY" NUMBER(9,0), 
	"ADVANCE_RECOVERY_AMOUNT" NUMBER(13,0), 
	"CUR_QTR_CREDIT" NUMBER(17,0), 
	"CUR_QTR_INT" NUMBER(17,0), 
	"CURRENT_LIMIT" NUMBER(9,0), 
	"DRAWING_POWER" NUMBER(13,0), 
	"AD_HOC_AMT" NUMBER(17,0), 
	"DFV_AMT" NUMBER(9,0), 
	"GOVT_GTY_AMT" NUMBER(9,0), 
	"POS_BALANCE" NUMBER(9,0), 
	"PRINCIPAL_OVERDUE_AMT" NUMBER(9,0), 
	"INTEREST_OVERDUE_AMT" NUMBER(9,0), 
	"OTH_CHARGES_OVERDUE_AMT" NUMBER(9,0), 
	"UN_APPLIED_INTEREST_AMT" NUMBER(9,0), 
	"TWO_AMOUNT" NUMBER(13,0), 
	"ASSET_CLASS_NORM" NUMBER(9,0), 
	"AC_CATEGORY" NUMBER(9,0), 
	"SECURED_STATUS" VARCHAR2(20 BYTE), 
	"ASSET_CLASS_CODE" VARCHAR2(10 BYTE), 
	"STD_PROVISION_CATEGORY" VARCHAR2(20 BYTE), 
	"FRAUD_COMMITTED" VARCHAR2(20 BYTE), 
	"FRAUD_DATE" DATE, 
	"ISIBPC_EXPOSURE" VARCHAR2(20 BYTE), 
	"ISSECURTISED_EXPOSURE" VARCHAR2(20 BYTE), 
	"AC_RM_NAME_ID" VARCHAR2(15 BYTE), 
	"AC_TL_NAME_ID" VARCHAR2(50 BYTE), 
	"PUI_MARKED" VARCHAR2(20 BYTE), 
	"RFA_MARKED" VARCHAR2(20 BYTE), 
	"ISNONCOPERATIVE" VARCHAR2(20 BYTE), 
	"DATE_OF_DATA" DATE, 
	"AC_OPEN_DT" DATE, 
	"FIRST_DT_OF_DISB" DATE, 
	"CURRENT_LIMIT_DATE" DATE, 
	"AD_HOC_DATE" DATE, 
	"AD_HOC_EXPIRY_DATE" DATE, 
	"CONTI_EXCESS_DATE" DATE, 
	"DEBIT_SINCE_DATE" DATE, 
	"LAST_CREDIT_DATE" DATE, 
	"OTH_CHARGES_OVER_DUE_SINCE_DT" DATE, 
	"REVIEW_RENEW_DUE_DT" DATE, 
	"LIMIT_EXPIRY_DATE" DATE, 
	"STOCK_STATEMENT_DT" DATE, 
	"TWO_DATE" DATE, 
	"NPA_DATE" DATE, 
	"DBT_LOS_DATE" DATE, 
	"INT_NOT_SERVICED_DATE_NEW" DATE, 
	"PRINCIPAL_OVER_DUE_SINCE_DT" DATE, 
	"INTEREST_OVER_DUE_SINCE_DT" DATE, 
	"INTEREST_DUE" NUMBER(9,0), 
	"OTHER_DUES" NUMBER(9,0), 
	"PENAL_DUE" NUMBER(9,0), 
	"INT_RECEIVABLE" NUMBER(9,0), 
	"PENAL_INT_RECEIVABLE" NUMBER(9,0), 
	"INT_NOT_SERVICED_DATE" DATE, 
	"CHARGE_OFF_FLAG" VARCHAR2(1 BYTE), 
	"CHARGE_OFF_DATE" DATE, 
	"SETTLEMENT_FLAG" VARCHAR2(1 BYTE), 
	"SETTLEMENT_DATE" DATE
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
