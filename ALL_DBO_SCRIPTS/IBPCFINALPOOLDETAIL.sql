--------------------------------------------------------
--  DDL for Table IBPCFINALPOOLDETAIL
--------------------------------------------------------

  CREATE TABLE "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" 
   (	"SUMMARYID" NUMBER(10,0), 
	"POOLID" CLOB, 
	"POOLNAME" CLOB, 
	"CUSTOMERID" CLOB, 
	"AUTHORISATIONSTATUS" VARCHAR2(20 CHAR), 
	"EFFECTIVEFROMTIMEKEY" NUMBER(10,0), 
	"EFFECTIVETOTIMEKEY" NUMBER(10,0), 
	"CREATEDBY" VARCHAR2(100 CHAR), 
	"DATECREATED" DATE, 
	"MODIFYBY" VARCHAR2(100 CHAR), 
	"DATEMODIFIED" VARCHAR2(200 CHAR), 
	"APPROVEDBY" VARCHAR2(100 CHAR), 
	"DATEAPPROVED" DATE, 
	"D2KTIMESTAMP" RAW(50), 
	"CHANGEFIELDS" VARCHAR2(100 CHAR), 
	"ENTITYKEY" NUMBER(10,0) GENERATED BY DEFAULT ON NULL AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE , 
	"POS" NUMBER(18,2), 
	"INTERESTRECEIVABLE" NUMBER(18,2), 
	"SOURCEALT_KEY" NUMBER(10,0), 
	"SOURCENAME" VARCHAR2(30 CHAR), 
	"CUSTOMERNAME" VARCHAR2(200 CHAR), 
	"FLAGALT_KEY" VARCHAR2(30 CHAR), 
	"ACCOUNTBALANCE" NUMBER(18,2), 
	"EXPOSUREAMOUNT" NUMBER(18,2), 
	"REMARK" VARCHAR2(250 CHAR), 
	"IBPCOUTDATE" VARCHAR2(200 CHAR), 
	"IBPCINDATE" VARCHAR2(200 CHAR), 
	"ACCOUNTID" VARCHAR2(20 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" 
 LOB ("POOLID") STORE AS SECUREFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192
  NOCACHE LOGGING  NOCOMPRESS  KEEP_DUPLICATES ) 
 LOB ("POOLNAME") STORE AS SECUREFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192
  NOCACHE LOGGING  NOCOMPRESS  KEEP_DUPLICATES ) 
 LOB ("CUSTOMERID") STORE AS SECUREFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192
  NOCACHE LOGGING  NOCOMPRESS  KEEP_DUPLICATES ) ;
  GRANT ALTER ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT ALTER ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "PREMOC_RBL_MISDB_PROD";
  GRANT ALTER ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "QPI_RBL_MISDB_PROD";
  GRANT ALTER ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "ALERT_RBL_MISDB_PROD";
  GRANT ALTER ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "DWH_RBL_MISDB_PROD";
  GRANT ALTER ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "MAIN_PRO";
  GRANT ALTER ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT ALTER ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "CURDAT_RBL_MISDB_PROD";
  GRANT ALTER ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "BS_RBL_MISDB_PROD";
  GRANT ALTER ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "ACL_RBL_MISDB_PROD";
  GRANT ALTER ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT ALTER ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT DELETE ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT DELETE ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "PREMOC_RBL_MISDB_PROD";
  GRANT DELETE ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "QPI_RBL_MISDB_PROD";
  GRANT DELETE ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "ALERT_RBL_MISDB_PROD";
  GRANT DELETE ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "DWH_RBL_MISDB_PROD";
  GRANT DELETE ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "MAIN_PRO";
  GRANT DELETE ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT DELETE ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "CURDAT_RBL_MISDB_PROD";
  GRANT DELETE ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "BS_RBL_MISDB_PROD";
  GRANT DELETE ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "ACL_RBL_MISDB_PROD";
  GRANT DELETE ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT DELETE ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT INDEX ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "PREMOC_RBL_MISDB_PROD";
  GRANT INDEX ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "QPI_RBL_MISDB_PROD";
  GRANT INDEX ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "ALERT_RBL_MISDB_PROD";
  GRANT INDEX ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "DWH_RBL_MISDB_PROD";
  GRANT INDEX ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "MAIN_PRO";
  GRANT INDEX ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT INDEX ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "CURDAT_RBL_MISDB_PROD";
  GRANT INDEX ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "BS_RBL_MISDB_PROD";
  GRANT INDEX ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "ACL_RBL_MISDB_PROD";
  GRANT INDEX ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT INDEX ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT INSERT ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT INSERT ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "PREMOC_RBL_MISDB_PROD";
  GRANT INSERT ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "QPI_RBL_MISDB_PROD";
  GRANT INSERT ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "ALERT_RBL_MISDB_PROD";
  GRANT INSERT ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "DWH_RBL_MISDB_PROD";
  GRANT INSERT ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "MAIN_PRO";
  GRANT INSERT ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT INSERT ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "CURDAT_RBL_MISDB_PROD";
  GRANT INSERT ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "BS_RBL_MISDB_PROD";
  GRANT INSERT ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "ACL_RBL_MISDB_PROD";
  GRANT INSERT ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT INSERT ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT SELECT ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT SELECT ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "PREMOC_RBL_MISDB_PROD";
  GRANT SELECT ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "QPI_RBL_MISDB_PROD";
  GRANT SELECT ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "ALERT_RBL_MISDB_PROD";
  GRANT SELECT ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "DWH_RBL_MISDB_PROD";
  GRANT SELECT ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "MAIN_PRO";
  GRANT SELECT ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT SELECT ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "CURDAT_RBL_MISDB_PROD";
  GRANT SELECT ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "BS_RBL_MISDB_PROD";
  GRANT SELECT ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "ACL_RBL_MISDB_PROD";
  GRANT SELECT ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT SELECT ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT UPDATE ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT UPDATE ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "PREMOC_RBL_MISDB_PROD";
  GRANT UPDATE ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "QPI_RBL_MISDB_PROD";
  GRANT UPDATE ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "ALERT_RBL_MISDB_PROD";
  GRANT UPDATE ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "DWH_RBL_MISDB_PROD";
  GRANT UPDATE ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "MAIN_PRO";
  GRANT UPDATE ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT UPDATE ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "CURDAT_RBL_MISDB_PROD";
  GRANT UPDATE ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "BS_RBL_MISDB_PROD";
  GRANT UPDATE ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "ACL_RBL_MISDB_PROD";
  GRANT UPDATE ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT UPDATE ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "PREMOC_RBL_MISDB_PROD";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "QPI_RBL_MISDB_PROD";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "ALERT_RBL_MISDB_PROD";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "DWH_RBL_MISDB_PROD";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "MAIN_PRO";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "CURDAT_RBL_MISDB_PROD";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "BS_RBL_MISDB_PROD";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "ACL_RBL_MISDB_PROD";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT READ ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT READ ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "PREMOC_RBL_MISDB_PROD";
  GRANT READ ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "QPI_RBL_MISDB_PROD";
  GRANT READ ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "ALERT_RBL_MISDB_PROD";
  GRANT READ ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "DWH_RBL_MISDB_PROD";
  GRANT READ ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "MAIN_PRO";
  GRANT READ ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT READ ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "CURDAT_RBL_MISDB_PROD";
  GRANT READ ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "BS_RBL_MISDB_PROD";
  GRANT READ ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "ACL_RBL_MISDB_PROD";
  GRANT READ ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT READ ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "PREMOC_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "QPI_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "ALERT_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "DWH_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "MAIN_PRO";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "CURDAT_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "BS_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "ACL_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "PREMOC_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "QPI_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "ALERT_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "DWH_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "MAIN_PRO";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "CURDAT_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "BS_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "ACL_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT DEBUG ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "PREMOC_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "QPI_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "ALERT_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "DWH_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "MAIN_PRO";
  GRANT DEBUG ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "CURDAT_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "BS_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "ACL_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "PREMOC_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "QPI_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "ALERT_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "DWH_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "MAIN_PRO";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "CURDAT_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "BS_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "ACL_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT ALTER ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "ROLE_ALL_DB";
  GRANT ALTER ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "CC_CDR_RBL_STGDB";
  GRANT ALTER ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "RBL_BI_RBL_STGDB";
  GRANT ALTER ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "BSG_READ_RBL_STGDB";
  GRANT ALTER ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "STD_FIN_RBL_STGDB";
  GRANT ALTER ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "RBL_STGDB";
  GRANT ALTER ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT ALTER ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "RBL_TEMPDB";
  GRANT ALTER ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "STG_FIN_RBL_STGDB";
  GRANT ALTER ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "ADF_CDR_RBL_STGDB";
  GRANT DELETE ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "ROLE_ALL_DB";
  GRANT DELETE ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "CC_CDR_RBL_STGDB";
  GRANT DELETE ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "RBL_BI_RBL_STGDB";
  GRANT DELETE ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "BSG_READ_RBL_STGDB";
  GRANT DELETE ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "STD_FIN_RBL_STGDB";
  GRANT DELETE ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "RBL_STGDB";
  GRANT DELETE ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT DELETE ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "RBL_TEMPDB";
  GRANT DELETE ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "STG_FIN_RBL_STGDB";
  GRANT DELETE ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "ADF_CDR_RBL_STGDB";
  GRANT INDEX ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "CC_CDR_RBL_STGDB";
  GRANT INDEX ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "RBL_BI_RBL_STGDB";
  GRANT INDEX ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "BSG_READ_RBL_STGDB";
  GRANT INDEX ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "STD_FIN_RBL_STGDB";
  GRANT INDEX ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "RBL_STGDB";
  GRANT INDEX ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT INDEX ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "RBL_TEMPDB";
  GRANT INDEX ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "STG_FIN_RBL_STGDB";
  GRANT INDEX ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "ADF_CDR_RBL_STGDB";
  GRANT INSERT ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "ROLE_ALL_DB";
  GRANT INSERT ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "CC_CDR_RBL_STGDB";
  GRANT INSERT ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "RBL_BI_RBL_STGDB";
  GRANT INSERT ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "BSG_READ_RBL_STGDB";
  GRANT INSERT ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "STD_FIN_RBL_STGDB";
  GRANT INSERT ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "RBL_STGDB";
  GRANT INSERT ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT INSERT ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "RBL_TEMPDB";
  GRANT INSERT ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "STG_FIN_RBL_STGDB";
  GRANT INSERT ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "ADF_CDR_RBL_STGDB";
  GRANT SELECT ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "ROLE_ALL_DB";
  GRANT SELECT ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "CC_CDR_RBL_STGDB";
  GRANT SELECT ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "RBL_BI_RBL_STGDB";
  GRANT SELECT ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "BSG_READ_RBL_STGDB";
  GRANT SELECT ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "STD_FIN_RBL_STGDB";
  GRANT SELECT ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "RBL_STGDB";
  GRANT SELECT ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT SELECT ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "RBL_TEMPDB";
  GRANT SELECT ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "STG_FIN_RBL_STGDB";
  GRANT SELECT ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "ADF_CDR_RBL_STGDB";
  GRANT UPDATE ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "ROLE_ALL_DB";
  GRANT UPDATE ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "CC_CDR_RBL_STGDB";
  GRANT UPDATE ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "RBL_BI_RBL_STGDB";
  GRANT UPDATE ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "BSG_READ_RBL_STGDB";
  GRANT UPDATE ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "STD_FIN_RBL_STGDB";
  GRANT UPDATE ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "RBL_STGDB";
  GRANT UPDATE ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT UPDATE ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "RBL_TEMPDB";
  GRANT UPDATE ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "STG_FIN_RBL_STGDB";
  GRANT UPDATE ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "ADF_CDR_RBL_STGDB";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "CC_CDR_RBL_STGDB";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "RBL_BI_RBL_STGDB";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "BSG_READ_RBL_STGDB";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "STD_FIN_RBL_STGDB";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "RBL_STGDB";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "RBL_TEMPDB";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "STG_FIN_RBL_STGDB";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "ADF_CDR_RBL_STGDB";
  GRANT READ ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "ROLE_ALL_DB";
  GRANT READ ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "CC_CDR_RBL_STGDB";
  GRANT READ ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "RBL_BI_RBL_STGDB";
  GRANT READ ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "BSG_READ_RBL_STGDB";
  GRANT READ ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "STD_FIN_RBL_STGDB";
  GRANT READ ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "RBL_STGDB";
  GRANT READ ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT READ ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "RBL_TEMPDB";
  GRANT READ ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "STG_FIN_RBL_STGDB";
  GRANT READ ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "ADF_CDR_RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "ROLE_ALL_DB";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "CC_CDR_RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "RBL_BI_RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "BSG_READ_RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "STD_FIN_RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "RBL_TEMPDB";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "STG_FIN_RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "ADF_CDR_RBL_STGDB";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "ROLE_ALL_DB";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "CC_CDR_RBL_STGDB";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "RBL_BI_RBL_STGDB";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "BSG_READ_RBL_STGDB";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "STD_FIN_RBL_STGDB";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "RBL_STGDB";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "RBL_TEMPDB";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "STG_FIN_RBL_STGDB";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "ADF_CDR_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "ROLE_ALL_DB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "CC_CDR_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "RBL_BI_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "BSG_READ_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "STD_FIN_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "RBL_TEMPDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "STG_FIN_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "ADF_CDR_RBL_STGDB";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "ROLE_ALL_DB";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "CC_CDR_RBL_STGDB";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "RBL_BI_RBL_STGDB";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "BSG_READ_RBL_STGDB";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "STD_FIN_RBL_STGDB";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "RBL_STGDB";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "RBL_TEMPDB";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "STG_FIN_RBL_STGDB";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."IBPCFINALPOOLDETAIL" TO "ADF_CDR_RBL_STGDB";
