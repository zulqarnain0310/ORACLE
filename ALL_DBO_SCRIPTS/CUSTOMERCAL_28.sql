--------------------------------------------------------
--  DDL for Table CUSTOMERCAL_28
--------------------------------------------------------

  CREATE TABLE "RBL_MISDB_PROD"."CUSTOMERCAL_28" 
   (	"ENTITYKEY" VARCHAR2(50 CHAR), 
	"BRANCHCODE" VARCHAR2(50 CHAR), 
	"UCIF_ID" VARCHAR2(50 CHAR), 
	"UCIFENTITYID" VARCHAR2(50 CHAR), 
	"CUSTOMERENTITYID" VARCHAR2(50 CHAR), 
	"PARENTCUSTOMERID" VARCHAR2(50 CHAR), 
	"REFCUSTOMERID" VARCHAR2(50 CHAR), 
	"SOURCESYSTEMCUSTOMERID" VARCHAR2(50 CHAR), 
	"CUSTOMERNAME" VARCHAR2(500 CHAR), 
	"CUSTSEGMENTCODE" VARCHAR2(50 CHAR), 
	"CONSTITUTIONALT_KEY" VARCHAR2(50 CHAR), 
	"PANNO" VARCHAR2(50 CHAR), 
	"AADHARCARDNO" VARCHAR2(50 CHAR), 
	"SRCASSETCLASSALT_KEY" VARCHAR2(50 CHAR), 
	"SYSASSETCLASSALT_KEY" VARCHAR2(50 CHAR), 
	"SPLCATG1ALT_KEY" VARCHAR2(50 CHAR), 
	"SPLCATG2ALT_KEY" VARCHAR2(50 CHAR), 
	"SPLCATG3ALT_KEY" VARCHAR2(50 CHAR), 
	"SPLCATG4ALT_KEY" VARCHAR2(50 CHAR), 
	"SMA_CLASS_KEY" VARCHAR2(50 CHAR), 
	"PNPA_CLASS_KEY" VARCHAR2(50 CHAR), 
	"PRVQTRRV" VARCHAR2(50 CHAR), 
	"CURNTQTRRV" VARCHAR2(50 CHAR), 
	"TOTPROVISION" VARCHAR2(50 CHAR), 
	"RBITOTPROVISION" VARCHAR2(50 CHAR), 
	"BANKTOTPROVISION" VARCHAR2(50 CHAR), 
	"SRCNPA_DT" VARCHAR2(50 CHAR), 
	"SYSNPA_DT" VARCHAR2(50 CHAR), 
	"DBTDT" VARCHAR2(50 CHAR), 
	"DBTDT2" VARCHAR2(50 CHAR), 
	"DBTDT3" VARCHAR2(50 CHAR), 
	"LOSSDT" VARCHAR2(50 CHAR), 
	"MOC_DT" VARCHAR2(50 CHAR), 
	"EROSIONDT" VARCHAR2(50 CHAR), 
	"SMA_DT" VARCHAR2(50 CHAR), 
	"PNPA_DT" VARCHAR2(50 CHAR), 
	"ASSET_NORM" VARCHAR2(500 CHAR), 
	"FLGDEG" VARCHAR2(50 CHAR), 
	"FLGUPG" VARCHAR2(50 CHAR), 
	"FLGMOC" VARCHAR2(50 CHAR), 
	"FLGSMA" VARCHAR2(50 CHAR), 
	"FLGPROCESSING" VARCHAR2(50 CHAR), 
	"FLGEROSION" VARCHAR2(50 CHAR), 
	"FLGPNPA" VARCHAR2(50 CHAR), 
	"FLGPERCOLATION" VARCHAR2(50 CHAR), 
	"FLGINMONTH" VARCHAR2(50 CHAR), 
	"FLGDIRTYROW" VARCHAR2(50 CHAR), 
	"DEGDATE" VARCHAR2(50 CHAR), 
	"EFFECTIVEFROMTIMEKEY" VARCHAR2(50 CHAR), 
	"EFFECTIVETOTIMEKEY" VARCHAR2(50 CHAR), 
	"COMMONMOCTYPEALT_KEY" VARCHAR2(50 CHAR), 
	"INMONTHMARK" VARCHAR2(50 CHAR), 
	"MOCSTATUSMARK" VARCHAR2(50 CHAR), 
	"SOURCEALT_KEY" VARCHAR2(50 CHAR), 
	"BANKASSETCLASS" VARCHAR2(50 CHAR), 
	"CUST_EXPO" VARCHAR2(50 CHAR), 
	"MOCREASON" VARCHAR2(500 CHAR), 
	"ADDLPROVISIONPER" VARCHAR2(50 CHAR), 
	"FRAUDDT" VARCHAR2(50 CHAR), 
	"FRAUDAMOUNT" VARCHAR2(50 CHAR), 
	"DEGREASON" VARCHAR2(500 CHAR), 
	"CUSTMOVEDESCRIPTION" VARCHAR2(500 CHAR), 
	"TOTOSCUST" VARCHAR2(50 CHAR), 
	"MOCTYPE" VARCHAR2(50 CHAR), 
	"ISCHANGED" VARCHAR2(50 CHAR), 
	"ENTITYKEYNEW" VARCHAR2(50 CHAR)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;

   COMMENT ON TABLE "RBL_MISDB_PROD"."CUSTOMERCAL_28"  IS 'ORIGINAL NAME:customercal 28';
  GRANT ALTER ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT ALTER ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "PREMOC_RBL_MISDB_PROD";
  GRANT ALTER ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "QPI_RBL_MISDB_PROD";
  GRANT ALTER ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "ALERT_RBL_MISDB_PROD";
  GRANT ALTER ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "DWH_RBL_MISDB_PROD";
  GRANT ALTER ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "MAIN_PRO";
  GRANT ALTER ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT ALTER ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "CURDAT_RBL_MISDB_PROD";
  GRANT ALTER ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "BS_RBL_MISDB_PROD";
  GRANT ALTER ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "ACL_RBL_MISDB_PROD";
  GRANT ALTER ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT ALTER ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT DELETE ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT DELETE ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "PREMOC_RBL_MISDB_PROD";
  GRANT DELETE ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "QPI_RBL_MISDB_PROD";
  GRANT DELETE ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "ALERT_RBL_MISDB_PROD";
  GRANT DELETE ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "DWH_RBL_MISDB_PROD";
  GRANT DELETE ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "MAIN_PRO";
  GRANT DELETE ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT DELETE ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "CURDAT_RBL_MISDB_PROD";
  GRANT DELETE ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "BS_RBL_MISDB_PROD";
  GRANT DELETE ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "ACL_RBL_MISDB_PROD";
  GRANT DELETE ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT DELETE ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT INDEX ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "PREMOC_RBL_MISDB_PROD";
  GRANT INDEX ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "QPI_RBL_MISDB_PROD";
  GRANT INDEX ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "ALERT_RBL_MISDB_PROD";
  GRANT INDEX ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "DWH_RBL_MISDB_PROD";
  GRANT INDEX ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "MAIN_PRO";
  GRANT INDEX ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT INDEX ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "CURDAT_RBL_MISDB_PROD";
  GRANT INDEX ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "BS_RBL_MISDB_PROD";
  GRANT INDEX ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "ACL_RBL_MISDB_PROD";
  GRANT INDEX ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT INDEX ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT INSERT ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT INSERT ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "PREMOC_RBL_MISDB_PROD";
  GRANT INSERT ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "QPI_RBL_MISDB_PROD";
  GRANT INSERT ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "ALERT_RBL_MISDB_PROD";
  GRANT INSERT ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "DWH_RBL_MISDB_PROD";
  GRANT INSERT ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "MAIN_PRO";
  GRANT INSERT ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT INSERT ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "CURDAT_RBL_MISDB_PROD";
  GRANT INSERT ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "BS_RBL_MISDB_PROD";
  GRANT INSERT ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "ACL_RBL_MISDB_PROD";
  GRANT INSERT ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT INSERT ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT SELECT ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT SELECT ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "PREMOC_RBL_MISDB_PROD";
  GRANT SELECT ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "QPI_RBL_MISDB_PROD";
  GRANT SELECT ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "ALERT_RBL_MISDB_PROD";
  GRANT SELECT ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "DWH_RBL_MISDB_PROD";
  GRANT SELECT ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "MAIN_PRO";
  GRANT SELECT ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT SELECT ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "CURDAT_RBL_MISDB_PROD";
  GRANT SELECT ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "BS_RBL_MISDB_PROD";
  GRANT SELECT ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "ACL_RBL_MISDB_PROD";
  GRANT SELECT ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT SELECT ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT UPDATE ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT UPDATE ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "PREMOC_RBL_MISDB_PROD";
  GRANT UPDATE ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "QPI_RBL_MISDB_PROD";
  GRANT UPDATE ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "ALERT_RBL_MISDB_PROD";
  GRANT UPDATE ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "DWH_RBL_MISDB_PROD";
  GRANT UPDATE ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "MAIN_PRO";
  GRANT UPDATE ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT UPDATE ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "CURDAT_RBL_MISDB_PROD";
  GRANT UPDATE ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "BS_RBL_MISDB_PROD";
  GRANT UPDATE ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "ACL_RBL_MISDB_PROD";
  GRANT UPDATE ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT UPDATE ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "PREMOC_RBL_MISDB_PROD";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "QPI_RBL_MISDB_PROD";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "ALERT_RBL_MISDB_PROD";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "DWH_RBL_MISDB_PROD";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "MAIN_PRO";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "CURDAT_RBL_MISDB_PROD";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "BS_RBL_MISDB_PROD";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "ACL_RBL_MISDB_PROD";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT READ ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT READ ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "PREMOC_RBL_MISDB_PROD";
  GRANT READ ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "QPI_RBL_MISDB_PROD";
  GRANT READ ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "ALERT_RBL_MISDB_PROD";
  GRANT READ ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "DWH_RBL_MISDB_PROD";
  GRANT READ ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "MAIN_PRO";
  GRANT READ ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT READ ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "CURDAT_RBL_MISDB_PROD";
  GRANT READ ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "BS_RBL_MISDB_PROD";
  GRANT READ ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "ACL_RBL_MISDB_PROD";
  GRANT READ ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT READ ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "PREMOC_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "QPI_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "ALERT_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "DWH_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "MAIN_PRO";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "CURDAT_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "BS_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "ACL_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "PREMOC_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "QPI_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "ALERT_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "DWH_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "MAIN_PRO";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "CURDAT_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "BS_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "ACL_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT DEBUG ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "PREMOC_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "QPI_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "ALERT_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "DWH_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "MAIN_PRO";
  GRANT DEBUG ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "CURDAT_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "BS_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "ACL_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "PREMOC_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "QPI_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "ALERT_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "DWH_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "MAIN_PRO";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "CURDAT_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "BS_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "ACL_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT ALTER ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "ROLE_ALL_DB";
  GRANT ALTER ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "CC_CDR_RBL_STGDB";
  GRANT ALTER ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "RBL_BI_RBL_STGDB";
  GRANT ALTER ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "BSG_READ_RBL_STGDB";
  GRANT ALTER ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "STD_FIN_RBL_STGDB";
  GRANT ALTER ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "RBL_STGDB";
  GRANT ALTER ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT ALTER ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "RBL_TEMPDB";
  GRANT ALTER ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "STG_FIN_RBL_STGDB";
  GRANT ALTER ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "ADF_CDR_RBL_STGDB";
  GRANT DELETE ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "ROLE_ALL_DB";
  GRANT DELETE ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "CC_CDR_RBL_STGDB";
  GRANT DELETE ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "RBL_BI_RBL_STGDB";
  GRANT DELETE ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "BSG_READ_RBL_STGDB";
  GRANT DELETE ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "STD_FIN_RBL_STGDB";
  GRANT DELETE ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "RBL_STGDB";
  GRANT DELETE ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT DELETE ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "RBL_TEMPDB";
  GRANT DELETE ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "STG_FIN_RBL_STGDB";
  GRANT DELETE ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "ADF_CDR_RBL_STGDB";
  GRANT INDEX ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "CC_CDR_RBL_STGDB";
  GRANT INDEX ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "RBL_BI_RBL_STGDB";
  GRANT INDEX ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "BSG_READ_RBL_STGDB";
  GRANT INDEX ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "STD_FIN_RBL_STGDB";
  GRANT INDEX ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "RBL_STGDB";
  GRANT INDEX ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT INDEX ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "RBL_TEMPDB";
  GRANT INDEX ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "STG_FIN_RBL_STGDB";
  GRANT INDEX ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "ADF_CDR_RBL_STGDB";
  GRANT INSERT ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "ROLE_ALL_DB";
  GRANT INSERT ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "CC_CDR_RBL_STGDB";
  GRANT INSERT ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "RBL_BI_RBL_STGDB";
  GRANT INSERT ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "BSG_READ_RBL_STGDB";
  GRANT INSERT ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "STD_FIN_RBL_STGDB";
  GRANT INSERT ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "RBL_STGDB";
  GRANT INSERT ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT INSERT ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "RBL_TEMPDB";
  GRANT INSERT ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "STG_FIN_RBL_STGDB";
  GRANT INSERT ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "ADF_CDR_RBL_STGDB";
  GRANT SELECT ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "ROLE_ALL_DB";
  GRANT SELECT ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "CC_CDR_RBL_STGDB";
  GRANT SELECT ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "RBL_BI_RBL_STGDB";
  GRANT SELECT ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "BSG_READ_RBL_STGDB";
  GRANT SELECT ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "STD_FIN_RBL_STGDB";
  GRANT SELECT ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "RBL_STGDB";
  GRANT SELECT ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT SELECT ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "RBL_TEMPDB";
  GRANT SELECT ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "STG_FIN_RBL_STGDB";
  GRANT SELECT ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "ADF_CDR_RBL_STGDB";
  GRANT UPDATE ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "ROLE_ALL_DB";
  GRANT UPDATE ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "CC_CDR_RBL_STGDB";
  GRANT UPDATE ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "RBL_BI_RBL_STGDB";
  GRANT UPDATE ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "BSG_READ_RBL_STGDB";
  GRANT UPDATE ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "STD_FIN_RBL_STGDB";
  GRANT UPDATE ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "RBL_STGDB";
  GRANT UPDATE ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT UPDATE ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "RBL_TEMPDB";
  GRANT UPDATE ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "STG_FIN_RBL_STGDB";
  GRANT UPDATE ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "ADF_CDR_RBL_STGDB";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "CC_CDR_RBL_STGDB";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "RBL_BI_RBL_STGDB";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "BSG_READ_RBL_STGDB";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "STD_FIN_RBL_STGDB";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "RBL_STGDB";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "RBL_TEMPDB";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "STG_FIN_RBL_STGDB";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "ADF_CDR_RBL_STGDB";
  GRANT READ ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "ROLE_ALL_DB";
  GRANT READ ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "CC_CDR_RBL_STGDB";
  GRANT READ ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "RBL_BI_RBL_STGDB";
  GRANT READ ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "BSG_READ_RBL_STGDB";
  GRANT READ ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "STD_FIN_RBL_STGDB";
  GRANT READ ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "RBL_STGDB";
  GRANT READ ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT READ ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "RBL_TEMPDB";
  GRANT READ ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "STG_FIN_RBL_STGDB";
  GRANT READ ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "ADF_CDR_RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "ROLE_ALL_DB";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "CC_CDR_RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "RBL_BI_RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "BSG_READ_RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "STD_FIN_RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "RBL_TEMPDB";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "STG_FIN_RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "ADF_CDR_RBL_STGDB";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "ROLE_ALL_DB";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "CC_CDR_RBL_STGDB";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "RBL_BI_RBL_STGDB";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "BSG_READ_RBL_STGDB";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "STD_FIN_RBL_STGDB";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "RBL_STGDB";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "RBL_TEMPDB";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "STG_FIN_RBL_STGDB";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "ADF_CDR_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "ROLE_ALL_DB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "CC_CDR_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "RBL_BI_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "BSG_READ_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "STD_FIN_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "RBL_TEMPDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "STG_FIN_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "ADF_CDR_RBL_STGDB";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "ROLE_ALL_DB";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "CC_CDR_RBL_STGDB";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "RBL_BI_RBL_STGDB";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "BSG_READ_RBL_STGDB";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "STD_FIN_RBL_STGDB";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "RBL_STGDB";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "RBL_TEMPDB";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "STG_FIN_RBL_STGDB";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."CUSTOMERCAL_28" TO "ADF_CDR_RBL_STGDB";
