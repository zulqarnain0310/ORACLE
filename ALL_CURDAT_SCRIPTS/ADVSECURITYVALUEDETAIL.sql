--------------------------------------------------------
--  DDL for Table ADVSECURITYVALUEDETAIL
--------------------------------------------------------

  CREATE TABLE "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" 
   (	"ENTITYKEY" NUMBER(19,0), 
	"SECURITYENTITYID" NUMBER(19,0), 
	"VALUATIONSOURCEALT_KEY" NUMBER(5,0), 
	"VALUATIONDATE" DATE, 
	"CURRENTVALUE" NUMBER(16,2), 
	"VALUATIONEXPIRYDATE" DATE, 
	"AUTHORISATIONSTATUS" CHAR(2 CHAR), 
	"EFFECTIVEFROMTIMEKEY" NUMBER(10,0), 
	"EFFECTIVETOTIMEKEY" NUMBER(10,0), 
	"CREATEDBY" VARCHAR2(20 CHAR), 
	"DATECREATED" DATE, 
	"MODIFIEDBY" VARCHAR2(20 CHAR), 
	"DATEMODIFIED" DATE, 
	"APPROVEDBY" VARCHAR2(20 CHAR), 
	"DATEAPPROVED" DATE, 
	"D2KTIMESTAMP" DATE, 
	"CURRENTVALUESOURCE" NUMBER(18,2), 
	"COLLATERALVALUEATTHETIMEOFLASTREVIEWINRS" NUMBER(18,2), 
	"COLLATERALID" VARCHAR2(30 CHAR), 
	"EXPIRYBUSINESSRULE" VARCHAR2(100 CHAR), 
	"PERIODINMONTH" NUMBER(10,0), 
	"SECURITYVALUEMAIN" NUMBER(16,2)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
  GRANT ALTER ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT ALTER ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "PREMOC_RBL_MISDB_PROD";
  GRANT ALTER ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "QPI_RBL_MISDB_PROD";
  GRANT ALTER ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "ALERT_RBL_MISDB_PROD";
  GRANT ALTER ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "DWH_RBL_MISDB_PROD";
  GRANT ALTER ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "MAIN_PRO";
  GRANT ALTER ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT ALTER ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "BS_RBL_MISDB_PROD";
  GRANT ALTER ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "ACL_RBL_MISDB_PROD";
  GRANT ALTER ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT ALTER ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "RBL_MISDB_PROD";
  GRANT ALTER ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT DELETE ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT DELETE ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "PREMOC_RBL_MISDB_PROD";
  GRANT DELETE ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "QPI_RBL_MISDB_PROD";
  GRANT DELETE ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "ALERT_RBL_MISDB_PROD";
  GRANT DELETE ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "DWH_RBL_MISDB_PROD";
  GRANT DELETE ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "MAIN_PRO";
  GRANT DELETE ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT DELETE ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "BS_RBL_MISDB_PROD";
  GRANT DELETE ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "ACL_RBL_MISDB_PROD";
  GRANT DELETE ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT DELETE ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "RBL_MISDB_PROD";
  GRANT DELETE ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT INDEX ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "PREMOC_RBL_MISDB_PROD";
  GRANT INDEX ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "QPI_RBL_MISDB_PROD";
  GRANT INDEX ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "ALERT_RBL_MISDB_PROD";
  GRANT INDEX ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "DWH_RBL_MISDB_PROD";
  GRANT INDEX ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "MAIN_PRO";
  GRANT INDEX ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT INDEX ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "BS_RBL_MISDB_PROD";
  GRANT INDEX ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "ACL_RBL_MISDB_PROD";
  GRANT INDEX ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT INDEX ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "RBL_MISDB_PROD";
  GRANT INDEX ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT INSERT ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT INSERT ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "PREMOC_RBL_MISDB_PROD";
  GRANT INSERT ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "QPI_RBL_MISDB_PROD";
  GRANT INSERT ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "ALERT_RBL_MISDB_PROD";
  GRANT INSERT ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "DWH_RBL_MISDB_PROD";
  GRANT INSERT ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "MAIN_PRO";
  GRANT INSERT ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT INSERT ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "BS_RBL_MISDB_PROD";
  GRANT INSERT ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "ACL_RBL_MISDB_PROD";
  GRANT INSERT ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT INSERT ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "RBL_MISDB_PROD";
  GRANT INSERT ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT SELECT ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT SELECT ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "PREMOC_RBL_MISDB_PROD";
  GRANT SELECT ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "QPI_RBL_MISDB_PROD";
  GRANT SELECT ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "ALERT_RBL_MISDB_PROD";
  GRANT SELECT ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "DWH_RBL_MISDB_PROD";
  GRANT SELECT ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "MAIN_PRO";
  GRANT SELECT ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT SELECT ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "BS_RBL_MISDB_PROD";
  GRANT SELECT ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "ACL_RBL_MISDB_PROD";
  GRANT SELECT ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT SELECT ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "RBL_MISDB_PROD";
  GRANT SELECT ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT UPDATE ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT UPDATE ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "PREMOC_RBL_MISDB_PROD";
  GRANT UPDATE ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "QPI_RBL_MISDB_PROD";
  GRANT UPDATE ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "ALERT_RBL_MISDB_PROD";
  GRANT UPDATE ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "DWH_RBL_MISDB_PROD";
  GRANT UPDATE ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "MAIN_PRO";
  GRANT UPDATE ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT UPDATE ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "BS_RBL_MISDB_PROD";
  GRANT UPDATE ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "ACL_RBL_MISDB_PROD";
  GRANT UPDATE ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT UPDATE ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "RBL_MISDB_PROD";
  GRANT UPDATE ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT REFERENCES ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "PREMOC_RBL_MISDB_PROD";
  GRANT REFERENCES ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "QPI_RBL_MISDB_PROD";
  GRANT REFERENCES ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "ALERT_RBL_MISDB_PROD";
  GRANT REFERENCES ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "DWH_RBL_MISDB_PROD";
  GRANT REFERENCES ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "MAIN_PRO";
  GRANT REFERENCES ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT REFERENCES ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "BS_RBL_MISDB_PROD";
  GRANT REFERENCES ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "ACL_RBL_MISDB_PROD";
  GRANT REFERENCES ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT REFERENCES ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "RBL_MISDB_PROD";
  GRANT REFERENCES ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT READ ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT READ ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "PREMOC_RBL_MISDB_PROD";
  GRANT READ ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "QPI_RBL_MISDB_PROD";
  GRANT READ ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "ALERT_RBL_MISDB_PROD";
  GRANT READ ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "DWH_RBL_MISDB_PROD";
  GRANT READ ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "MAIN_PRO";
  GRANT READ ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT READ ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "BS_RBL_MISDB_PROD";
  GRANT READ ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "ACL_RBL_MISDB_PROD";
  GRANT READ ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT READ ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "RBL_MISDB_PROD";
  GRANT READ ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT ON COMMIT REFRESH ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "PREMOC_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "QPI_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "ALERT_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "DWH_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "MAIN_PRO";
  GRANT ON COMMIT REFRESH ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "BS_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "ACL_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT QUERY REWRITE ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "PREMOC_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "QPI_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "ALERT_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "DWH_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "MAIN_PRO";
  GRANT QUERY REWRITE ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "BS_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "ACL_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT DEBUG ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT DEBUG ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "PREMOC_RBL_MISDB_PROD";
  GRANT DEBUG ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "QPI_RBL_MISDB_PROD";
  GRANT DEBUG ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "ALERT_RBL_MISDB_PROD";
  GRANT DEBUG ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "DWH_RBL_MISDB_PROD";
  GRANT DEBUG ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "MAIN_PRO";
  GRANT DEBUG ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT DEBUG ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "BS_RBL_MISDB_PROD";
  GRANT DEBUG ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "ACL_RBL_MISDB_PROD";
  GRANT DEBUG ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT DEBUG ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "RBL_MISDB_PROD";
  GRANT DEBUG ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT FLASHBACK ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "PREMOC_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "QPI_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "ALERT_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "DWH_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "MAIN_PRO";
  GRANT FLASHBACK ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "BS_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "ACL_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "RBL_MISDB_PROD";
  GRANT FLASHBACK ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT ALTER ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "ROLE_ALL_DB";
  GRANT ALTER ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "CC_CDR_RBL_STGDB";
  GRANT ALTER ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "RBL_BI_RBL_STGDB";
  GRANT ALTER ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "BSG_READ_RBL_STGDB";
  GRANT ALTER ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "STD_FIN_RBL_STGDB";
  GRANT ALTER ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "RBL_STGDB";
  GRANT ALTER ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT ALTER ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "RBL_TEMPDB";
  GRANT ALTER ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "STG_FIN_RBL_STGDB";
  GRANT ALTER ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "ADF_CDR_RBL_STGDB";
  GRANT DELETE ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "ROLE_ALL_DB";
  GRANT DELETE ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "CC_CDR_RBL_STGDB";
  GRANT DELETE ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "RBL_BI_RBL_STGDB";
  GRANT DELETE ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "BSG_READ_RBL_STGDB";
  GRANT DELETE ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "STD_FIN_RBL_STGDB";
  GRANT DELETE ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "RBL_STGDB";
  GRANT DELETE ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT DELETE ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "RBL_TEMPDB";
  GRANT DELETE ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "STG_FIN_RBL_STGDB";
  GRANT DELETE ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "ADF_CDR_RBL_STGDB";
  GRANT INDEX ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "CC_CDR_RBL_STGDB";
  GRANT INDEX ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "RBL_BI_RBL_STGDB";
  GRANT INDEX ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "BSG_READ_RBL_STGDB";
  GRANT INDEX ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "STD_FIN_RBL_STGDB";
  GRANT INDEX ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "RBL_STGDB";
  GRANT INDEX ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT INDEX ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "RBL_TEMPDB";
  GRANT INDEX ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "STG_FIN_RBL_STGDB";
  GRANT INDEX ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "ADF_CDR_RBL_STGDB";
  GRANT INSERT ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "ROLE_ALL_DB";
  GRANT INSERT ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "CC_CDR_RBL_STGDB";
  GRANT INSERT ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "RBL_BI_RBL_STGDB";
  GRANT INSERT ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "BSG_READ_RBL_STGDB";
  GRANT INSERT ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "STD_FIN_RBL_STGDB";
  GRANT INSERT ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "RBL_STGDB";
  GRANT INSERT ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT INSERT ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "RBL_TEMPDB";
  GRANT INSERT ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "STG_FIN_RBL_STGDB";
  GRANT INSERT ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "ADF_CDR_RBL_STGDB";
  GRANT SELECT ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "ROLE_ALL_DB";
  GRANT SELECT ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "CC_CDR_RBL_STGDB";
  GRANT SELECT ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "RBL_BI_RBL_STGDB";
  GRANT SELECT ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "BSG_READ_RBL_STGDB";
  GRANT SELECT ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "STD_FIN_RBL_STGDB";
  GRANT SELECT ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "RBL_STGDB";
  GRANT SELECT ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT SELECT ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "RBL_TEMPDB";
  GRANT SELECT ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "STG_FIN_RBL_STGDB";
  GRANT SELECT ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "ADF_CDR_RBL_STGDB";
  GRANT UPDATE ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "ROLE_ALL_DB";
  GRANT UPDATE ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "CC_CDR_RBL_STGDB";
  GRANT UPDATE ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "RBL_BI_RBL_STGDB";
  GRANT UPDATE ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "BSG_READ_RBL_STGDB";
  GRANT UPDATE ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "STD_FIN_RBL_STGDB";
  GRANT UPDATE ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "RBL_STGDB";
  GRANT UPDATE ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT UPDATE ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "RBL_TEMPDB";
  GRANT UPDATE ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "STG_FIN_RBL_STGDB";
  GRANT UPDATE ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "ADF_CDR_RBL_STGDB";
  GRANT REFERENCES ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "CC_CDR_RBL_STGDB";
  GRANT REFERENCES ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "RBL_BI_RBL_STGDB";
  GRANT REFERENCES ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "BSG_READ_RBL_STGDB";
  GRANT REFERENCES ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "STD_FIN_RBL_STGDB";
  GRANT REFERENCES ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "RBL_STGDB";
  GRANT REFERENCES ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT REFERENCES ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "RBL_TEMPDB";
  GRANT REFERENCES ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "STG_FIN_RBL_STGDB";
  GRANT REFERENCES ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "ADF_CDR_RBL_STGDB";
  GRANT READ ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "ROLE_ALL_DB";
  GRANT READ ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "CC_CDR_RBL_STGDB";
  GRANT READ ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "RBL_BI_RBL_STGDB";
  GRANT READ ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "BSG_READ_RBL_STGDB";
  GRANT READ ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "STD_FIN_RBL_STGDB";
  GRANT READ ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "RBL_STGDB";
  GRANT READ ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT READ ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "RBL_TEMPDB";
  GRANT READ ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "STG_FIN_RBL_STGDB";
  GRANT READ ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "ADF_CDR_RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "ROLE_ALL_DB";
  GRANT ON COMMIT REFRESH ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "CC_CDR_RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "RBL_BI_RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "BSG_READ_RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "STD_FIN_RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT ON COMMIT REFRESH ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "RBL_TEMPDB";
  GRANT ON COMMIT REFRESH ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "STG_FIN_RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "ADF_CDR_RBL_STGDB";
  GRANT QUERY REWRITE ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "ROLE_ALL_DB";
  GRANT QUERY REWRITE ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "CC_CDR_RBL_STGDB";
  GRANT QUERY REWRITE ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "RBL_BI_RBL_STGDB";
  GRANT QUERY REWRITE ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "BSG_READ_RBL_STGDB";
  GRANT QUERY REWRITE ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "STD_FIN_RBL_STGDB";
  GRANT QUERY REWRITE ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "RBL_STGDB";
  GRANT QUERY REWRITE ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT QUERY REWRITE ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "RBL_TEMPDB";
  GRANT QUERY REWRITE ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "STG_FIN_RBL_STGDB";
  GRANT QUERY REWRITE ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "ADF_CDR_RBL_STGDB";
  GRANT DEBUG ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "ROLE_ALL_DB";
  GRANT DEBUG ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "CC_CDR_RBL_STGDB";
  GRANT DEBUG ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "RBL_BI_RBL_STGDB";
  GRANT DEBUG ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "BSG_READ_RBL_STGDB";
  GRANT DEBUG ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "STD_FIN_RBL_STGDB";
  GRANT DEBUG ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "RBL_STGDB";
  GRANT DEBUG ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT DEBUG ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "RBL_TEMPDB";
  GRANT DEBUG ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "STG_FIN_RBL_STGDB";
  GRANT DEBUG ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "ADF_CDR_RBL_STGDB";
  GRANT FLASHBACK ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "ROLE_ALL_DB";
  GRANT FLASHBACK ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "CC_CDR_RBL_STGDB";
  GRANT FLASHBACK ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "RBL_BI_RBL_STGDB";
  GRANT FLASHBACK ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "BSG_READ_RBL_STGDB";
  GRANT FLASHBACK ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "STD_FIN_RBL_STGDB";
  GRANT FLASHBACK ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "RBL_STGDB";
  GRANT FLASHBACK ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT FLASHBACK ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "RBL_TEMPDB";
  GRANT FLASHBACK ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "STG_FIN_RBL_STGDB";
  GRANT FLASHBACK ON "CURDAT_RBL_MISDB_PROD"."ADVSECURITYVALUEDETAIL" TO "ADF_CDR_RBL_STGDB";
