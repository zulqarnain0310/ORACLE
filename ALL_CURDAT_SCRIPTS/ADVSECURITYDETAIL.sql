--------------------------------------------------------
--  DDL for Table ADVSECURITYDETAIL
--------------------------------------------------------

  CREATE TABLE "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" 
   (	"ENTITYKEY" NUMBER(19,0), 
	"ACCOUNTENTITYID" NUMBER(10,0), 
	"CUSTOMERENTITYID" NUMBER(10,0), 
	"SECURITYTYPE" CHAR(1 CHAR), 
	"COLLATERALTYPE" VARCHAR2(30 CHAR), 
	"SECURITYALT_KEY" NUMBER(5,0), 
	"SECURITYENTITYID" NUMBER(10,0), 
	"SECURITY_REFNO" VARCHAR2(20 CHAR), 
	"SECURITYNATURE" VARCHAR2(15 CHAR), 
	"SECURITYCHARGETYPEALT_KEY" NUMBER(10,0), 
	"CURRENCYALT_KEY" NUMBER(5,0), 
	"ENTRYTYPE" VARCHAR2(20 CHAR), 
	"SCRCRERROR" VARCHAR2(100 CHAR), 
	"INWARDNO" NUMBER(5,0), 
	"LIMITNODE_FLAG" CHAR(1 CHAR), 
	"REFCUSTOMERID" VARCHAR2(50 CHAR), 
	"REFSYSTEMACID" VARCHAR2(50 CHAR), 
	"AUTHORISATIONSTATUS" VARCHAR2(2 CHAR), 
	"EFFECTIVEFROMTIMEKEY" NUMBER(10,0), 
	"EFFECTIVETOTIMEKEY" NUMBER(10,0), 
	"CREATEDBY" VARCHAR2(20 CHAR), 
	"DATECREATED" DATE, 
	"MODIFIEDBY" VARCHAR2(20 CHAR), 
	"DATEMODIFIED" DATE, 
	"APPROVEDBY" VARCHAR2(20 CHAR), 
	"DATEAPPROVED" DATE, 
	"D2KTIMESTAMP" DATE, 
	"MOCTYPEALT_KEY" NUMBER(10,0), 
	"MOCSTATUS" VARCHAR2(1 CHAR), 
	"MOCDATE" DATE, 
	"SECURITYPARTICULAR" VARCHAR2(1000 CHAR), 
	"OWNERTYPEALT_KEY" CHAR(1 CHAR), 
	"ASSETOWNERNAME" VARCHAR2(200 CHAR), 
	"VALUEATSANCTIONTIME" NUMBER(16,2), 
	"BRANCHLASTINSPECDATE" VARCHAR2(200 CHAR), 
	"SATISFACTIONNO" VARCHAR2(50 CHAR), 
	"SATISFACTIONDATE" VARCHAR2(200 CHAR), 
	"BANKSHARE" NUMBER(5,2), 
	"ACTIONTAKENREMARK" VARCHAR2(1000 CHAR), 
	"SECCHARGE" CHAR(1 CHAR), 
	"COLLATERALID" VARCHAR2(30 CHAR), 
	"UCICID" VARCHAR2(12 CHAR), 
	"CUSTOMERNAME" VARCHAR2(200 CHAR), 
	"TAGGINGALT_KEY" NUMBER(10,0), 
	"DISTRIBUTIONALT_KEY" NUMBER(10,0), 
	"COLLATERALCODE" VARCHAR2(50 CHAR), 
	"COLLATERALSUBTYPEALT_KEY" NUMBER(10,0), 
	"COLLATERALOWNERSHIPTYPEALT_KEY" NUMBER(10,0), 
	"CHARGENATUREALT_KEY" NUMBER(10,0), 
	"SHAREAVAILABLETOBANKALT_KEY" NUMBER(10,0), 
	"COLLATERALSHAREAMOUNT" NUMBER(18,2), 
	"IFPERCENTAGEVALUE_OR_ABSOLUTEVALUE" NUMBER(16,2), 
	"COLLATERALVALUEATSANCTIONINRS" NUMBER(18,2), 
	"COLLATERALVALUEASONNPADATEINRS" NUMBER(18,2), 
	"APPROVEDBYFIRSTLEVEL" VARCHAR2(20 CHAR), 
	"DATEAPPROVEDFIRSTLEVEL" DATE, 
	"CHANGEFIELD" CLOB, 
	"SEC_PERF_FLG" VARCHAR2(50 CHAR)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" 
 LOB ("CHANGEFIELD") STORE AS SECUREFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192
  NOCACHE LOGGING  NOCOMPRESS  KEEP_DUPLICATES ) ;
  GRANT ALTER ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT ALTER ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "PREMOC_RBL_MISDB_PROD";
  GRANT ALTER ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "QPI_RBL_MISDB_PROD";
  GRANT ALTER ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "ALERT_RBL_MISDB_PROD";
  GRANT ALTER ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "DWH_RBL_MISDB_PROD";
  GRANT ALTER ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "MAIN_PRO";
  GRANT ALTER ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT ALTER ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "BS_RBL_MISDB_PROD";
  GRANT ALTER ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "ACL_RBL_MISDB_PROD";
  GRANT ALTER ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT ALTER ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "RBL_MISDB_PROD";
  GRANT ALTER ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT DELETE ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT DELETE ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "PREMOC_RBL_MISDB_PROD";
  GRANT DELETE ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "QPI_RBL_MISDB_PROD";
  GRANT DELETE ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "ALERT_RBL_MISDB_PROD";
  GRANT DELETE ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "DWH_RBL_MISDB_PROD";
  GRANT DELETE ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "MAIN_PRO";
  GRANT DELETE ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT DELETE ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "BS_RBL_MISDB_PROD";
  GRANT DELETE ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "ACL_RBL_MISDB_PROD";
  GRANT DELETE ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT DELETE ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "RBL_MISDB_PROD";
  GRANT DELETE ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT INDEX ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "PREMOC_RBL_MISDB_PROD";
  GRANT INDEX ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "QPI_RBL_MISDB_PROD";
  GRANT INDEX ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "ALERT_RBL_MISDB_PROD";
  GRANT INDEX ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "DWH_RBL_MISDB_PROD";
  GRANT INDEX ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "MAIN_PRO";
  GRANT INDEX ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT INDEX ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "BS_RBL_MISDB_PROD";
  GRANT INDEX ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "ACL_RBL_MISDB_PROD";
  GRANT INDEX ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT INDEX ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "RBL_MISDB_PROD";
  GRANT INDEX ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT INSERT ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT INSERT ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "PREMOC_RBL_MISDB_PROD";
  GRANT INSERT ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "QPI_RBL_MISDB_PROD";
  GRANT INSERT ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "ALERT_RBL_MISDB_PROD";
  GRANT INSERT ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "DWH_RBL_MISDB_PROD";
  GRANT INSERT ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "MAIN_PRO";
  GRANT INSERT ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT INSERT ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "BS_RBL_MISDB_PROD";
  GRANT INSERT ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "ACL_RBL_MISDB_PROD";
  GRANT INSERT ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT INSERT ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "RBL_MISDB_PROD";
  GRANT INSERT ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT SELECT ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT SELECT ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "PREMOC_RBL_MISDB_PROD";
  GRANT SELECT ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "QPI_RBL_MISDB_PROD";
  GRANT SELECT ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "ALERT_RBL_MISDB_PROD";
  GRANT SELECT ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "DWH_RBL_MISDB_PROD";
  GRANT SELECT ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "MAIN_PRO";
  GRANT SELECT ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT SELECT ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "BS_RBL_MISDB_PROD";
  GRANT SELECT ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "ACL_RBL_MISDB_PROD";
  GRANT SELECT ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT SELECT ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "RBL_MISDB_PROD";
  GRANT SELECT ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT UPDATE ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT UPDATE ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "PREMOC_RBL_MISDB_PROD";
  GRANT UPDATE ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "QPI_RBL_MISDB_PROD";
  GRANT UPDATE ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "ALERT_RBL_MISDB_PROD";
  GRANT UPDATE ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "DWH_RBL_MISDB_PROD";
  GRANT UPDATE ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "MAIN_PRO";
  GRANT UPDATE ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT UPDATE ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "BS_RBL_MISDB_PROD";
  GRANT UPDATE ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "ACL_RBL_MISDB_PROD";
  GRANT UPDATE ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT UPDATE ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "RBL_MISDB_PROD";
  GRANT UPDATE ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT REFERENCES ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "PREMOC_RBL_MISDB_PROD";
  GRANT REFERENCES ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "QPI_RBL_MISDB_PROD";
  GRANT REFERENCES ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "ALERT_RBL_MISDB_PROD";
  GRANT REFERENCES ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "DWH_RBL_MISDB_PROD";
  GRANT REFERENCES ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "MAIN_PRO";
  GRANT REFERENCES ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT REFERENCES ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "BS_RBL_MISDB_PROD";
  GRANT REFERENCES ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "ACL_RBL_MISDB_PROD";
  GRANT REFERENCES ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT REFERENCES ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "RBL_MISDB_PROD";
  GRANT REFERENCES ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT READ ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT READ ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "PREMOC_RBL_MISDB_PROD";
  GRANT READ ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "QPI_RBL_MISDB_PROD";
  GRANT READ ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "ALERT_RBL_MISDB_PROD";
  GRANT READ ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "DWH_RBL_MISDB_PROD";
  GRANT READ ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "MAIN_PRO";
  GRANT READ ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT READ ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "BS_RBL_MISDB_PROD";
  GRANT READ ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "ACL_RBL_MISDB_PROD";
  GRANT READ ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT READ ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "RBL_MISDB_PROD";
  GRANT READ ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT ON COMMIT REFRESH ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "PREMOC_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "QPI_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "ALERT_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "DWH_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "MAIN_PRO";
  GRANT ON COMMIT REFRESH ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "BS_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "ACL_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT QUERY REWRITE ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "PREMOC_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "QPI_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "ALERT_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "DWH_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "MAIN_PRO";
  GRANT QUERY REWRITE ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "BS_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "ACL_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT DEBUG ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT DEBUG ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "PREMOC_RBL_MISDB_PROD";
  GRANT DEBUG ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "QPI_RBL_MISDB_PROD";
  GRANT DEBUG ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "ALERT_RBL_MISDB_PROD";
  GRANT DEBUG ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "DWH_RBL_MISDB_PROD";
  GRANT DEBUG ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "MAIN_PRO";
  GRANT DEBUG ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT DEBUG ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "BS_RBL_MISDB_PROD";
  GRANT DEBUG ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "ACL_RBL_MISDB_PROD";
  GRANT DEBUG ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT DEBUG ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "RBL_MISDB_PROD";
  GRANT DEBUG ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT FLASHBACK ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "PREMOC_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "QPI_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "ALERT_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "DWH_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "MAIN_PRO";
  GRANT FLASHBACK ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "BS_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "ACL_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "RBL_MISDB_PROD";
  GRANT FLASHBACK ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT ALTER ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "ROLE_ALL_DB";
  GRANT ALTER ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "CC_CDR_RBL_STGDB";
  GRANT ALTER ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "RBL_BI_RBL_STGDB";
  GRANT ALTER ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "BSG_READ_RBL_STGDB";
  GRANT ALTER ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "STD_FIN_RBL_STGDB";
  GRANT ALTER ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "RBL_STGDB";
  GRANT ALTER ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT ALTER ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "RBL_TEMPDB";
  GRANT ALTER ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "STG_FIN_RBL_STGDB";
  GRANT ALTER ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "ADF_CDR_RBL_STGDB";
  GRANT DELETE ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "ROLE_ALL_DB";
  GRANT DELETE ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "CC_CDR_RBL_STGDB";
  GRANT DELETE ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "RBL_BI_RBL_STGDB";
  GRANT DELETE ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "BSG_READ_RBL_STGDB";
  GRANT DELETE ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "STD_FIN_RBL_STGDB";
  GRANT DELETE ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "RBL_STGDB";
  GRANT DELETE ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT DELETE ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "RBL_TEMPDB";
  GRANT DELETE ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "STG_FIN_RBL_STGDB";
  GRANT DELETE ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "ADF_CDR_RBL_STGDB";
  GRANT INDEX ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "CC_CDR_RBL_STGDB";
  GRANT INDEX ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "RBL_BI_RBL_STGDB";
  GRANT INDEX ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "BSG_READ_RBL_STGDB";
  GRANT INDEX ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "STD_FIN_RBL_STGDB";
  GRANT INDEX ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "RBL_STGDB";
  GRANT INDEX ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT INDEX ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "RBL_TEMPDB";
  GRANT INDEX ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "STG_FIN_RBL_STGDB";
  GRANT INDEX ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "ADF_CDR_RBL_STGDB";
  GRANT INSERT ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "ROLE_ALL_DB";
  GRANT INSERT ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "CC_CDR_RBL_STGDB";
  GRANT INSERT ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "RBL_BI_RBL_STGDB";
  GRANT INSERT ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "BSG_READ_RBL_STGDB";
  GRANT INSERT ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "STD_FIN_RBL_STGDB";
  GRANT INSERT ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "RBL_STGDB";
  GRANT INSERT ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT INSERT ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "RBL_TEMPDB";
  GRANT INSERT ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "STG_FIN_RBL_STGDB";
  GRANT INSERT ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "ADF_CDR_RBL_STGDB";
  GRANT SELECT ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "ROLE_ALL_DB";
  GRANT SELECT ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "CC_CDR_RBL_STGDB";
  GRANT SELECT ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "RBL_BI_RBL_STGDB";
  GRANT SELECT ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "BSG_READ_RBL_STGDB";
  GRANT SELECT ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "STD_FIN_RBL_STGDB";
  GRANT SELECT ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "RBL_STGDB";
  GRANT SELECT ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT SELECT ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "RBL_TEMPDB";
  GRANT SELECT ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "STG_FIN_RBL_STGDB";
  GRANT SELECT ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "ADF_CDR_RBL_STGDB";
  GRANT UPDATE ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "ROLE_ALL_DB";
  GRANT UPDATE ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "CC_CDR_RBL_STGDB";
  GRANT UPDATE ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "RBL_BI_RBL_STGDB";
  GRANT UPDATE ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "BSG_READ_RBL_STGDB";
  GRANT UPDATE ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "STD_FIN_RBL_STGDB";
  GRANT UPDATE ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "RBL_STGDB";
  GRANT UPDATE ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT UPDATE ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "RBL_TEMPDB";
  GRANT UPDATE ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "STG_FIN_RBL_STGDB";
  GRANT UPDATE ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "ADF_CDR_RBL_STGDB";
  GRANT REFERENCES ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "CC_CDR_RBL_STGDB";
  GRANT REFERENCES ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "RBL_BI_RBL_STGDB";
  GRANT REFERENCES ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "BSG_READ_RBL_STGDB";
  GRANT REFERENCES ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "STD_FIN_RBL_STGDB";
  GRANT REFERENCES ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "RBL_STGDB";
  GRANT REFERENCES ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT REFERENCES ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "RBL_TEMPDB";
  GRANT REFERENCES ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "STG_FIN_RBL_STGDB";
  GRANT REFERENCES ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "ADF_CDR_RBL_STGDB";
  GRANT READ ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "ROLE_ALL_DB";
  GRANT READ ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "CC_CDR_RBL_STGDB";
  GRANT READ ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "RBL_BI_RBL_STGDB";
  GRANT READ ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "BSG_READ_RBL_STGDB";
  GRANT READ ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "STD_FIN_RBL_STGDB";
  GRANT READ ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "RBL_STGDB";
  GRANT READ ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT READ ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "RBL_TEMPDB";
  GRANT READ ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "STG_FIN_RBL_STGDB";
  GRANT READ ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "ADF_CDR_RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "ROLE_ALL_DB";
  GRANT ON COMMIT REFRESH ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "CC_CDR_RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "RBL_BI_RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "BSG_READ_RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "STD_FIN_RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT ON COMMIT REFRESH ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "RBL_TEMPDB";
  GRANT ON COMMIT REFRESH ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "STG_FIN_RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "ADF_CDR_RBL_STGDB";
  GRANT QUERY REWRITE ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "ROLE_ALL_DB";
  GRANT QUERY REWRITE ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "CC_CDR_RBL_STGDB";
  GRANT QUERY REWRITE ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "RBL_BI_RBL_STGDB";
  GRANT QUERY REWRITE ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "BSG_READ_RBL_STGDB";
  GRANT QUERY REWRITE ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "STD_FIN_RBL_STGDB";
  GRANT QUERY REWRITE ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "RBL_STGDB";
  GRANT QUERY REWRITE ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT QUERY REWRITE ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "RBL_TEMPDB";
  GRANT QUERY REWRITE ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "STG_FIN_RBL_STGDB";
  GRANT QUERY REWRITE ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "ADF_CDR_RBL_STGDB";
  GRANT DEBUG ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "ROLE_ALL_DB";
  GRANT DEBUG ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "CC_CDR_RBL_STGDB";
  GRANT DEBUG ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "RBL_BI_RBL_STGDB";
  GRANT DEBUG ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "BSG_READ_RBL_STGDB";
  GRANT DEBUG ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "STD_FIN_RBL_STGDB";
  GRANT DEBUG ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "RBL_STGDB";
  GRANT DEBUG ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT DEBUG ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "RBL_TEMPDB";
  GRANT DEBUG ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "STG_FIN_RBL_STGDB";
  GRANT DEBUG ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "ADF_CDR_RBL_STGDB";
  GRANT FLASHBACK ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "ROLE_ALL_DB";
  GRANT FLASHBACK ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "CC_CDR_RBL_STGDB";
  GRANT FLASHBACK ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "RBL_BI_RBL_STGDB";
  GRANT FLASHBACK ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "BSG_READ_RBL_STGDB";
  GRANT FLASHBACK ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "STD_FIN_RBL_STGDB";
  GRANT FLASHBACK ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "RBL_STGDB";
  GRANT FLASHBACK ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT FLASHBACK ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "RBL_TEMPDB";
  GRANT FLASHBACK ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "STG_FIN_RBL_STGDB";
  GRANT FLASHBACK ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYDETAIL" TO "ADF_CDR_RBL_STGDB";
