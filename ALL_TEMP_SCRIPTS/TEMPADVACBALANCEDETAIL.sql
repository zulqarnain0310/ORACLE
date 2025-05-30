--------------------------------------------------------
--  DDL for Table TEMPADVACBALANCEDETAIL
--------------------------------------------------------

  CREATE TABLE "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" 
   (	"ENTITYKEY" NUMBER(19,0), 
	"ACCOUNTENTITYID" NUMBER(10,0), 
	"ASSETCLASSALT_KEY" NUMBER(5,0), 
	"BALANCEINCURRENCY" NUMBER(16,2), 
	"BALANCE" NUMBER(16,2), 
	"SIGNBALANCE" NUMBER(16,2), 
	"LASTCRDT" VARCHAR2(200 CHAR), 
	"OVERDUE" NUMBER(16,2), 
	"TOTALPROV" NUMBER(16,2), 
	"REFCUSTOMERID" VARCHAR2(20 CHAR), 
	"REFSYSTEMACID" VARCHAR2(30 CHAR), 
	"AUTHORISATIONSTATUS" CHAR(2 CHAR), 
	"EFFECTIVEFROMTIMEKEY" NUMBER(10,0), 
	"EFFECTIVETOTIMEKEY" NUMBER(10,0), 
	"OVERDUESINCEDT" VARCHAR2(200 CHAR), 
	"MOCSTATUS" CHAR(1 CHAR), 
	"MOCDATE" DATE, 
	"MOCTYPEALT_KEY" NUMBER(10,0), 
	"OLD_OVERDUESINCEDT" VARCHAR2(200 CHAR), 
	"OLD_OVERDUE" NUMBER(16,2), 
	"ORG_TOTALPROV" NUMBER(16,2), 
	"INTREVERSEAMT" NUMBER(16,2), 
	"UNAPPLIEDINTAMOUNT" NUMBER(18,2), 
	"PS_BALANCE" NUMBER(16,2), 
	"NPS_BALANCE" NUMBER(16,2), 
	"DATECREATED" VARCHAR2(200 CHAR), 
	"MODIFIEDBY" VARCHAR2(50 CHAR), 
	"DATEMODIFIED" VARCHAR2(200 CHAR), 
	"APPROVEDBY" VARCHAR2(50 CHAR), 
	"DATEAPPROVED" VARCHAR2(200 CHAR), 
	"CREATEDBY" VARCHAR2(50 CHAR), 
	"UPGRADEDATE" VARCHAR2(200 CHAR), 
	"OVERDUEPRINCIPAL" NUMBER(18,2), 
	"NOTIONALINTTAMT" NUMBER(16,2), 
	"PRINCIPALBALANCE" NUMBER(18,2), 
	"OVERDUEINTEREST" NUMBER(16,2), 
	"ADVANCERECOVERY" NUMBER(16,2), 
	"PS_NPS_FLAG" VARCHAR2(3 CHAR), 
	"ISCHANGED" CHAR(1 CHAR), 
	"OVERDUEPRINCIPALDT" VARCHAR2(200 CHAR), 
	"OVERDUEINTDT" VARCHAR2(200 CHAR), 
	"OVEROTHERDUE" NUMBER(16,2), 
	"OVERDUEOTHERDT" VARCHAR2(200 CHAR), 
	"SOURCENPADATE" VARCHAR2(200 CHAR), 
	"SOURCEASSETCLASS" VARCHAR2(100 CHAR), 
	"DFVAMT" NUMBER(18,2), 
	"INTERESTRECEIVABLE" NUMBER(18,2)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
  GRANT ALTER ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "ROLE_ALL_DB";
  GRANT ALTER ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "CC_CDR_RBL_STGDB";
  GRANT ALTER ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "MAIN_PRO";
  GRANT ALTER ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "RBL_BI_RBL_STGDB";
  GRANT ALTER ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "ALERT_RBL_MISDB_PROD";
  GRANT ALTER ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "ACL_RBL_MISDB_PROD";
  GRANT ALTER ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT ALTER ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "QPI_RBL_MISDB_PROD";
  GRANT ALTER ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "CURDAT_RBL_MISDB_PROD";
  GRANT ALTER ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "PREMOC_RBL_MISDB_PROD";
  GRANT ALTER ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "RBL_MISDB_PROD";
  GRANT ALTER ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "BSG_READ_RBL_STGDB";
  GRANT ALTER ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "STD_FIN_RBL_STGDB";
  GRANT ALTER ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "BS_RBL_MISDB_PROD";
  GRANT ALTER ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "RBL_STGDB";
  GRANT ALTER ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "DWH_RBL_MISDB_PROD";
  GRANT ALTER ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT ALTER ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT ALTER ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "STG_FIN_RBL_STGDB";
  GRANT ALTER ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT ALTER ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "ADF_CDR_RBL_STGDB";
  GRANT DELETE ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "ROLE_ALL_DB";
  GRANT DELETE ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "CC_CDR_RBL_STGDB";
  GRANT DELETE ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "MAIN_PRO";
  GRANT DELETE ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "RBL_BI_RBL_STGDB";
  GRANT DELETE ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "ALERT_RBL_MISDB_PROD";
  GRANT DELETE ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "ACL_RBL_MISDB_PROD";
  GRANT DELETE ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT DELETE ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "QPI_RBL_MISDB_PROD";
  GRANT DELETE ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "CURDAT_RBL_MISDB_PROD";
  GRANT DELETE ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "PREMOC_RBL_MISDB_PROD";
  GRANT DELETE ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "RBL_MISDB_PROD";
  GRANT DELETE ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "BSG_READ_RBL_STGDB";
  GRANT DELETE ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "STD_FIN_RBL_STGDB";
  GRANT DELETE ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "BS_RBL_MISDB_PROD";
  GRANT DELETE ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "RBL_STGDB";
  GRANT DELETE ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "DWH_RBL_MISDB_PROD";
  GRANT DELETE ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT DELETE ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT DELETE ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "STG_FIN_RBL_STGDB";
  GRANT DELETE ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT DELETE ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "ADF_CDR_RBL_STGDB";
  GRANT INDEX ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "CC_CDR_RBL_STGDB";
  GRANT INDEX ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "MAIN_PRO";
  GRANT INDEX ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "RBL_BI_RBL_STGDB";
  GRANT INDEX ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "ALERT_RBL_MISDB_PROD";
  GRANT INDEX ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "ACL_RBL_MISDB_PROD";
  GRANT INDEX ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT INDEX ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "QPI_RBL_MISDB_PROD";
  GRANT INDEX ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "CURDAT_RBL_MISDB_PROD";
  GRANT INDEX ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "PREMOC_RBL_MISDB_PROD";
  GRANT INDEX ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "RBL_MISDB_PROD";
  GRANT INDEX ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "BSG_READ_RBL_STGDB";
  GRANT INDEX ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "STD_FIN_RBL_STGDB";
  GRANT INDEX ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "BS_RBL_MISDB_PROD";
  GRANT INDEX ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "RBL_STGDB";
  GRANT INDEX ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "DWH_RBL_MISDB_PROD";
  GRANT INDEX ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT INDEX ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT INDEX ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "STG_FIN_RBL_STGDB";
  GRANT INDEX ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT INDEX ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "ADF_CDR_RBL_STGDB";
  GRANT INSERT ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "ROLE_ALL_DB";
  GRANT INSERT ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "CC_CDR_RBL_STGDB";
  GRANT INSERT ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "MAIN_PRO";
  GRANT INSERT ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "RBL_BI_RBL_STGDB";
  GRANT INSERT ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "ALERT_RBL_MISDB_PROD";
  GRANT INSERT ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "ACL_RBL_MISDB_PROD";
  GRANT INSERT ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT INSERT ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "QPI_RBL_MISDB_PROD";
  GRANT INSERT ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "CURDAT_RBL_MISDB_PROD";
  GRANT INSERT ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "PREMOC_RBL_MISDB_PROD";
  GRANT INSERT ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "RBL_MISDB_PROD";
  GRANT INSERT ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "BSG_READ_RBL_STGDB";
  GRANT INSERT ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "STD_FIN_RBL_STGDB";
  GRANT INSERT ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "BS_RBL_MISDB_PROD";
  GRANT INSERT ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "RBL_STGDB";
  GRANT INSERT ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "DWH_RBL_MISDB_PROD";
  GRANT INSERT ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT INSERT ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT INSERT ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "STG_FIN_RBL_STGDB";
  GRANT INSERT ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT INSERT ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "ADF_CDR_RBL_STGDB";
  GRANT SELECT ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "ROLE_ALL_DB";
  GRANT SELECT ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "CC_CDR_RBL_STGDB";
  GRANT SELECT ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "MAIN_PRO";
  GRANT SELECT ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "RBL_BI_RBL_STGDB";
  GRANT SELECT ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "ALERT_RBL_MISDB_PROD";
  GRANT SELECT ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "ACL_RBL_MISDB_PROD";
  GRANT SELECT ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT SELECT ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "QPI_RBL_MISDB_PROD";
  GRANT SELECT ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "CURDAT_RBL_MISDB_PROD";
  GRANT SELECT ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "PREMOC_RBL_MISDB_PROD";
  GRANT SELECT ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "RBL_MISDB_PROD";
  GRANT SELECT ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "BSG_READ_RBL_STGDB";
  GRANT SELECT ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "STD_FIN_RBL_STGDB";
  GRANT SELECT ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "BS_RBL_MISDB_PROD";
  GRANT SELECT ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "RBL_STGDB";
  GRANT SELECT ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "DWH_RBL_MISDB_PROD";
  GRANT SELECT ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT SELECT ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT SELECT ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "STG_FIN_RBL_STGDB";
  GRANT SELECT ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT SELECT ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "ADF_CDR_RBL_STGDB";
  GRANT UPDATE ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "ROLE_ALL_DB";
  GRANT UPDATE ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "CC_CDR_RBL_STGDB";
  GRANT UPDATE ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "MAIN_PRO";
  GRANT UPDATE ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "RBL_BI_RBL_STGDB";
  GRANT UPDATE ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "ALERT_RBL_MISDB_PROD";
  GRANT UPDATE ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "ACL_RBL_MISDB_PROD";
  GRANT UPDATE ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT UPDATE ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "QPI_RBL_MISDB_PROD";
  GRANT UPDATE ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "CURDAT_RBL_MISDB_PROD";
  GRANT UPDATE ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "PREMOC_RBL_MISDB_PROD";
  GRANT UPDATE ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "RBL_MISDB_PROD";
  GRANT UPDATE ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "BSG_READ_RBL_STGDB";
  GRANT UPDATE ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "STD_FIN_RBL_STGDB";
  GRANT UPDATE ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "BS_RBL_MISDB_PROD";
  GRANT UPDATE ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "RBL_STGDB";
  GRANT UPDATE ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "DWH_RBL_MISDB_PROD";
  GRANT UPDATE ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT UPDATE ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT UPDATE ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "STG_FIN_RBL_STGDB";
  GRANT UPDATE ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT UPDATE ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "ADF_CDR_RBL_STGDB";
  GRANT REFERENCES ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "CC_CDR_RBL_STGDB";
  GRANT REFERENCES ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "MAIN_PRO";
  GRANT REFERENCES ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "RBL_BI_RBL_STGDB";
  GRANT REFERENCES ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "ALERT_RBL_MISDB_PROD";
  GRANT REFERENCES ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "ACL_RBL_MISDB_PROD";
  GRANT REFERENCES ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT REFERENCES ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "QPI_RBL_MISDB_PROD";
  GRANT REFERENCES ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "CURDAT_RBL_MISDB_PROD";
  GRANT REFERENCES ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "PREMOC_RBL_MISDB_PROD";
  GRANT REFERENCES ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "RBL_MISDB_PROD";
  GRANT REFERENCES ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "BSG_READ_RBL_STGDB";
  GRANT REFERENCES ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "STD_FIN_RBL_STGDB";
  GRANT REFERENCES ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "BS_RBL_MISDB_PROD";
  GRANT REFERENCES ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "RBL_STGDB";
  GRANT REFERENCES ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "DWH_RBL_MISDB_PROD";
  GRANT REFERENCES ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT REFERENCES ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT REFERENCES ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "STG_FIN_RBL_STGDB";
  GRANT REFERENCES ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT REFERENCES ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "ADF_CDR_RBL_STGDB";
  GRANT READ ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "ROLE_ALL_DB";
  GRANT READ ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "CC_CDR_RBL_STGDB";
  GRANT READ ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "MAIN_PRO";
  GRANT READ ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "RBL_BI_RBL_STGDB";
  GRANT READ ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "ALERT_RBL_MISDB_PROD";
  GRANT READ ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "ACL_RBL_MISDB_PROD";
  GRANT READ ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT READ ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "QPI_RBL_MISDB_PROD";
  GRANT READ ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "CURDAT_RBL_MISDB_PROD";
  GRANT READ ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "PREMOC_RBL_MISDB_PROD";
  GRANT READ ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "RBL_MISDB_PROD";
  GRANT READ ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "BSG_READ_RBL_STGDB";
  GRANT READ ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "STD_FIN_RBL_STGDB";
  GRANT READ ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "BS_RBL_MISDB_PROD";
  GRANT READ ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "RBL_STGDB";
  GRANT READ ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "DWH_RBL_MISDB_PROD";
  GRANT READ ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT READ ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT READ ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "STG_FIN_RBL_STGDB";
  GRANT READ ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT READ ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "ADF_CDR_RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "ROLE_ALL_DB";
  GRANT ON COMMIT REFRESH ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "CC_CDR_RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "MAIN_PRO";
  GRANT ON COMMIT REFRESH ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "RBL_BI_RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "ALERT_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "ACL_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "QPI_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "CURDAT_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "PREMOC_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "BSG_READ_RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "STD_FIN_RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "BS_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "DWH_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT ON COMMIT REFRESH ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "STG_FIN_RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "ADF_CDR_RBL_STGDB";
  GRANT QUERY REWRITE ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "ROLE_ALL_DB";
  GRANT QUERY REWRITE ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "CC_CDR_RBL_STGDB";
  GRANT QUERY REWRITE ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "MAIN_PRO";
  GRANT QUERY REWRITE ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "RBL_BI_RBL_STGDB";
  GRANT QUERY REWRITE ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "ALERT_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "ACL_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "QPI_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "CURDAT_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "PREMOC_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "BSG_READ_RBL_STGDB";
  GRANT QUERY REWRITE ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "STD_FIN_RBL_STGDB";
  GRANT QUERY REWRITE ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "BS_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "RBL_STGDB";
  GRANT QUERY REWRITE ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "DWH_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT QUERY REWRITE ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "STG_FIN_RBL_STGDB";
  GRANT QUERY REWRITE ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "ADF_CDR_RBL_STGDB";
  GRANT DEBUG ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "ROLE_ALL_DB";
  GRANT DEBUG ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "CC_CDR_RBL_STGDB";
  GRANT DEBUG ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "MAIN_PRO";
  GRANT DEBUG ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "RBL_BI_RBL_STGDB";
  GRANT DEBUG ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "ALERT_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "ACL_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "QPI_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "CURDAT_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "PREMOC_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "BSG_READ_RBL_STGDB";
  GRANT DEBUG ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "STD_FIN_RBL_STGDB";
  GRANT DEBUG ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "BS_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "RBL_STGDB";
  GRANT DEBUG ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "DWH_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT DEBUG ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "STG_FIN_RBL_STGDB";
  GRANT DEBUG ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "ADF_CDR_RBL_STGDB";
  GRANT FLASHBACK ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "ROLE_ALL_DB";
  GRANT FLASHBACK ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "CC_CDR_RBL_STGDB";
  GRANT FLASHBACK ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "MAIN_PRO";
  GRANT FLASHBACK ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "RBL_BI_RBL_STGDB";
  GRANT FLASHBACK ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "ALERT_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "ACL_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "QPI_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "CURDAT_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "PREMOC_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "RBL_MISDB_PROD";
  GRANT FLASHBACK ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "BSG_READ_RBL_STGDB";
  GRANT FLASHBACK ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "STD_FIN_RBL_STGDB";
  GRANT FLASHBACK ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "BS_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "RBL_STGDB";
  GRANT FLASHBACK ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "DWH_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT FLASHBACK ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "STG_FIN_RBL_STGDB";
  GRANT FLASHBACK ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "RBL_TEMPDB"."TEMPADVACBALANCEDETAIL" TO "ADF_CDR_RBL_STGDB";
