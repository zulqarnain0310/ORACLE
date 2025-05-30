--------------------------------------------------------
--  DDL for Table CUSTOMERCAL_HIST_BACKUP_12082024
--------------------------------------------------------

  CREATE TABLE "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" 
   (	"ENTITYKEY" NUMBER(19,0), 
	"BRANCHCODE" VARCHAR2(20 CHAR), 
	"UCIF_ID" VARCHAR2(50 CHAR), 
	"UCIFENTITYID" NUMBER(10,0), 
	"CUSTOMERENTITYID" NUMBER(10,0), 
	"PARENTCUSTOMERID" VARCHAR2(50 CHAR), 
	"REFCUSTOMERID" VARCHAR2(50 CHAR), 
	"SOURCESYSTEMCUSTOMERID" VARCHAR2(50 CHAR), 
	"CUSTOMERNAME" VARCHAR2(225 CHAR), 
	"CUSTSEGMENTCODE" VARCHAR2(10 CHAR), 
	"CONSTITUTIONALT_KEY" NUMBER(10,0), 
	"PANNO" VARCHAR2(12 CHAR), 
	"AADHARCARDNO" VARCHAR2(14 CHAR), 
	"SRCASSETCLASSALT_KEY" NUMBER(5,0), 
	"SYSASSETCLASSALT_KEY" NUMBER(5,0), 
	"SPLCATG1ALT_KEY" NUMBER(10,0), 
	"SPLCATG2ALT_KEY" NUMBER(10,0), 
	"SPLCATG3ALT_KEY" NUMBER(10,0), 
	"SPLCATG4ALT_KEY" NUMBER(10,0), 
	"SMA_CLASS_KEY" NUMBER(10,0), 
	"PNPA_CLASS_KEY" NUMBER(10,0), 
	"PRVQTRRV" NUMBER(18,2), 
	"CURNTQTRRV" NUMBER(18,2), 
	"TOTPROVISION" NUMBER(16,2), 
	"BANKTOTPROVISION" NUMBER(16,2), 
	"RBITOTPROVISION" NUMBER(18,2), 
	"SRCNPA_DT" VARCHAR2(200 CHAR), 
	"SYSNPA_DT" VARCHAR2(200 CHAR), 
	"DBTDT" VARCHAR2(200 CHAR), 
	"DBTDT2" VARCHAR2(200 CHAR), 
	"DBTDT3" VARCHAR2(200 CHAR), 
	"LOSSDT" VARCHAR2(200 CHAR), 
	"MOC_DT" VARCHAR2(200 CHAR), 
	"EROSIONDT" VARCHAR2(200 CHAR), 
	"SMA_DT" VARCHAR2(200 CHAR), 
	"PNPA_DT" VARCHAR2(200 CHAR), 
	"ASSET_NORM" VARCHAR2(15 CHAR), 
	"FLGDEG" CHAR(1 CHAR), 
	"FLGUPG" CHAR(1 CHAR), 
	"FLGMOC" CHAR(1 CHAR), 
	"FLGSMA" CHAR(1 CHAR), 
	"FLGPROCESSING" CHAR(1 CHAR), 
	"FLGEROSION" CHAR(1 CHAR), 
	"FLGPNPA" CHAR(1 CHAR), 
	"FLGPERCOLATION" CHAR(1 CHAR), 
	"FLGINMONTH" CHAR(1 CHAR), 
	"FLGDIRTYROW" CHAR(1 CHAR), 
	"DEGDATE" VARCHAR2(200 CHAR), 
	"EFFECTIVEFROMTIMEKEY" NUMBER(10,0), 
	"EFFECTIVETOTIMEKEY" NUMBER(10,0), 
	"COMMONMOCTYPEALT_KEY" NUMBER(5,0), 
	"INMONTHMARK" CHAR(1 CHAR), 
	"MOCSTATUSMARK" CHAR(1 CHAR), 
	"SOURCEALT_KEY" NUMBER(10,0), 
	"BANKASSETCLASS" VARCHAR2(10 CHAR), 
	"CUST_EXPO" NUMBER(18,2), 
	"MOCREASON" VARCHAR2(500 CHAR), 
	"ADDLPROVISIONPER" NUMBER(6,2), 
	"FRAUDDT" VARCHAR2(200 CHAR), 
	"FRAUDAMOUNT" NUMBER(18,2), 
	"DEGREASON" VARCHAR2(1000 CHAR), 
	"CUSTMOVEDESCRIPTION" VARCHAR2(10 CHAR), 
	"TOTOSCUST" NUMBER(18,2), 
	"MOCTYPE" VARCHAR2(15 CHAR), 
	"SCREENFLAG" CHAR(1 CHAR), 
	"CHANGEFLD" CLOB
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" 
 LOB ("CHANGEFLD") STORE AS SECUREFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192
  NOCACHE LOGGING  NOCOMPRESS  KEEP_DUPLICATES ) ;
  GRANT ALTER ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT ALTER ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "PREMOC_RBL_MISDB_PROD";
  GRANT ALTER ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "QPI_RBL_MISDB_PROD";
  GRANT ALTER ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "ALERT_RBL_MISDB_PROD";
  GRANT ALTER ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "DWH_RBL_MISDB_PROD";
  GRANT ALTER ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT ALTER ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "CURDAT_RBL_MISDB_PROD";
  GRANT ALTER ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "BS_RBL_MISDB_PROD";
  GRANT ALTER ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "ACL_RBL_MISDB_PROD";
  GRANT ALTER ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT ALTER ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "RBL_MISDB_PROD";
  GRANT ALTER ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT DELETE ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT DELETE ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "PREMOC_RBL_MISDB_PROD";
  GRANT DELETE ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "QPI_RBL_MISDB_PROD";
  GRANT DELETE ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "ALERT_RBL_MISDB_PROD";
  GRANT DELETE ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "DWH_RBL_MISDB_PROD";
  GRANT DELETE ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT DELETE ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "CURDAT_RBL_MISDB_PROD";
  GRANT DELETE ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "BS_RBL_MISDB_PROD";
  GRANT DELETE ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "ACL_RBL_MISDB_PROD";
  GRANT DELETE ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT DELETE ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "RBL_MISDB_PROD";
  GRANT DELETE ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT INDEX ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "PREMOC_RBL_MISDB_PROD";
  GRANT INDEX ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "QPI_RBL_MISDB_PROD";
  GRANT INDEX ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "ALERT_RBL_MISDB_PROD";
  GRANT INDEX ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "DWH_RBL_MISDB_PROD";
  GRANT INDEX ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT INDEX ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "CURDAT_RBL_MISDB_PROD";
  GRANT INDEX ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "BS_RBL_MISDB_PROD";
  GRANT INDEX ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "ACL_RBL_MISDB_PROD";
  GRANT INDEX ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT INDEX ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "RBL_MISDB_PROD";
  GRANT INDEX ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT INSERT ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT INSERT ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "PREMOC_RBL_MISDB_PROD";
  GRANT INSERT ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "QPI_RBL_MISDB_PROD";
  GRANT INSERT ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "ALERT_RBL_MISDB_PROD";
  GRANT INSERT ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "DWH_RBL_MISDB_PROD";
  GRANT INSERT ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT INSERT ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "CURDAT_RBL_MISDB_PROD";
  GRANT INSERT ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "BS_RBL_MISDB_PROD";
  GRANT INSERT ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "ACL_RBL_MISDB_PROD";
  GRANT INSERT ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT INSERT ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "RBL_MISDB_PROD";
  GRANT INSERT ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT SELECT ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT SELECT ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "PREMOC_RBL_MISDB_PROD";
  GRANT SELECT ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "QPI_RBL_MISDB_PROD";
  GRANT SELECT ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "ALERT_RBL_MISDB_PROD";
  GRANT SELECT ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "DWH_RBL_MISDB_PROD";
  GRANT SELECT ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT SELECT ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "CURDAT_RBL_MISDB_PROD";
  GRANT SELECT ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "BS_RBL_MISDB_PROD";
  GRANT SELECT ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "ACL_RBL_MISDB_PROD";
  GRANT SELECT ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT SELECT ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "RBL_MISDB_PROD";
  GRANT SELECT ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT UPDATE ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT UPDATE ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "PREMOC_RBL_MISDB_PROD";
  GRANT UPDATE ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "QPI_RBL_MISDB_PROD";
  GRANT UPDATE ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "ALERT_RBL_MISDB_PROD";
  GRANT UPDATE ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "DWH_RBL_MISDB_PROD";
  GRANT UPDATE ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT UPDATE ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "CURDAT_RBL_MISDB_PROD";
  GRANT UPDATE ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "BS_RBL_MISDB_PROD";
  GRANT UPDATE ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "ACL_RBL_MISDB_PROD";
  GRANT UPDATE ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT UPDATE ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "RBL_MISDB_PROD";
  GRANT UPDATE ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT REFERENCES ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "PREMOC_RBL_MISDB_PROD";
  GRANT REFERENCES ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "QPI_RBL_MISDB_PROD";
  GRANT REFERENCES ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "ALERT_RBL_MISDB_PROD";
  GRANT REFERENCES ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "DWH_RBL_MISDB_PROD";
  GRANT REFERENCES ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT REFERENCES ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "CURDAT_RBL_MISDB_PROD";
  GRANT REFERENCES ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "BS_RBL_MISDB_PROD";
  GRANT REFERENCES ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "ACL_RBL_MISDB_PROD";
  GRANT REFERENCES ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT REFERENCES ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "RBL_MISDB_PROD";
  GRANT REFERENCES ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT READ ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT READ ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "PREMOC_RBL_MISDB_PROD";
  GRANT READ ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "QPI_RBL_MISDB_PROD";
  GRANT READ ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "ALERT_RBL_MISDB_PROD";
  GRANT READ ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "DWH_RBL_MISDB_PROD";
  GRANT READ ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT READ ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "CURDAT_RBL_MISDB_PROD";
  GRANT READ ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "BS_RBL_MISDB_PROD";
  GRANT READ ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "ACL_RBL_MISDB_PROD";
  GRANT READ ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT READ ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "RBL_MISDB_PROD";
  GRANT READ ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT ON COMMIT REFRESH ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "PREMOC_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "QPI_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "ALERT_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "DWH_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "CURDAT_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "BS_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "ACL_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT QUERY REWRITE ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "PREMOC_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "QPI_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "ALERT_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "DWH_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "CURDAT_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "BS_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "ACL_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT DEBUG ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "PREMOC_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "QPI_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "ALERT_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "DWH_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "CURDAT_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "BS_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "ACL_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT FLASHBACK ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "PREMOC_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "QPI_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "ALERT_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "DWH_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "CURDAT_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "BS_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "ACL_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "RBL_MISDB_PROD";
  GRANT FLASHBACK ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT ALTER ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "ROLE_ALL_DB";
  GRANT ALTER ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "CC_CDR_RBL_STGDB";
  GRANT ALTER ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "RBL_BI_RBL_STGDB";
  GRANT ALTER ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "BSG_READ_RBL_STGDB";
  GRANT ALTER ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "STD_FIN_RBL_STGDB";
  GRANT ALTER ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "RBL_STGDB";
  GRANT ALTER ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT ALTER ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "RBL_TEMPDB";
  GRANT ALTER ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "STG_FIN_RBL_STGDB";
  GRANT ALTER ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "ADF_CDR_RBL_STGDB";
  GRANT DELETE ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "ROLE_ALL_DB";
  GRANT DELETE ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "CC_CDR_RBL_STGDB";
  GRANT DELETE ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "RBL_BI_RBL_STGDB";
  GRANT DELETE ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "BSG_READ_RBL_STGDB";
  GRANT DELETE ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "STD_FIN_RBL_STGDB";
  GRANT DELETE ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "RBL_STGDB";
  GRANT DELETE ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT DELETE ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "RBL_TEMPDB";
  GRANT DELETE ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "STG_FIN_RBL_STGDB";
  GRANT DELETE ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "ADF_CDR_RBL_STGDB";
  GRANT INDEX ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "CC_CDR_RBL_STGDB";
  GRANT INDEX ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "RBL_BI_RBL_STGDB";
  GRANT INDEX ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "BSG_READ_RBL_STGDB";
  GRANT INDEX ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "STD_FIN_RBL_STGDB";
  GRANT INDEX ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "RBL_STGDB";
  GRANT INDEX ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT INDEX ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "RBL_TEMPDB";
  GRANT INDEX ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "STG_FIN_RBL_STGDB";
  GRANT INDEX ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "ADF_CDR_RBL_STGDB";
  GRANT INSERT ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "ROLE_ALL_DB";
  GRANT INSERT ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "CC_CDR_RBL_STGDB";
  GRANT INSERT ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "RBL_BI_RBL_STGDB";
  GRANT INSERT ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "BSG_READ_RBL_STGDB";
  GRANT INSERT ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "STD_FIN_RBL_STGDB";
  GRANT INSERT ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "RBL_STGDB";
  GRANT INSERT ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT INSERT ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "RBL_TEMPDB";
  GRANT INSERT ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "STG_FIN_RBL_STGDB";
  GRANT INSERT ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "ADF_CDR_RBL_STGDB";
  GRANT SELECT ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "ROLE_ALL_DB";
  GRANT SELECT ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "CC_CDR_RBL_STGDB";
  GRANT SELECT ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "RBL_BI_RBL_STGDB";
  GRANT SELECT ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "BSG_READ_RBL_STGDB";
  GRANT SELECT ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "STD_FIN_RBL_STGDB";
  GRANT SELECT ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "RBL_STGDB";
  GRANT SELECT ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT SELECT ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "RBL_TEMPDB";
  GRANT SELECT ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "STG_FIN_RBL_STGDB";
  GRANT SELECT ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "ADF_CDR_RBL_STGDB";
  GRANT UPDATE ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "ROLE_ALL_DB";
  GRANT UPDATE ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "CC_CDR_RBL_STGDB";
  GRANT UPDATE ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "RBL_BI_RBL_STGDB";
  GRANT UPDATE ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "BSG_READ_RBL_STGDB";
  GRANT UPDATE ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "STD_FIN_RBL_STGDB";
  GRANT UPDATE ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "RBL_STGDB";
  GRANT UPDATE ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT UPDATE ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "RBL_TEMPDB";
  GRANT UPDATE ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "STG_FIN_RBL_STGDB";
  GRANT UPDATE ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "ADF_CDR_RBL_STGDB";
  GRANT REFERENCES ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "CC_CDR_RBL_STGDB";
  GRANT REFERENCES ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "RBL_BI_RBL_STGDB";
  GRANT REFERENCES ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "BSG_READ_RBL_STGDB";
  GRANT REFERENCES ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "STD_FIN_RBL_STGDB";
  GRANT REFERENCES ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "RBL_STGDB";
  GRANT REFERENCES ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT REFERENCES ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "RBL_TEMPDB";
  GRANT REFERENCES ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "STG_FIN_RBL_STGDB";
  GRANT REFERENCES ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "ADF_CDR_RBL_STGDB";
  GRANT READ ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "ROLE_ALL_DB";
  GRANT READ ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "CC_CDR_RBL_STGDB";
  GRANT READ ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "RBL_BI_RBL_STGDB";
  GRANT READ ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "BSG_READ_RBL_STGDB";
  GRANT READ ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "STD_FIN_RBL_STGDB";
  GRANT READ ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "RBL_STGDB";
  GRANT READ ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT READ ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "RBL_TEMPDB";
  GRANT READ ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "STG_FIN_RBL_STGDB";
  GRANT READ ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "ADF_CDR_RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "ROLE_ALL_DB";
  GRANT ON COMMIT REFRESH ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "CC_CDR_RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "RBL_BI_RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "BSG_READ_RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "STD_FIN_RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT ON COMMIT REFRESH ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "RBL_TEMPDB";
  GRANT ON COMMIT REFRESH ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "STG_FIN_RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "ADF_CDR_RBL_STGDB";
  GRANT QUERY REWRITE ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "ROLE_ALL_DB";
  GRANT QUERY REWRITE ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "CC_CDR_RBL_STGDB";
  GRANT QUERY REWRITE ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "RBL_BI_RBL_STGDB";
  GRANT QUERY REWRITE ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "BSG_READ_RBL_STGDB";
  GRANT QUERY REWRITE ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "STD_FIN_RBL_STGDB";
  GRANT QUERY REWRITE ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "RBL_STGDB";
  GRANT QUERY REWRITE ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT QUERY REWRITE ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "RBL_TEMPDB";
  GRANT QUERY REWRITE ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "STG_FIN_RBL_STGDB";
  GRANT QUERY REWRITE ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "ADF_CDR_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "ROLE_ALL_DB";
  GRANT DEBUG ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "CC_CDR_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "RBL_BI_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "BSG_READ_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "STD_FIN_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT DEBUG ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "RBL_TEMPDB";
  GRANT DEBUG ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "STG_FIN_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "ADF_CDR_RBL_STGDB";
  GRANT FLASHBACK ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "ROLE_ALL_DB";
  GRANT FLASHBACK ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "CC_CDR_RBL_STGDB";
  GRANT FLASHBACK ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "RBL_BI_RBL_STGDB";
  GRANT FLASHBACK ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "BSG_READ_RBL_STGDB";
  GRANT FLASHBACK ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "STD_FIN_RBL_STGDB";
  GRANT FLASHBACK ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "RBL_STGDB";
  GRANT FLASHBACK ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT FLASHBACK ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "RBL_TEMPDB";
  GRANT FLASHBACK ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "STG_FIN_RBL_STGDB";
  GRANT FLASHBACK ON "MAIN_PRO"."CUSTOMERCAL_HIST_BACKUP_12082024" TO "ADF_CDR_RBL_STGDB";
