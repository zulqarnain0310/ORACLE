--------------------------------------------------------
--  DDL for Table SECURITYVALUEDETAIL_24092022
--------------------------------------------------------

  CREATE TABLE "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" 
   (	"ENTITYKEY" VARCHAR2(50 CHAR), 
	"SECURITYENTITYID" VARCHAR2(50 CHAR), 
	"VALUATIONSOURCEALT_KEY" VARCHAR2(50 CHAR), 
	"VALUATIONDATE" VARCHAR2(50 CHAR), 
	"CURRENTVALUE" VARCHAR2(50 CHAR), 
	"VALUATIONEXPIRYDATE" VARCHAR2(50 CHAR), 
	"AUTHORISATIONSTATUS" VARCHAR2(50 CHAR), 
	"EFFECTIVEFROMTIMEKEY" VARCHAR2(50 CHAR), 
	"EFFECTIVETOTIMEKEY" VARCHAR2(50 CHAR), 
	"CREATEDBY" VARCHAR2(50 CHAR), 
	"DATECREATED" VARCHAR2(50 CHAR), 
	"MODIFIEDBY" VARCHAR2(50 CHAR), 
	"DATEMODIFIED" VARCHAR2(50 CHAR), 
	"APPROVEDBY" VARCHAR2(50 CHAR), 
	"DATEAPPROVED" VARCHAR2(50 CHAR), 
	"D2KTIMESTAMP" VARCHAR2(50 CHAR), 
	"ISCHANGED" VARCHAR2(50 CHAR), 
	"SECURITYVALUEMAIN" VARCHAR2(50 CHAR), 
	"COLLATERALID" VARCHAR2(50 CHAR)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
  GRANT ALTER ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "ROLE_ALL_DB";
  GRANT ALTER ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "CC_CDR_RBL_STGDB";
  GRANT ALTER ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "MAIN_PRO";
  GRANT ALTER ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "RBL_BI_RBL_STGDB";
  GRANT ALTER ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "ALERT_RBL_MISDB_PROD";
  GRANT ALTER ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "ACL_RBL_MISDB_PROD";
  GRANT ALTER ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT ALTER ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "QPI_RBL_MISDB_PROD";
  GRANT ALTER ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "CURDAT_RBL_MISDB_PROD";
  GRANT ALTER ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "PREMOC_RBL_MISDB_PROD";
  GRANT ALTER ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "RBL_MISDB_PROD";
  GRANT ALTER ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "BSG_READ_RBL_STGDB";
  GRANT ALTER ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "STD_FIN_RBL_STGDB";
  GRANT ALTER ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "BS_RBL_MISDB_PROD";
  GRANT ALTER ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "RBL_STGDB";
  GRANT ALTER ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "DWH_RBL_MISDB_PROD";
  GRANT ALTER ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT ALTER ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT ALTER ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "STG_FIN_RBL_STGDB";
  GRANT ALTER ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT ALTER ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "ADF_CDR_RBL_STGDB";
  GRANT DELETE ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "ROLE_ALL_DB";
  GRANT DELETE ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "CC_CDR_RBL_STGDB";
  GRANT DELETE ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "MAIN_PRO";
  GRANT DELETE ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "RBL_BI_RBL_STGDB";
  GRANT DELETE ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "ALERT_RBL_MISDB_PROD";
  GRANT DELETE ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "ACL_RBL_MISDB_PROD";
  GRANT DELETE ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT DELETE ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "QPI_RBL_MISDB_PROD";
  GRANT DELETE ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "CURDAT_RBL_MISDB_PROD";
  GRANT DELETE ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "PREMOC_RBL_MISDB_PROD";
  GRANT DELETE ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "RBL_MISDB_PROD";
  GRANT DELETE ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "BSG_READ_RBL_STGDB";
  GRANT DELETE ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "STD_FIN_RBL_STGDB";
  GRANT DELETE ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "BS_RBL_MISDB_PROD";
  GRANT DELETE ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "RBL_STGDB";
  GRANT DELETE ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "DWH_RBL_MISDB_PROD";
  GRANT DELETE ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT DELETE ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT DELETE ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "STG_FIN_RBL_STGDB";
  GRANT DELETE ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT DELETE ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "ADF_CDR_RBL_STGDB";
  GRANT INDEX ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "CC_CDR_RBL_STGDB";
  GRANT INDEX ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "MAIN_PRO";
  GRANT INDEX ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "RBL_BI_RBL_STGDB";
  GRANT INDEX ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "ALERT_RBL_MISDB_PROD";
  GRANT INDEX ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "ACL_RBL_MISDB_PROD";
  GRANT INDEX ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT INDEX ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "QPI_RBL_MISDB_PROD";
  GRANT INDEX ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "CURDAT_RBL_MISDB_PROD";
  GRANT INDEX ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "PREMOC_RBL_MISDB_PROD";
  GRANT INDEX ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "RBL_MISDB_PROD";
  GRANT INDEX ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "BSG_READ_RBL_STGDB";
  GRANT INDEX ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "STD_FIN_RBL_STGDB";
  GRANT INDEX ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "BS_RBL_MISDB_PROD";
  GRANT INDEX ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "RBL_STGDB";
  GRANT INDEX ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "DWH_RBL_MISDB_PROD";
  GRANT INDEX ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT INDEX ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT INDEX ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "STG_FIN_RBL_STGDB";
  GRANT INDEX ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT INDEX ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "ADF_CDR_RBL_STGDB";
  GRANT INSERT ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "ROLE_ALL_DB";
  GRANT INSERT ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "CC_CDR_RBL_STGDB";
  GRANT INSERT ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "MAIN_PRO";
  GRANT INSERT ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "RBL_BI_RBL_STGDB";
  GRANT INSERT ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "ALERT_RBL_MISDB_PROD";
  GRANT INSERT ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "ACL_RBL_MISDB_PROD";
  GRANT INSERT ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT INSERT ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "QPI_RBL_MISDB_PROD";
  GRANT INSERT ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "CURDAT_RBL_MISDB_PROD";
  GRANT INSERT ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "PREMOC_RBL_MISDB_PROD";
  GRANT INSERT ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "RBL_MISDB_PROD";
  GRANT INSERT ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "BSG_READ_RBL_STGDB";
  GRANT INSERT ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "STD_FIN_RBL_STGDB";
  GRANT INSERT ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "BS_RBL_MISDB_PROD";
  GRANT INSERT ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "RBL_STGDB";
  GRANT INSERT ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "DWH_RBL_MISDB_PROD";
  GRANT INSERT ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT INSERT ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT INSERT ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "STG_FIN_RBL_STGDB";
  GRANT INSERT ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT INSERT ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "ADF_CDR_RBL_STGDB";
  GRANT SELECT ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "ROLE_ALL_DB";
  GRANT SELECT ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "CC_CDR_RBL_STGDB";
  GRANT SELECT ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "MAIN_PRO";
  GRANT SELECT ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "RBL_BI_RBL_STGDB";
  GRANT SELECT ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "ALERT_RBL_MISDB_PROD";
  GRANT SELECT ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "ACL_RBL_MISDB_PROD";
  GRANT SELECT ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT SELECT ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "QPI_RBL_MISDB_PROD";
  GRANT SELECT ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "CURDAT_RBL_MISDB_PROD";
  GRANT SELECT ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "PREMOC_RBL_MISDB_PROD";
  GRANT SELECT ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "RBL_MISDB_PROD";
  GRANT SELECT ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "BSG_READ_RBL_STGDB";
  GRANT SELECT ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "STD_FIN_RBL_STGDB";
  GRANT SELECT ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "BS_RBL_MISDB_PROD";
  GRANT SELECT ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "RBL_STGDB";
  GRANT SELECT ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "DWH_RBL_MISDB_PROD";
  GRANT SELECT ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT SELECT ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT SELECT ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "STG_FIN_RBL_STGDB";
  GRANT SELECT ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT SELECT ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "ADF_CDR_RBL_STGDB";
  GRANT UPDATE ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "ROLE_ALL_DB";
  GRANT UPDATE ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "CC_CDR_RBL_STGDB";
  GRANT UPDATE ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "MAIN_PRO";
  GRANT UPDATE ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "RBL_BI_RBL_STGDB";
  GRANT UPDATE ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "ALERT_RBL_MISDB_PROD";
  GRANT UPDATE ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "ACL_RBL_MISDB_PROD";
  GRANT UPDATE ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT UPDATE ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "QPI_RBL_MISDB_PROD";
  GRANT UPDATE ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "CURDAT_RBL_MISDB_PROD";
  GRANT UPDATE ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "PREMOC_RBL_MISDB_PROD";
  GRANT UPDATE ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "RBL_MISDB_PROD";
  GRANT UPDATE ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "BSG_READ_RBL_STGDB";
  GRANT UPDATE ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "STD_FIN_RBL_STGDB";
  GRANT UPDATE ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "BS_RBL_MISDB_PROD";
  GRANT UPDATE ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "RBL_STGDB";
  GRANT UPDATE ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "DWH_RBL_MISDB_PROD";
  GRANT UPDATE ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT UPDATE ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT UPDATE ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "STG_FIN_RBL_STGDB";
  GRANT UPDATE ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT UPDATE ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "ADF_CDR_RBL_STGDB";
  GRANT REFERENCES ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "CC_CDR_RBL_STGDB";
  GRANT REFERENCES ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "MAIN_PRO";
  GRANT REFERENCES ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "RBL_BI_RBL_STGDB";
  GRANT REFERENCES ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "ALERT_RBL_MISDB_PROD";
  GRANT REFERENCES ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "ACL_RBL_MISDB_PROD";
  GRANT REFERENCES ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT REFERENCES ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "QPI_RBL_MISDB_PROD";
  GRANT REFERENCES ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "CURDAT_RBL_MISDB_PROD";
  GRANT REFERENCES ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "PREMOC_RBL_MISDB_PROD";
  GRANT REFERENCES ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "RBL_MISDB_PROD";
  GRANT REFERENCES ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "BSG_READ_RBL_STGDB";
  GRANT REFERENCES ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "STD_FIN_RBL_STGDB";
  GRANT REFERENCES ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "BS_RBL_MISDB_PROD";
  GRANT REFERENCES ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "RBL_STGDB";
  GRANT REFERENCES ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "DWH_RBL_MISDB_PROD";
  GRANT REFERENCES ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT REFERENCES ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT REFERENCES ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "STG_FIN_RBL_STGDB";
  GRANT REFERENCES ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT REFERENCES ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "ADF_CDR_RBL_STGDB";
  GRANT READ ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "ROLE_ALL_DB";
  GRANT READ ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "CC_CDR_RBL_STGDB";
  GRANT READ ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "MAIN_PRO";
  GRANT READ ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "RBL_BI_RBL_STGDB";
  GRANT READ ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "ALERT_RBL_MISDB_PROD";
  GRANT READ ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "ACL_RBL_MISDB_PROD";
  GRANT READ ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT READ ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "QPI_RBL_MISDB_PROD";
  GRANT READ ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "CURDAT_RBL_MISDB_PROD";
  GRANT READ ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "PREMOC_RBL_MISDB_PROD";
  GRANT READ ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "RBL_MISDB_PROD";
  GRANT READ ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "BSG_READ_RBL_STGDB";
  GRANT READ ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "STD_FIN_RBL_STGDB";
  GRANT READ ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "BS_RBL_MISDB_PROD";
  GRANT READ ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "RBL_STGDB";
  GRANT READ ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "DWH_RBL_MISDB_PROD";
  GRANT READ ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT READ ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT READ ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "STG_FIN_RBL_STGDB";
  GRANT READ ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT READ ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "ADF_CDR_RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "ROLE_ALL_DB";
  GRANT ON COMMIT REFRESH ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "CC_CDR_RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "MAIN_PRO";
  GRANT ON COMMIT REFRESH ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "RBL_BI_RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "ALERT_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "ACL_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "QPI_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "CURDAT_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "PREMOC_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "BSG_READ_RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "STD_FIN_RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "BS_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "DWH_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT ON COMMIT REFRESH ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "STG_FIN_RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "ADF_CDR_RBL_STGDB";
  GRANT QUERY REWRITE ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "ROLE_ALL_DB";
  GRANT QUERY REWRITE ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "CC_CDR_RBL_STGDB";
  GRANT QUERY REWRITE ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "MAIN_PRO";
  GRANT QUERY REWRITE ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "RBL_BI_RBL_STGDB";
  GRANT QUERY REWRITE ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "ALERT_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "ACL_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "QPI_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "CURDAT_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "PREMOC_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "BSG_READ_RBL_STGDB";
  GRANT QUERY REWRITE ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "STD_FIN_RBL_STGDB";
  GRANT QUERY REWRITE ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "BS_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "RBL_STGDB";
  GRANT QUERY REWRITE ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "DWH_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT QUERY REWRITE ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "STG_FIN_RBL_STGDB";
  GRANT QUERY REWRITE ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "ADF_CDR_RBL_STGDB";
  GRANT DEBUG ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "ROLE_ALL_DB";
  GRANT DEBUG ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "CC_CDR_RBL_STGDB";
  GRANT DEBUG ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "MAIN_PRO";
  GRANT DEBUG ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "RBL_BI_RBL_STGDB";
  GRANT DEBUG ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "ALERT_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "ACL_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "QPI_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "CURDAT_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "PREMOC_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "BSG_READ_RBL_STGDB";
  GRANT DEBUG ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "STD_FIN_RBL_STGDB";
  GRANT DEBUG ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "BS_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "RBL_STGDB";
  GRANT DEBUG ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "DWH_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT DEBUG ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "STG_FIN_RBL_STGDB";
  GRANT DEBUG ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "ADF_CDR_RBL_STGDB";
  GRANT FLASHBACK ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "ROLE_ALL_DB";
  GRANT FLASHBACK ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "CC_CDR_RBL_STGDB";
  GRANT FLASHBACK ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "MAIN_PRO";
  GRANT FLASHBACK ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "RBL_BI_RBL_STGDB";
  GRANT FLASHBACK ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "ALERT_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "ACL_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "QPI_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "CURDAT_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "PREMOC_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "RBL_MISDB_PROD";
  GRANT FLASHBACK ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "BSG_READ_RBL_STGDB";
  GRANT FLASHBACK ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "STD_FIN_RBL_STGDB";
  GRANT FLASHBACK ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "BS_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "RBL_STGDB";
  GRANT FLASHBACK ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "DWH_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT FLASHBACK ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "STG_FIN_RBL_STGDB";
  GRANT FLASHBACK ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "RBL_TEMPDB"."SECURITYVALUEDETAIL_24092022" TO "ADF_CDR_RBL_STGDB";
