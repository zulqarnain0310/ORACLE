--------------------------------------------------------
--  DDL for Table ACLJOBEXECDETAIL
--------------------------------------------------------

  CREATE TABLE "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" 
   (	"ENTITYKEY" NUMBER(10,0) GENERATED BY DEFAULT ON NULL AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE , 
	"ACLJOBEXECENTITYID" NUMBER(10,0), 
	"RCA_ID" NUMBER(10,0), 
	"JOBNAME" VARCHAR2(100 CHAR), 
	"JOBSTEPNAME" VARCHAR2(100 CHAR), 
	"DATEOFDATA" VARCHAR2(200 CHAR), 
	"ACTIONEXECUTIONDATE" VARCHAR2(200 CHAR), 
	"ACLJOBEXECSTATUS" VARCHAR2(100 CHAR), 
	"REMARKS" VARCHAR2(1000 CHAR), 
	"ACLEXECREJECTREASON" VARCHAR2(1000 CHAR), 
	"ORIGINATORNAME" VARCHAR2(100 CHAR), 
	"ORIGINATOREMPID" VARCHAR2(50 CHAR), 
	"IP_ADDRESS" VARCHAR2(50 CHAR), 
	"AUTHORISATIONSTATUS" CHAR(2 CHAR), 
	"EFFECTIVEFROMTIMEKEY" NUMBER(10,0), 
	"EFFECTIVETOTIMEKEY" NUMBER(10,0), 
	"CREATEDBY" VARCHAR2(20 CHAR), 
	"DATECREATED" DATE, 
	"MODIFIEDBY" VARCHAR2(20 CHAR), 
	"DATEMODIFIED" DATE, 
	"APPROVEDBY" VARCHAR2(20 CHAR), 
	"DATEAPPROVED" DATE, 
	"EXECUTEDBY" VARCHAR2(20 CHAR), 
	"DATEEXECUTED" DATE, 
	"D2KTIMESTAMP" RAW(50)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
  GRANT ALTER ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT ALTER ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "PREMOC_RBL_MISDB_PROD";
  GRANT ALTER ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "QPI_RBL_MISDB_PROD";
  GRANT ALTER ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "ALERT_RBL_MISDB_PROD";
  GRANT ALTER ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "DWH_RBL_MISDB_PROD";
  GRANT ALTER ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "MAIN_PRO";
  GRANT ALTER ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT ALTER ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "CURDAT_RBL_MISDB_PROD";
  GRANT ALTER ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "BS_RBL_MISDB_PROD";
  GRANT ALTER ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "ACL_RBL_MISDB_PROD";
  GRANT ALTER ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT ALTER ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT DELETE ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT DELETE ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "PREMOC_RBL_MISDB_PROD";
  GRANT DELETE ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "QPI_RBL_MISDB_PROD";
  GRANT DELETE ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "ALERT_RBL_MISDB_PROD";
  GRANT DELETE ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "DWH_RBL_MISDB_PROD";
  GRANT DELETE ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "MAIN_PRO";
  GRANT DELETE ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT DELETE ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "CURDAT_RBL_MISDB_PROD";
  GRANT DELETE ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "BS_RBL_MISDB_PROD";
  GRANT DELETE ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "ACL_RBL_MISDB_PROD";
  GRANT DELETE ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT DELETE ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT INDEX ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "PREMOC_RBL_MISDB_PROD";
  GRANT INDEX ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "QPI_RBL_MISDB_PROD";
  GRANT INDEX ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "ALERT_RBL_MISDB_PROD";
  GRANT INDEX ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "DWH_RBL_MISDB_PROD";
  GRANT INDEX ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "MAIN_PRO";
  GRANT INDEX ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT INDEX ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "CURDAT_RBL_MISDB_PROD";
  GRANT INDEX ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "BS_RBL_MISDB_PROD";
  GRANT INDEX ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "ACL_RBL_MISDB_PROD";
  GRANT INDEX ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT INDEX ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT INSERT ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT INSERT ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "PREMOC_RBL_MISDB_PROD";
  GRANT INSERT ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "QPI_RBL_MISDB_PROD";
  GRANT INSERT ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "ALERT_RBL_MISDB_PROD";
  GRANT INSERT ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "DWH_RBL_MISDB_PROD";
  GRANT INSERT ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "MAIN_PRO";
  GRANT INSERT ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT INSERT ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "CURDAT_RBL_MISDB_PROD";
  GRANT INSERT ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "BS_RBL_MISDB_PROD";
  GRANT INSERT ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "ACL_RBL_MISDB_PROD";
  GRANT INSERT ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT INSERT ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT SELECT ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT SELECT ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "PREMOC_RBL_MISDB_PROD";
  GRANT SELECT ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "QPI_RBL_MISDB_PROD";
  GRANT SELECT ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "ALERT_RBL_MISDB_PROD";
  GRANT SELECT ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "DWH_RBL_MISDB_PROD";
  GRANT SELECT ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "MAIN_PRO";
  GRANT SELECT ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT SELECT ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "CURDAT_RBL_MISDB_PROD";
  GRANT SELECT ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "BS_RBL_MISDB_PROD";
  GRANT SELECT ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "ACL_RBL_MISDB_PROD";
  GRANT SELECT ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT SELECT ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT UPDATE ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT UPDATE ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "PREMOC_RBL_MISDB_PROD";
  GRANT UPDATE ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "QPI_RBL_MISDB_PROD";
  GRANT UPDATE ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "ALERT_RBL_MISDB_PROD";
  GRANT UPDATE ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "DWH_RBL_MISDB_PROD";
  GRANT UPDATE ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "MAIN_PRO";
  GRANT UPDATE ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT UPDATE ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "CURDAT_RBL_MISDB_PROD";
  GRANT UPDATE ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "BS_RBL_MISDB_PROD";
  GRANT UPDATE ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "ACL_RBL_MISDB_PROD";
  GRANT UPDATE ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT UPDATE ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "PREMOC_RBL_MISDB_PROD";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "QPI_RBL_MISDB_PROD";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "ALERT_RBL_MISDB_PROD";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "DWH_RBL_MISDB_PROD";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "MAIN_PRO";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "CURDAT_RBL_MISDB_PROD";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "BS_RBL_MISDB_PROD";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "ACL_RBL_MISDB_PROD";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT READ ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT READ ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "PREMOC_RBL_MISDB_PROD";
  GRANT READ ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "QPI_RBL_MISDB_PROD";
  GRANT READ ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "ALERT_RBL_MISDB_PROD";
  GRANT READ ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "DWH_RBL_MISDB_PROD";
  GRANT READ ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "MAIN_PRO";
  GRANT READ ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT READ ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "CURDAT_RBL_MISDB_PROD";
  GRANT READ ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "BS_RBL_MISDB_PROD";
  GRANT READ ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "ACL_RBL_MISDB_PROD";
  GRANT READ ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT READ ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "PREMOC_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "QPI_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "ALERT_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "DWH_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "MAIN_PRO";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "CURDAT_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "BS_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "ACL_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "PREMOC_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "QPI_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "ALERT_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "DWH_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "MAIN_PRO";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "CURDAT_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "BS_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "ACL_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT DEBUG ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "PREMOC_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "QPI_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "ALERT_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "DWH_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "MAIN_PRO";
  GRANT DEBUG ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "CURDAT_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "BS_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "ACL_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "PREMOC_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "QPI_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "ALERT_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "DWH_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "MAIN_PRO";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "CURDAT_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "BS_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "ACL_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT ALTER ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "ROLE_ALL_DB";
  GRANT ALTER ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "CC_CDR_RBL_STGDB";
  GRANT ALTER ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "RBL_BI_RBL_STGDB";
  GRANT ALTER ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "BSG_READ_RBL_STGDB";
  GRANT ALTER ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "STD_FIN_RBL_STGDB";
  GRANT ALTER ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "RBL_STGDB";
  GRANT ALTER ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT ALTER ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "RBL_TEMPDB";
  GRANT ALTER ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "STG_FIN_RBL_STGDB";
  GRANT ALTER ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "ADF_CDR_RBL_STGDB";
  GRANT DELETE ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "ROLE_ALL_DB";
  GRANT DELETE ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "CC_CDR_RBL_STGDB";
  GRANT DELETE ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "RBL_BI_RBL_STGDB";
  GRANT DELETE ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "BSG_READ_RBL_STGDB";
  GRANT DELETE ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "STD_FIN_RBL_STGDB";
  GRANT DELETE ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "RBL_STGDB";
  GRANT DELETE ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT DELETE ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "RBL_TEMPDB";
  GRANT DELETE ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "STG_FIN_RBL_STGDB";
  GRANT DELETE ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "ADF_CDR_RBL_STGDB";
  GRANT INDEX ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "CC_CDR_RBL_STGDB";
  GRANT INDEX ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "RBL_BI_RBL_STGDB";
  GRANT INDEX ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "BSG_READ_RBL_STGDB";
  GRANT INDEX ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "STD_FIN_RBL_STGDB";
  GRANT INDEX ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "RBL_STGDB";
  GRANT INDEX ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT INDEX ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "RBL_TEMPDB";
  GRANT INDEX ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "STG_FIN_RBL_STGDB";
  GRANT INDEX ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "ADF_CDR_RBL_STGDB";
  GRANT INSERT ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "ROLE_ALL_DB";
  GRANT INSERT ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "CC_CDR_RBL_STGDB";
  GRANT INSERT ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "RBL_BI_RBL_STGDB";
  GRANT INSERT ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "BSG_READ_RBL_STGDB";
  GRANT INSERT ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "STD_FIN_RBL_STGDB";
  GRANT INSERT ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "RBL_STGDB";
  GRANT INSERT ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT INSERT ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "RBL_TEMPDB";
  GRANT INSERT ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "STG_FIN_RBL_STGDB";
  GRANT INSERT ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "ADF_CDR_RBL_STGDB";
  GRANT SELECT ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "ROLE_ALL_DB";
  GRANT SELECT ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "CC_CDR_RBL_STGDB";
  GRANT SELECT ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "RBL_BI_RBL_STGDB";
  GRANT SELECT ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "BSG_READ_RBL_STGDB";
  GRANT SELECT ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "STD_FIN_RBL_STGDB";
  GRANT SELECT ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "RBL_STGDB";
  GRANT SELECT ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT SELECT ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "RBL_TEMPDB";
  GRANT SELECT ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "STG_FIN_RBL_STGDB";
  GRANT SELECT ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "ADF_CDR_RBL_STGDB";
  GRANT UPDATE ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "ROLE_ALL_DB";
  GRANT UPDATE ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "CC_CDR_RBL_STGDB";
  GRANT UPDATE ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "RBL_BI_RBL_STGDB";
  GRANT UPDATE ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "BSG_READ_RBL_STGDB";
  GRANT UPDATE ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "STD_FIN_RBL_STGDB";
  GRANT UPDATE ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "RBL_STGDB";
  GRANT UPDATE ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT UPDATE ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "RBL_TEMPDB";
  GRANT UPDATE ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "STG_FIN_RBL_STGDB";
  GRANT UPDATE ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "ADF_CDR_RBL_STGDB";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "CC_CDR_RBL_STGDB";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "RBL_BI_RBL_STGDB";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "BSG_READ_RBL_STGDB";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "STD_FIN_RBL_STGDB";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "RBL_STGDB";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "RBL_TEMPDB";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "STG_FIN_RBL_STGDB";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "ADF_CDR_RBL_STGDB";
  GRANT READ ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "ROLE_ALL_DB";
  GRANT READ ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "CC_CDR_RBL_STGDB";
  GRANT READ ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "RBL_BI_RBL_STGDB";
  GRANT READ ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "BSG_READ_RBL_STGDB";
  GRANT READ ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "STD_FIN_RBL_STGDB";
  GRANT READ ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "RBL_STGDB";
  GRANT READ ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT READ ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "RBL_TEMPDB";
  GRANT READ ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "STG_FIN_RBL_STGDB";
  GRANT READ ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "ADF_CDR_RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "ROLE_ALL_DB";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "CC_CDR_RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "RBL_BI_RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "BSG_READ_RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "STD_FIN_RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "RBL_TEMPDB";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "STG_FIN_RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "ADF_CDR_RBL_STGDB";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "ROLE_ALL_DB";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "CC_CDR_RBL_STGDB";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "RBL_BI_RBL_STGDB";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "BSG_READ_RBL_STGDB";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "STD_FIN_RBL_STGDB";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "RBL_STGDB";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "RBL_TEMPDB";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "STG_FIN_RBL_STGDB";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "ADF_CDR_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "ROLE_ALL_DB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "CC_CDR_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "RBL_BI_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "BSG_READ_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "STD_FIN_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "RBL_TEMPDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "STG_FIN_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "ADF_CDR_RBL_STGDB";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "ROLE_ALL_DB";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "CC_CDR_RBL_STGDB";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "RBL_BI_RBL_STGDB";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "BSG_READ_RBL_STGDB";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "STD_FIN_RBL_STGDB";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "RBL_STGDB";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "RBL_TEMPDB";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "STG_FIN_RBL_STGDB";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."ACLJOBEXECDETAIL" TO "ADF_CDR_RBL_STGDB";
