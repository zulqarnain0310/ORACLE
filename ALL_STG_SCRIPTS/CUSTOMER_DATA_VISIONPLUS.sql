--------------------------------------------------------
--  DDL for Table CUSTOMER_DATA_VISIONPLUS
--------------------------------------------------------

  CREATE TABLE "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" 
   (	"DATE_OF_DATA" NVARCHAR2(255), 
	"SOURCE_SYSTEM_NAME" NVARCHAR2(255), 
	"CUSTOMER_ID" NVARCHAR2(255), 
	"CUSTOMER_NAME" NVARCHAR2(255), 
	"CUSTOMER_CONSTITUTION" NVARCHAR2(255), 
	"GENDER" NVARCHAR2(255), 
	"CUSTOMER_SEGMENT_CODE" NVARCHAR2(255), 
	"PAN_NO" NVARCHAR2(255), 
	"ASSET_CLASS" NVARCHAR2(255), 
	"NPA_DATE" NVARCHAR2(255), 
	"DBT_LOS_DATE" NVARCHAR2(255), 
	"ALWAYS_NPA" NVARCHAR2(255)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
  GRANT ALTER ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "ROLE_ALL_DB";
  GRANT ALTER ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "CC_CDR_RBL_STGDB";
  GRANT ALTER ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "MAIN_PRO";
  GRANT ALTER ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "RBL_BI_RBL_STGDB";
  GRANT ALTER ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "ALERT_RBL_MISDB_PROD";
  GRANT ALTER ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "ACL_RBL_MISDB_PROD";
  GRANT ALTER ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT ALTER ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "QPI_RBL_MISDB_PROD";
  GRANT ALTER ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "CURDAT_RBL_MISDB_PROD";
  GRANT ALTER ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "PREMOC_RBL_MISDB_PROD";
  GRANT ALTER ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "RBL_MISDB_PROD";
  GRANT ALTER ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "BSG_READ_RBL_STGDB";
  GRANT ALTER ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "STD_FIN_RBL_STGDB";
  GRANT ALTER ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "BS_RBL_MISDB_PROD";
  GRANT ALTER ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "DWH_RBL_MISDB_PROD";
  GRANT ALTER ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT ALTER ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "RBL_TEMPDB";
  GRANT ALTER ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT ALTER ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "STG_FIN_RBL_STGDB";
  GRANT ALTER ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT ALTER ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "ADF_CDR_RBL_STGDB";
  GRANT DELETE ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "ROLE_ALL_DB";
  GRANT DELETE ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "CC_CDR_RBL_STGDB";
  GRANT DELETE ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "MAIN_PRO";
  GRANT DELETE ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "RBL_BI_RBL_STGDB";
  GRANT DELETE ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "ALERT_RBL_MISDB_PROD";
  GRANT DELETE ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "ACL_RBL_MISDB_PROD";
  GRANT DELETE ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT DELETE ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "QPI_RBL_MISDB_PROD";
  GRANT DELETE ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "CURDAT_RBL_MISDB_PROD";
  GRANT DELETE ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "PREMOC_RBL_MISDB_PROD";
  GRANT DELETE ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "RBL_MISDB_PROD";
  GRANT DELETE ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "BSG_READ_RBL_STGDB";
  GRANT DELETE ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "STD_FIN_RBL_STGDB";
  GRANT DELETE ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "BS_RBL_MISDB_PROD";
  GRANT DELETE ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "DWH_RBL_MISDB_PROD";
  GRANT DELETE ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT DELETE ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "RBL_TEMPDB";
  GRANT DELETE ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT DELETE ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "STG_FIN_RBL_STGDB";
  GRANT DELETE ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT DELETE ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "ADF_CDR_RBL_STGDB";
  GRANT INDEX ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "CC_CDR_RBL_STGDB";
  GRANT INDEX ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "MAIN_PRO";
  GRANT INDEX ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "RBL_BI_RBL_STGDB";
  GRANT INDEX ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "ALERT_RBL_MISDB_PROD";
  GRANT INDEX ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "ACL_RBL_MISDB_PROD";
  GRANT INDEX ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT INDEX ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "QPI_RBL_MISDB_PROD";
  GRANT INDEX ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "CURDAT_RBL_MISDB_PROD";
  GRANT INDEX ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "PREMOC_RBL_MISDB_PROD";
  GRANT INDEX ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "RBL_MISDB_PROD";
  GRANT INDEX ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "BSG_READ_RBL_STGDB";
  GRANT INDEX ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "STD_FIN_RBL_STGDB";
  GRANT INDEX ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "BS_RBL_MISDB_PROD";
  GRANT INDEX ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "DWH_RBL_MISDB_PROD";
  GRANT INDEX ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT INDEX ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "RBL_TEMPDB";
  GRANT INDEX ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT INDEX ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "STG_FIN_RBL_STGDB";
  GRANT INDEX ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT INDEX ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "ADF_CDR_RBL_STGDB";
  GRANT INSERT ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "ROLE_ALL_DB";
  GRANT INSERT ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "CC_CDR_RBL_STGDB";
  GRANT INSERT ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "MAIN_PRO";
  GRANT INSERT ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "RBL_BI_RBL_STGDB";
  GRANT INSERT ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "ALERT_RBL_MISDB_PROD";
  GRANT INSERT ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "ACL_RBL_MISDB_PROD";
  GRANT INSERT ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT INSERT ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "QPI_RBL_MISDB_PROD";
  GRANT INSERT ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "CURDAT_RBL_MISDB_PROD";
  GRANT INSERT ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "PREMOC_RBL_MISDB_PROD";
  GRANT INSERT ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "RBL_MISDB_PROD";
  GRANT INSERT ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "BSG_READ_RBL_STGDB";
  GRANT INSERT ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "STD_FIN_RBL_STGDB";
  GRANT INSERT ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "BS_RBL_MISDB_PROD";
  GRANT INSERT ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "DWH_RBL_MISDB_PROD";
  GRANT INSERT ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT INSERT ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "RBL_TEMPDB";
  GRANT INSERT ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT INSERT ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "STG_FIN_RBL_STGDB";
  GRANT INSERT ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT INSERT ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "ADF_CDR_RBL_STGDB";
  GRANT SELECT ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "ROLE_ALL_DB";
  GRANT SELECT ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "CC_CDR_RBL_STGDB";
  GRANT SELECT ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "MAIN_PRO";
  GRANT SELECT ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "RBL_BI_RBL_STGDB";
  GRANT SELECT ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "ALERT_RBL_MISDB_PROD";
  GRANT SELECT ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "ACL_RBL_MISDB_PROD";
  GRANT SELECT ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT SELECT ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "QPI_RBL_MISDB_PROD";
  GRANT SELECT ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "CURDAT_RBL_MISDB_PROD";
  GRANT SELECT ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "PREMOC_RBL_MISDB_PROD";
  GRANT SELECT ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "RBL_MISDB_PROD";
  GRANT SELECT ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "BSG_READ_RBL_STGDB";
  GRANT SELECT ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "STD_FIN_RBL_STGDB";
  GRANT SELECT ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "BS_RBL_MISDB_PROD";
  GRANT SELECT ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "DWH_RBL_MISDB_PROD";
  GRANT SELECT ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT SELECT ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "RBL_TEMPDB";
  GRANT SELECT ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT SELECT ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "STG_FIN_RBL_STGDB";
  GRANT SELECT ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT SELECT ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "ADF_CDR_RBL_STGDB";
  GRANT UPDATE ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "ROLE_ALL_DB";
  GRANT UPDATE ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "CC_CDR_RBL_STGDB";
  GRANT UPDATE ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "MAIN_PRO";
  GRANT UPDATE ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "RBL_BI_RBL_STGDB";
  GRANT UPDATE ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "ALERT_RBL_MISDB_PROD";
  GRANT UPDATE ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "ACL_RBL_MISDB_PROD";
  GRANT UPDATE ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT UPDATE ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "QPI_RBL_MISDB_PROD";
  GRANT UPDATE ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "CURDAT_RBL_MISDB_PROD";
  GRANT UPDATE ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "PREMOC_RBL_MISDB_PROD";
  GRANT UPDATE ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "RBL_MISDB_PROD";
  GRANT UPDATE ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "BSG_READ_RBL_STGDB";
  GRANT UPDATE ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "STD_FIN_RBL_STGDB";
  GRANT UPDATE ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "BS_RBL_MISDB_PROD";
  GRANT UPDATE ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "DWH_RBL_MISDB_PROD";
  GRANT UPDATE ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT UPDATE ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "RBL_TEMPDB";
  GRANT UPDATE ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT UPDATE ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "STG_FIN_RBL_STGDB";
  GRANT UPDATE ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT UPDATE ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "ADF_CDR_RBL_STGDB";
  GRANT REFERENCES ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "CC_CDR_RBL_STGDB";
  GRANT REFERENCES ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "MAIN_PRO";
  GRANT REFERENCES ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "RBL_BI_RBL_STGDB";
  GRANT REFERENCES ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "ALERT_RBL_MISDB_PROD";
  GRANT REFERENCES ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "ACL_RBL_MISDB_PROD";
  GRANT REFERENCES ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT REFERENCES ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "QPI_RBL_MISDB_PROD";
  GRANT REFERENCES ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "CURDAT_RBL_MISDB_PROD";
  GRANT REFERENCES ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "PREMOC_RBL_MISDB_PROD";
  GRANT REFERENCES ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "RBL_MISDB_PROD";
  GRANT REFERENCES ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "BSG_READ_RBL_STGDB";
  GRANT REFERENCES ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "STD_FIN_RBL_STGDB";
  GRANT REFERENCES ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "BS_RBL_MISDB_PROD";
  GRANT REFERENCES ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "DWH_RBL_MISDB_PROD";
  GRANT REFERENCES ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT REFERENCES ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "RBL_TEMPDB";
  GRANT REFERENCES ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT REFERENCES ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "STG_FIN_RBL_STGDB";
  GRANT REFERENCES ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT REFERENCES ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "ADF_CDR_RBL_STGDB";
  GRANT READ ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "ROLE_ALL_DB";
  GRANT READ ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "CC_CDR_RBL_STGDB";
  GRANT READ ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "MAIN_PRO";
  GRANT READ ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "RBL_BI_RBL_STGDB";
  GRANT READ ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "ALERT_RBL_MISDB_PROD";
  GRANT READ ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "ACL_RBL_MISDB_PROD";
  GRANT READ ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT READ ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "QPI_RBL_MISDB_PROD";
  GRANT READ ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "CURDAT_RBL_MISDB_PROD";
  GRANT READ ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "PREMOC_RBL_MISDB_PROD";
  GRANT READ ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "RBL_MISDB_PROD";
  GRANT READ ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "BSG_READ_RBL_STGDB";
  GRANT READ ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "STD_FIN_RBL_STGDB";
  GRANT READ ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "BS_RBL_MISDB_PROD";
  GRANT READ ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "DWH_RBL_MISDB_PROD";
  GRANT READ ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT READ ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "RBL_TEMPDB";
  GRANT READ ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT READ ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "STG_FIN_RBL_STGDB";
  GRANT READ ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT READ ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "ADF_CDR_RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "ROLE_ALL_DB";
  GRANT ON COMMIT REFRESH ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "CC_CDR_RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "MAIN_PRO";
  GRANT ON COMMIT REFRESH ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "RBL_BI_RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "ALERT_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "ACL_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "QPI_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "CURDAT_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "PREMOC_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "BSG_READ_RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "STD_FIN_RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "BS_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "DWH_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT ON COMMIT REFRESH ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "RBL_TEMPDB";
  GRANT ON COMMIT REFRESH ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "STG_FIN_RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "ADF_CDR_RBL_STGDB";
  GRANT QUERY REWRITE ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "ROLE_ALL_DB";
  GRANT QUERY REWRITE ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "CC_CDR_RBL_STGDB";
  GRANT QUERY REWRITE ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "MAIN_PRO";
  GRANT QUERY REWRITE ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "RBL_BI_RBL_STGDB";
  GRANT QUERY REWRITE ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "ALERT_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "ACL_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "QPI_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "CURDAT_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "PREMOC_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "BSG_READ_RBL_STGDB";
  GRANT QUERY REWRITE ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "STD_FIN_RBL_STGDB";
  GRANT QUERY REWRITE ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "BS_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "DWH_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT QUERY REWRITE ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "RBL_TEMPDB";
  GRANT QUERY REWRITE ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "STG_FIN_RBL_STGDB";
  GRANT QUERY REWRITE ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "ADF_CDR_RBL_STGDB";
  GRANT DEBUG ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "ROLE_ALL_DB";
  GRANT DEBUG ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "CC_CDR_RBL_STGDB";
  GRANT DEBUG ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "MAIN_PRO";
  GRANT DEBUG ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "RBL_BI_RBL_STGDB";
  GRANT DEBUG ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "ALERT_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "ACL_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "QPI_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "CURDAT_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "PREMOC_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "BSG_READ_RBL_STGDB";
  GRANT DEBUG ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "STD_FIN_RBL_STGDB";
  GRANT DEBUG ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "BS_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "DWH_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT DEBUG ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "RBL_TEMPDB";
  GRANT DEBUG ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "STG_FIN_RBL_STGDB";
  GRANT DEBUG ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "ADF_CDR_RBL_STGDB";
  GRANT FLASHBACK ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "ROLE_ALL_DB";
  GRANT FLASHBACK ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "CC_CDR_RBL_STGDB";
  GRANT FLASHBACK ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "MAIN_PRO";
  GRANT FLASHBACK ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "RBL_BI_RBL_STGDB";
  GRANT FLASHBACK ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "ALERT_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "ACL_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "QPI_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "CURDAT_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "PREMOC_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "RBL_MISDB_PROD";
  GRANT FLASHBACK ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "BSG_READ_RBL_STGDB";
  GRANT FLASHBACK ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "STD_FIN_RBL_STGDB";
  GRANT FLASHBACK ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "BS_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "DWH_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT FLASHBACK ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "RBL_TEMPDB";
  GRANT FLASHBACK ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "STG_FIN_RBL_STGDB";
  GRANT FLASHBACK ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "RBL_STGDB"."CUSTOMER_DATA_VISIONPLUS" TO "ADF_CDR_RBL_STGDB";
