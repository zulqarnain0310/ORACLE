--------------------------------------------------------
--  DDL for Table TEMPADVACFINANCIALDETAIL
--------------------------------------------------------

  CREATE TABLE "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" 
   (	"ENTITYKEY" NUMBER(19,0), 
	"ACCOUNTENTITYID" NUMBER(10,0), 
	"AC_LASTREVIEWDUEDT" VARCHAR2(200 CHAR), 
	"AC_REVIEWTYPEALT_KEY" NUMBER(5,0), 
	"AC_REVIEWDT" VARCHAR2(200 CHAR), 
	"AC_REVIEWAUTHALT_KEY" NUMBER(5,0), 
	"AC_NEXTREVIEWDUEDT" VARCHAR2(200 CHAR), 
	"DRAWINGPOWER" NUMBER(16,2), 
	"INTTRATE" NUMBER(4,2), 
	"NPADT" VARCHAR2(200 CHAR), 
	"BOOKDEBTS" NUMBER(14,0), 
	"UNDRAWNAMT" NUMBER(14,0), 
	"UNADJSUBSIDY" NUMBER(14,0), 
	"LASTINTTREALISEDT" VARCHAR2(200 CHAR), 
	"MOCSTATUS" VARCHAR2(10 CHAR), 
	"MOCREASON" NUMBER(5,0), 
	"LIMITDISBURSED" NUMBER(14,0), 
	"REFCUSTOMERID" VARCHAR2(20 CHAR), 
	"REFSYSTEMACID" VARCHAR2(30 CHAR), 
	"AUTHORISATIONSTATUS" CHAR(2 CHAR), 
	"EFFECTIVEFROMTIMEKEY" NUMBER(10,0), 
	"EFFECTIVETOTIMEKEY" NUMBER(10,0), 
	"CREATEDBY" VARCHAR2(20 CHAR), 
	"DATECREATED" DATE, 
	"MODIFIEDBY" VARCHAR2(20 CHAR), 
	"DATEMODIFIED" DATE, 
	"APPROVEDBY" VARCHAR2(20 CHAR), 
	"DATEAPPROVED" DATE, 
	"D2KTIMESTAMP" RAW(50), 
	"MOCDATE" DATE, 
	"MOCTYPEALT_KEY" NUMBER(10,0), 
	"CROPDURATION" NUMBER(5,0), 
	"AC_REVIEWAUTHLEVELALT_KEY" NUMBER(5,0), 
	"ISCHANGED" CHAR(1 CHAR), 
	"INT_RECEIVABLE_ADV" NUMBER(16,2), 
	"PENAL_INT_RECEIVABLE" NUMBER(16,2), 
	"ACCRUED_INTEREST" NUMBER(16,2), 
	"PENAL_DUE" NUMBER(16,2), 
	"INTEREST_DUE" NUMBER(16,2), 
	"OTHER_DUES" NUMBER(16,2), 
	"ACCOUNTBLKCODE2" VARCHAR2(20 CHAR)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
  GRANT ALTER ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "ROLE_ALL_DB";
  GRANT ALTER ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "CC_CDR_RBL_STGDB";
  GRANT ALTER ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "MAIN_PRO";
  GRANT ALTER ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "RBL_BI_RBL_STGDB";
  GRANT ALTER ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "ALERT_RBL_MISDB_PROD";
  GRANT ALTER ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "ACL_RBL_MISDB_PROD";
  GRANT ALTER ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT ALTER ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "QPI_RBL_MISDB_PROD";
  GRANT ALTER ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "CURDAT_RBL_MISDB_PROD";
  GRANT ALTER ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "PREMOC_RBL_MISDB_PROD";
  GRANT ALTER ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "RBL_MISDB_PROD";
  GRANT ALTER ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "BSG_READ_RBL_STGDB";
  GRANT ALTER ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "STD_FIN_RBL_STGDB";
  GRANT ALTER ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "BS_RBL_MISDB_PROD";
  GRANT ALTER ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "RBL_STGDB";
  GRANT ALTER ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "DWH_RBL_MISDB_PROD";
  GRANT ALTER ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT ALTER ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT ALTER ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "STG_FIN_RBL_STGDB";
  GRANT ALTER ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT ALTER ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "ADF_CDR_RBL_STGDB";
  GRANT DELETE ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "ROLE_ALL_DB";
  GRANT DELETE ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "CC_CDR_RBL_STGDB";
  GRANT DELETE ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "MAIN_PRO";
  GRANT DELETE ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "RBL_BI_RBL_STGDB";
  GRANT DELETE ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "ALERT_RBL_MISDB_PROD";
  GRANT DELETE ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "ACL_RBL_MISDB_PROD";
  GRANT DELETE ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT DELETE ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "QPI_RBL_MISDB_PROD";
  GRANT DELETE ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "CURDAT_RBL_MISDB_PROD";
  GRANT DELETE ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "PREMOC_RBL_MISDB_PROD";
  GRANT DELETE ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "RBL_MISDB_PROD";
  GRANT DELETE ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "BSG_READ_RBL_STGDB";
  GRANT DELETE ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "STD_FIN_RBL_STGDB";
  GRANT DELETE ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "BS_RBL_MISDB_PROD";
  GRANT DELETE ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "RBL_STGDB";
  GRANT DELETE ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "DWH_RBL_MISDB_PROD";
  GRANT DELETE ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT DELETE ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT DELETE ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "STG_FIN_RBL_STGDB";
  GRANT DELETE ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT DELETE ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "ADF_CDR_RBL_STGDB";
  GRANT INDEX ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "CC_CDR_RBL_STGDB";
  GRANT INDEX ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "MAIN_PRO";
  GRANT INDEX ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "RBL_BI_RBL_STGDB";
  GRANT INDEX ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "ALERT_RBL_MISDB_PROD";
  GRANT INDEX ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "ACL_RBL_MISDB_PROD";
  GRANT INDEX ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT INDEX ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "QPI_RBL_MISDB_PROD";
  GRANT INDEX ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "CURDAT_RBL_MISDB_PROD";
  GRANT INDEX ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "PREMOC_RBL_MISDB_PROD";
  GRANT INDEX ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "RBL_MISDB_PROD";
  GRANT INDEX ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "BSG_READ_RBL_STGDB";
  GRANT INDEX ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "STD_FIN_RBL_STGDB";
  GRANT INDEX ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "BS_RBL_MISDB_PROD";
  GRANT INDEX ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "RBL_STGDB";
  GRANT INDEX ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "DWH_RBL_MISDB_PROD";
  GRANT INDEX ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT INDEX ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT INDEX ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "STG_FIN_RBL_STGDB";
  GRANT INDEX ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT INDEX ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "ADF_CDR_RBL_STGDB";
  GRANT INSERT ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "ROLE_ALL_DB";
  GRANT INSERT ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "CC_CDR_RBL_STGDB";
  GRANT INSERT ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "MAIN_PRO";
  GRANT INSERT ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "RBL_BI_RBL_STGDB";
  GRANT INSERT ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "ALERT_RBL_MISDB_PROD";
  GRANT INSERT ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "ACL_RBL_MISDB_PROD";
  GRANT INSERT ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT INSERT ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "QPI_RBL_MISDB_PROD";
  GRANT INSERT ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "CURDAT_RBL_MISDB_PROD";
  GRANT INSERT ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "PREMOC_RBL_MISDB_PROD";
  GRANT INSERT ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "RBL_MISDB_PROD";
  GRANT INSERT ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "BSG_READ_RBL_STGDB";
  GRANT INSERT ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "STD_FIN_RBL_STGDB";
  GRANT INSERT ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "BS_RBL_MISDB_PROD";
  GRANT INSERT ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "RBL_STGDB";
  GRANT INSERT ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "DWH_RBL_MISDB_PROD";
  GRANT INSERT ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT INSERT ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT INSERT ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "STG_FIN_RBL_STGDB";
  GRANT INSERT ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT INSERT ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "ADF_CDR_RBL_STGDB";
  GRANT SELECT ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "ROLE_ALL_DB";
  GRANT SELECT ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "CC_CDR_RBL_STGDB";
  GRANT SELECT ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "MAIN_PRO";
  GRANT SELECT ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "RBL_BI_RBL_STGDB";
  GRANT SELECT ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "ALERT_RBL_MISDB_PROD";
  GRANT SELECT ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "ACL_RBL_MISDB_PROD";
  GRANT SELECT ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT SELECT ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "QPI_RBL_MISDB_PROD";
  GRANT SELECT ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "CURDAT_RBL_MISDB_PROD";
  GRANT SELECT ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "PREMOC_RBL_MISDB_PROD";
  GRANT SELECT ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "RBL_MISDB_PROD";
  GRANT SELECT ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "BSG_READ_RBL_STGDB";
  GRANT SELECT ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "STD_FIN_RBL_STGDB";
  GRANT SELECT ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "BS_RBL_MISDB_PROD";
  GRANT SELECT ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "RBL_STGDB";
  GRANT SELECT ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "DWH_RBL_MISDB_PROD";
  GRANT SELECT ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT SELECT ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT SELECT ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "STG_FIN_RBL_STGDB";
  GRANT SELECT ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT SELECT ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "ADF_CDR_RBL_STGDB";
  GRANT UPDATE ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "ROLE_ALL_DB";
  GRANT UPDATE ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "CC_CDR_RBL_STGDB";
  GRANT UPDATE ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "MAIN_PRO";
  GRANT UPDATE ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "RBL_BI_RBL_STGDB";
  GRANT UPDATE ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "ALERT_RBL_MISDB_PROD";
  GRANT UPDATE ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "ACL_RBL_MISDB_PROD";
  GRANT UPDATE ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT UPDATE ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "QPI_RBL_MISDB_PROD";
  GRANT UPDATE ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "CURDAT_RBL_MISDB_PROD";
  GRANT UPDATE ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "PREMOC_RBL_MISDB_PROD";
  GRANT UPDATE ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "RBL_MISDB_PROD";
  GRANT UPDATE ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "BSG_READ_RBL_STGDB";
  GRANT UPDATE ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "STD_FIN_RBL_STGDB";
  GRANT UPDATE ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "BS_RBL_MISDB_PROD";
  GRANT UPDATE ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "RBL_STGDB";
  GRANT UPDATE ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "DWH_RBL_MISDB_PROD";
  GRANT UPDATE ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT UPDATE ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT UPDATE ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "STG_FIN_RBL_STGDB";
  GRANT UPDATE ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT UPDATE ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "ADF_CDR_RBL_STGDB";
  GRANT REFERENCES ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "CC_CDR_RBL_STGDB";
  GRANT REFERENCES ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "MAIN_PRO";
  GRANT REFERENCES ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "RBL_BI_RBL_STGDB";
  GRANT REFERENCES ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "ALERT_RBL_MISDB_PROD";
  GRANT REFERENCES ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "ACL_RBL_MISDB_PROD";
  GRANT REFERENCES ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT REFERENCES ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "QPI_RBL_MISDB_PROD";
  GRANT REFERENCES ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "CURDAT_RBL_MISDB_PROD";
  GRANT REFERENCES ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "PREMOC_RBL_MISDB_PROD";
  GRANT REFERENCES ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "RBL_MISDB_PROD";
  GRANT REFERENCES ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "BSG_READ_RBL_STGDB";
  GRANT REFERENCES ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "STD_FIN_RBL_STGDB";
  GRANT REFERENCES ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "BS_RBL_MISDB_PROD";
  GRANT REFERENCES ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "RBL_STGDB";
  GRANT REFERENCES ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "DWH_RBL_MISDB_PROD";
  GRANT REFERENCES ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT REFERENCES ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT REFERENCES ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "STG_FIN_RBL_STGDB";
  GRANT REFERENCES ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT REFERENCES ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "ADF_CDR_RBL_STGDB";
  GRANT READ ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "ROLE_ALL_DB";
  GRANT READ ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "CC_CDR_RBL_STGDB";
  GRANT READ ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "MAIN_PRO";
  GRANT READ ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "RBL_BI_RBL_STGDB";
  GRANT READ ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "ALERT_RBL_MISDB_PROD";
  GRANT READ ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "ACL_RBL_MISDB_PROD";
  GRANT READ ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT READ ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "QPI_RBL_MISDB_PROD";
  GRANT READ ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "CURDAT_RBL_MISDB_PROD";
  GRANT READ ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "PREMOC_RBL_MISDB_PROD";
  GRANT READ ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "RBL_MISDB_PROD";
  GRANT READ ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "BSG_READ_RBL_STGDB";
  GRANT READ ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "STD_FIN_RBL_STGDB";
  GRANT READ ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "BS_RBL_MISDB_PROD";
  GRANT READ ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "RBL_STGDB";
  GRANT READ ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "DWH_RBL_MISDB_PROD";
  GRANT READ ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT READ ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT READ ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "STG_FIN_RBL_STGDB";
  GRANT READ ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT READ ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "ADF_CDR_RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "ROLE_ALL_DB";
  GRANT ON COMMIT REFRESH ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "CC_CDR_RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "MAIN_PRO";
  GRANT ON COMMIT REFRESH ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "RBL_BI_RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "ALERT_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "ACL_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "QPI_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "CURDAT_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "PREMOC_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "BSG_READ_RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "STD_FIN_RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "BS_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "DWH_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT ON COMMIT REFRESH ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "STG_FIN_RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "ADF_CDR_RBL_STGDB";
  GRANT QUERY REWRITE ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "ROLE_ALL_DB";
  GRANT QUERY REWRITE ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "CC_CDR_RBL_STGDB";
  GRANT QUERY REWRITE ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "MAIN_PRO";
  GRANT QUERY REWRITE ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "RBL_BI_RBL_STGDB";
  GRANT QUERY REWRITE ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "ALERT_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "ACL_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "QPI_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "CURDAT_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "PREMOC_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "BSG_READ_RBL_STGDB";
  GRANT QUERY REWRITE ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "STD_FIN_RBL_STGDB";
  GRANT QUERY REWRITE ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "BS_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "RBL_STGDB";
  GRANT QUERY REWRITE ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "DWH_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT QUERY REWRITE ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "STG_FIN_RBL_STGDB";
  GRANT QUERY REWRITE ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "ADF_CDR_RBL_STGDB";
  GRANT DEBUG ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "ROLE_ALL_DB";
  GRANT DEBUG ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "CC_CDR_RBL_STGDB";
  GRANT DEBUG ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "MAIN_PRO";
  GRANT DEBUG ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "RBL_BI_RBL_STGDB";
  GRANT DEBUG ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "ALERT_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "ACL_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "QPI_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "CURDAT_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "PREMOC_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "BSG_READ_RBL_STGDB";
  GRANT DEBUG ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "STD_FIN_RBL_STGDB";
  GRANT DEBUG ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "BS_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "RBL_STGDB";
  GRANT DEBUG ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "DWH_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT DEBUG ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "STG_FIN_RBL_STGDB";
  GRANT DEBUG ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "ADF_CDR_RBL_STGDB";
  GRANT FLASHBACK ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "ROLE_ALL_DB";
  GRANT FLASHBACK ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "CC_CDR_RBL_STGDB";
  GRANT FLASHBACK ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "MAIN_PRO";
  GRANT FLASHBACK ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "RBL_BI_RBL_STGDB";
  GRANT FLASHBACK ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "ALERT_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "ACL_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "QPI_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "CURDAT_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "PREMOC_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "RBL_MISDB_PROD";
  GRANT FLASHBACK ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "BSG_READ_RBL_STGDB";
  GRANT FLASHBACK ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "STD_FIN_RBL_STGDB";
  GRANT FLASHBACK ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "BS_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "RBL_STGDB";
  GRANT FLASHBACK ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "DWH_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT FLASHBACK ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "STG_FIN_RBL_STGDB";
  GRANT FLASHBACK ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "RBL_TEMPDB"."TEMPADVACFINANCIALDETAIL" TO "ADF_CDR_RBL_STGDB";
