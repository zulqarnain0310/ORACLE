--------------------------------------------------------
--  DDL for Table TEMPINVESTMENTISSUERDETAIL
--------------------------------------------------------

  CREATE TABLE "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" 
   (	"BRANCHCODE" VARCHAR2(100 CHAR), 
	"ISSUER_KEY" NUMBER(3,0), 
	"ISSUERALTKEY" NUMBER(3,0), 
	"ISSUERID" VARCHAR2(100 CHAR), 
	"ISSUERNAME" VARCHAR2(100 CHAR), 
	"RATINGSTATUS" CHAR(1 CHAR), 
	"ISSUERACCPRATING" VARCHAR2(10 CHAR), 
	"ISSUERACCPRATINGDT" VARCHAR2(200 CHAR), 
	"ISSUERRATINGAGENCY" NUMBER(3,0), 
	"REF_TXN_SYS_CUST_ID" VARCHAR2(256 CHAR), 
	"ISSUER_CATEGORY_CODE" VARCHAR2(64 CHAR), 
	"GRPENTITYOFBANK" CHAR(1 CHAR), 
	"AUTHORISATIONSTATUS" VARCHAR2(2 CHAR), 
	"EFFECTIVEFROMTIMEKEY" NUMBER(10,0), 
	"EFFECTIVETOTIMEKEY" NUMBER(10,0), 
	"CREATEDBY" VARCHAR2(100 CHAR), 
	"DATECREATED" DATE, 
	"MODIFIEDBY" VARCHAR2(100 CHAR), 
	"DATEMODIFIED" DATE, 
	"APPROVEDBY" VARCHAR2(100 CHAR), 
	"DATEAPPROVED" DATE, 
	"ISCHANGED" CHAR(1 CHAR), 
	"ENTITYKEY" NUMBER(10,0) GENERATED BY DEFAULT ON NULL AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE , 
	"ISSUERENTITYID" NUMBER(10,0), 
	"SOURCEALT_KEY" NUMBER(10,0), 
	"UCIFID" VARCHAR2(30 CHAR), 
	"PANNO" VARCHAR2(10 CHAR)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
  GRANT ALTER ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "ROLE_ALL_DB";
  GRANT ALTER ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "CC_CDR_RBL_STGDB";
  GRANT ALTER ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "MAIN_PRO";
  GRANT ALTER ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "RBL_BI_RBL_STGDB";
  GRANT ALTER ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "ALERT_RBL_MISDB_PROD";
  GRANT ALTER ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "ACL_RBL_MISDB_PROD";
  GRANT ALTER ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT ALTER ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "QPI_RBL_MISDB_PROD";
  GRANT ALTER ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "CURDAT_RBL_MISDB_PROD";
  GRANT ALTER ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "PREMOC_RBL_MISDB_PROD";
  GRANT ALTER ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "RBL_MISDB_PROD";
  GRANT ALTER ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "BSG_READ_RBL_STGDB";
  GRANT ALTER ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "STD_FIN_RBL_STGDB";
  GRANT ALTER ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "BS_RBL_MISDB_PROD";
  GRANT ALTER ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "RBL_STGDB";
  GRANT ALTER ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "DWH_RBL_MISDB_PROD";
  GRANT ALTER ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT ALTER ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT ALTER ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "STG_FIN_RBL_STGDB";
  GRANT ALTER ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT ALTER ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "ADF_CDR_RBL_STGDB";
  GRANT DELETE ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "ROLE_ALL_DB";
  GRANT DELETE ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "CC_CDR_RBL_STGDB";
  GRANT DELETE ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "MAIN_PRO";
  GRANT DELETE ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "RBL_BI_RBL_STGDB";
  GRANT DELETE ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "ALERT_RBL_MISDB_PROD";
  GRANT DELETE ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "ACL_RBL_MISDB_PROD";
  GRANT DELETE ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT DELETE ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "QPI_RBL_MISDB_PROD";
  GRANT DELETE ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "CURDAT_RBL_MISDB_PROD";
  GRANT DELETE ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "PREMOC_RBL_MISDB_PROD";
  GRANT DELETE ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "RBL_MISDB_PROD";
  GRANT DELETE ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "BSG_READ_RBL_STGDB";
  GRANT DELETE ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "STD_FIN_RBL_STGDB";
  GRANT DELETE ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "BS_RBL_MISDB_PROD";
  GRANT DELETE ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "RBL_STGDB";
  GRANT DELETE ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "DWH_RBL_MISDB_PROD";
  GRANT DELETE ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT DELETE ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT DELETE ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "STG_FIN_RBL_STGDB";
  GRANT DELETE ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT DELETE ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "ADF_CDR_RBL_STGDB";
  GRANT INDEX ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "CC_CDR_RBL_STGDB";
  GRANT INDEX ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "MAIN_PRO";
  GRANT INDEX ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "RBL_BI_RBL_STGDB";
  GRANT INDEX ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "ALERT_RBL_MISDB_PROD";
  GRANT INDEX ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "ACL_RBL_MISDB_PROD";
  GRANT INDEX ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT INDEX ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "QPI_RBL_MISDB_PROD";
  GRANT INDEX ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "CURDAT_RBL_MISDB_PROD";
  GRANT INDEX ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "PREMOC_RBL_MISDB_PROD";
  GRANT INDEX ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "RBL_MISDB_PROD";
  GRANT INDEX ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "BSG_READ_RBL_STGDB";
  GRANT INDEX ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "STD_FIN_RBL_STGDB";
  GRANT INDEX ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "BS_RBL_MISDB_PROD";
  GRANT INDEX ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "RBL_STGDB";
  GRANT INDEX ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "DWH_RBL_MISDB_PROD";
  GRANT INDEX ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT INDEX ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT INDEX ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "STG_FIN_RBL_STGDB";
  GRANT INDEX ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT INDEX ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "ADF_CDR_RBL_STGDB";
  GRANT INSERT ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "ROLE_ALL_DB";
  GRANT INSERT ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "CC_CDR_RBL_STGDB";
  GRANT INSERT ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "MAIN_PRO";
  GRANT INSERT ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "RBL_BI_RBL_STGDB";
  GRANT INSERT ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "ALERT_RBL_MISDB_PROD";
  GRANT INSERT ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "ACL_RBL_MISDB_PROD";
  GRANT INSERT ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT INSERT ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "QPI_RBL_MISDB_PROD";
  GRANT INSERT ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "CURDAT_RBL_MISDB_PROD";
  GRANT INSERT ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "PREMOC_RBL_MISDB_PROD";
  GRANT INSERT ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "RBL_MISDB_PROD";
  GRANT INSERT ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "BSG_READ_RBL_STGDB";
  GRANT INSERT ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "STD_FIN_RBL_STGDB";
  GRANT INSERT ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "BS_RBL_MISDB_PROD";
  GRANT INSERT ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "RBL_STGDB";
  GRANT INSERT ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "DWH_RBL_MISDB_PROD";
  GRANT INSERT ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT INSERT ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT INSERT ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "STG_FIN_RBL_STGDB";
  GRANT INSERT ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT INSERT ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "ADF_CDR_RBL_STGDB";
  GRANT SELECT ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "ROLE_ALL_DB";
  GRANT SELECT ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "CC_CDR_RBL_STGDB";
  GRANT SELECT ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "MAIN_PRO";
  GRANT SELECT ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "RBL_BI_RBL_STGDB";
  GRANT SELECT ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "ALERT_RBL_MISDB_PROD";
  GRANT SELECT ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "ACL_RBL_MISDB_PROD";
  GRANT SELECT ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT SELECT ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "QPI_RBL_MISDB_PROD";
  GRANT SELECT ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "CURDAT_RBL_MISDB_PROD";
  GRANT SELECT ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "PREMOC_RBL_MISDB_PROD";
  GRANT SELECT ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "RBL_MISDB_PROD";
  GRANT SELECT ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "BSG_READ_RBL_STGDB";
  GRANT SELECT ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "STD_FIN_RBL_STGDB";
  GRANT SELECT ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "BS_RBL_MISDB_PROD";
  GRANT SELECT ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "RBL_STGDB";
  GRANT SELECT ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "DWH_RBL_MISDB_PROD";
  GRANT SELECT ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT SELECT ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT SELECT ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "STG_FIN_RBL_STGDB";
  GRANT SELECT ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT SELECT ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "ADF_CDR_RBL_STGDB";
  GRANT UPDATE ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "ROLE_ALL_DB";
  GRANT UPDATE ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "CC_CDR_RBL_STGDB";
  GRANT UPDATE ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "MAIN_PRO";
  GRANT UPDATE ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "RBL_BI_RBL_STGDB";
  GRANT UPDATE ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "ALERT_RBL_MISDB_PROD";
  GRANT UPDATE ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "ACL_RBL_MISDB_PROD";
  GRANT UPDATE ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT UPDATE ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "QPI_RBL_MISDB_PROD";
  GRANT UPDATE ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "CURDAT_RBL_MISDB_PROD";
  GRANT UPDATE ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "PREMOC_RBL_MISDB_PROD";
  GRANT UPDATE ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "RBL_MISDB_PROD";
  GRANT UPDATE ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "BSG_READ_RBL_STGDB";
  GRANT UPDATE ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "STD_FIN_RBL_STGDB";
  GRANT UPDATE ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "BS_RBL_MISDB_PROD";
  GRANT UPDATE ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "RBL_STGDB";
  GRANT UPDATE ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "DWH_RBL_MISDB_PROD";
  GRANT UPDATE ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT UPDATE ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT UPDATE ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "STG_FIN_RBL_STGDB";
  GRANT UPDATE ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT UPDATE ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "ADF_CDR_RBL_STGDB";
  GRANT REFERENCES ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "CC_CDR_RBL_STGDB";
  GRANT REFERENCES ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "MAIN_PRO";
  GRANT REFERENCES ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "RBL_BI_RBL_STGDB";
  GRANT REFERENCES ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "ALERT_RBL_MISDB_PROD";
  GRANT REFERENCES ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "ACL_RBL_MISDB_PROD";
  GRANT REFERENCES ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT REFERENCES ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "QPI_RBL_MISDB_PROD";
  GRANT REFERENCES ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "CURDAT_RBL_MISDB_PROD";
  GRANT REFERENCES ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "PREMOC_RBL_MISDB_PROD";
  GRANT REFERENCES ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "RBL_MISDB_PROD";
  GRANT REFERENCES ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "BSG_READ_RBL_STGDB";
  GRANT REFERENCES ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "STD_FIN_RBL_STGDB";
  GRANT REFERENCES ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "BS_RBL_MISDB_PROD";
  GRANT REFERENCES ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "RBL_STGDB";
  GRANT REFERENCES ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "DWH_RBL_MISDB_PROD";
  GRANT REFERENCES ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT REFERENCES ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT REFERENCES ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "STG_FIN_RBL_STGDB";
  GRANT REFERENCES ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT REFERENCES ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "ADF_CDR_RBL_STGDB";
  GRANT READ ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "ROLE_ALL_DB";
  GRANT READ ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "CC_CDR_RBL_STGDB";
  GRANT READ ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "MAIN_PRO";
  GRANT READ ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "RBL_BI_RBL_STGDB";
  GRANT READ ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "ALERT_RBL_MISDB_PROD";
  GRANT READ ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "ACL_RBL_MISDB_PROD";
  GRANT READ ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT READ ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "QPI_RBL_MISDB_PROD";
  GRANT READ ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "CURDAT_RBL_MISDB_PROD";
  GRANT READ ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "PREMOC_RBL_MISDB_PROD";
  GRANT READ ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "RBL_MISDB_PROD";
  GRANT READ ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "BSG_READ_RBL_STGDB";
  GRANT READ ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "STD_FIN_RBL_STGDB";
  GRANT READ ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "BS_RBL_MISDB_PROD";
  GRANT READ ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "RBL_STGDB";
  GRANT READ ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "DWH_RBL_MISDB_PROD";
  GRANT READ ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT READ ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT READ ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "STG_FIN_RBL_STGDB";
  GRANT READ ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT READ ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "ADF_CDR_RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "ROLE_ALL_DB";
  GRANT ON COMMIT REFRESH ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "CC_CDR_RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "MAIN_PRO";
  GRANT ON COMMIT REFRESH ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "RBL_BI_RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "ALERT_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "ACL_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "QPI_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "CURDAT_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "PREMOC_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "BSG_READ_RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "STD_FIN_RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "BS_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "DWH_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT ON COMMIT REFRESH ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "STG_FIN_RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "ADF_CDR_RBL_STGDB";
  GRANT QUERY REWRITE ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "ROLE_ALL_DB";
  GRANT QUERY REWRITE ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "CC_CDR_RBL_STGDB";
  GRANT QUERY REWRITE ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "MAIN_PRO";
  GRANT QUERY REWRITE ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "RBL_BI_RBL_STGDB";
  GRANT QUERY REWRITE ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "ALERT_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "ACL_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "QPI_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "CURDAT_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "PREMOC_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "BSG_READ_RBL_STGDB";
  GRANT QUERY REWRITE ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "STD_FIN_RBL_STGDB";
  GRANT QUERY REWRITE ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "BS_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "RBL_STGDB";
  GRANT QUERY REWRITE ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "DWH_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT QUERY REWRITE ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "STG_FIN_RBL_STGDB";
  GRANT QUERY REWRITE ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "ADF_CDR_RBL_STGDB";
  GRANT DEBUG ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "ROLE_ALL_DB";
  GRANT DEBUG ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "CC_CDR_RBL_STGDB";
  GRANT DEBUG ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "MAIN_PRO";
  GRANT DEBUG ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "RBL_BI_RBL_STGDB";
  GRANT DEBUG ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "ALERT_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "ACL_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "QPI_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "CURDAT_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "PREMOC_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "BSG_READ_RBL_STGDB";
  GRANT DEBUG ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "STD_FIN_RBL_STGDB";
  GRANT DEBUG ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "BS_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "RBL_STGDB";
  GRANT DEBUG ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "DWH_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT DEBUG ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "STG_FIN_RBL_STGDB";
  GRANT DEBUG ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "ADF_CDR_RBL_STGDB";
  GRANT FLASHBACK ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "ROLE_ALL_DB";
  GRANT FLASHBACK ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "CC_CDR_RBL_STGDB";
  GRANT FLASHBACK ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "MAIN_PRO";
  GRANT FLASHBACK ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "RBL_BI_RBL_STGDB";
  GRANT FLASHBACK ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "ALERT_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "ACL_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "QPI_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "CURDAT_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "PREMOC_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "RBL_MISDB_PROD";
  GRANT FLASHBACK ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "BSG_READ_RBL_STGDB";
  GRANT FLASHBACK ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "STD_FIN_RBL_STGDB";
  GRANT FLASHBACK ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "BS_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "RBL_STGDB";
  GRANT FLASHBACK ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "DWH_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT FLASHBACK ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "STG_FIN_RBL_STGDB";
  GRANT FLASHBACK ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "RBL_TEMPDB"."TEMPINVESTMENTISSUERDETAIL" TO "ADF_CDR_RBL_STGDB";
