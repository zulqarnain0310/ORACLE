--------------------------------------------------------
--  DDL for Table DIMBUSINESSGROUP
--------------------------------------------------------

  CREATE TABLE "RBL_MISDB_PROD"."DIMBUSINESSGROUP" 
   (	"BUSINESSGROUP_KEY" NUMBER(5,0), 
	"BUSINESSGROUPALT_KEY" NUMBER(5,0), 
	"BUSINESSGROUPNAME" VARCHAR2(100 CHAR), 
	"BUSINESSGROUPSHORTNAME" VARCHAR2(20 CHAR), 
	"BUSINESSGROUPSHORTNAMEENUM" VARCHAR2(20 CHAR), 
	"BUSINESSGROUPGROUP" VARCHAR2(50 CHAR), 
	"BUSINESSGROUPSUBGROUP" VARCHAR2(50 CHAR), 
	"BUSINESSGROUPSEGMENT" VARCHAR2(50 CHAR), 
	"BUSINESSGROUPVALIDCODE" CHAR(1 CHAR), 
	"SRCSYSBUSINESSGROUPCODE" VARCHAR2(50 CHAR), 
	"SRCSYSBUSINESSGROUPNAME" VARCHAR2(50 CHAR), 
	"DESTSYSBUSINESSGROUPCODE" VARCHAR2(10 CHAR), 
	"AUTHORISATIONSTATUS" VARCHAR2(2 CHAR), 
	"EFFECTIVEFROMTIMEKEY" NUMBER(10,0), 
	"EFFECTIVETOTIMEKEY" NUMBER(10,0), 
	"CREATEDBY" VARCHAR2(20 CHAR), 
	"DATECREATED" DATE, 
	"MODIFIEDBY" VARCHAR2(20 CHAR), 
	"DATEMODIFIE" DATE, 
	"APPROVEDBY" VARCHAR2(20 CHAR), 
	"DATEAPPROVED" DATE, 
	"D2KTIMESTAMP" RAW(50), 
	"RBIGROUPCODE" VARCHAR2(10 CHAR), 
	"RBIGROUPDESC" VARCHAR2(100 CHAR)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
  GRANT ALTER ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT ALTER ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "PREMOC_RBL_MISDB_PROD";
  GRANT ALTER ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "QPI_RBL_MISDB_PROD";
  GRANT ALTER ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "ALERT_RBL_MISDB_PROD";
  GRANT ALTER ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "DWH_RBL_MISDB_PROD";
  GRANT ALTER ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "MAIN_PRO";
  GRANT ALTER ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT ALTER ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "CURDAT_RBL_MISDB_PROD";
  GRANT ALTER ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "BS_RBL_MISDB_PROD";
  GRANT ALTER ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "ACL_RBL_MISDB_PROD";
  GRANT ALTER ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT ALTER ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT DELETE ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT DELETE ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "PREMOC_RBL_MISDB_PROD";
  GRANT DELETE ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "QPI_RBL_MISDB_PROD";
  GRANT DELETE ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "ALERT_RBL_MISDB_PROD";
  GRANT DELETE ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "DWH_RBL_MISDB_PROD";
  GRANT DELETE ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "MAIN_PRO";
  GRANT DELETE ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT DELETE ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "CURDAT_RBL_MISDB_PROD";
  GRANT DELETE ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "BS_RBL_MISDB_PROD";
  GRANT DELETE ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "ACL_RBL_MISDB_PROD";
  GRANT DELETE ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT DELETE ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT INDEX ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "PREMOC_RBL_MISDB_PROD";
  GRANT INDEX ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "QPI_RBL_MISDB_PROD";
  GRANT INDEX ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "ALERT_RBL_MISDB_PROD";
  GRANT INDEX ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "DWH_RBL_MISDB_PROD";
  GRANT INDEX ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "MAIN_PRO";
  GRANT INDEX ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT INDEX ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "CURDAT_RBL_MISDB_PROD";
  GRANT INDEX ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "BS_RBL_MISDB_PROD";
  GRANT INDEX ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "ACL_RBL_MISDB_PROD";
  GRANT INDEX ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT INDEX ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT INSERT ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT INSERT ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "PREMOC_RBL_MISDB_PROD";
  GRANT INSERT ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "QPI_RBL_MISDB_PROD";
  GRANT INSERT ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "ALERT_RBL_MISDB_PROD";
  GRANT INSERT ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "DWH_RBL_MISDB_PROD";
  GRANT INSERT ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "MAIN_PRO";
  GRANT INSERT ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT INSERT ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "CURDAT_RBL_MISDB_PROD";
  GRANT INSERT ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "BS_RBL_MISDB_PROD";
  GRANT INSERT ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "ACL_RBL_MISDB_PROD";
  GRANT INSERT ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT INSERT ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT SELECT ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT SELECT ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "PREMOC_RBL_MISDB_PROD";
  GRANT SELECT ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "QPI_RBL_MISDB_PROD";
  GRANT SELECT ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "ALERT_RBL_MISDB_PROD";
  GRANT SELECT ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "DWH_RBL_MISDB_PROD";
  GRANT SELECT ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "MAIN_PRO";
  GRANT SELECT ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT SELECT ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "CURDAT_RBL_MISDB_PROD";
  GRANT SELECT ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "BS_RBL_MISDB_PROD";
  GRANT SELECT ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "ACL_RBL_MISDB_PROD";
  GRANT SELECT ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT SELECT ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT UPDATE ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT UPDATE ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "PREMOC_RBL_MISDB_PROD";
  GRANT UPDATE ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "QPI_RBL_MISDB_PROD";
  GRANT UPDATE ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "ALERT_RBL_MISDB_PROD";
  GRANT UPDATE ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "DWH_RBL_MISDB_PROD";
  GRANT UPDATE ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "MAIN_PRO";
  GRANT UPDATE ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT UPDATE ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "CURDAT_RBL_MISDB_PROD";
  GRANT UPDATE ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "BS_RBL_MISDB_PROD";
  GRANT UPDATE ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "ACL_RBL_MISDB_PROD";
  GRANT UPDATE ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT UPDATE ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "PREMOC_RBL_MISDB_PROD";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "QPI_RBL_MISDB_PROD";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "ALERT_RBL_MISDB_PROD";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "DWH_RBL_MISDB_PROD";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "MAIN_PRO";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "CURDAT_RBL_MISDB_PROD";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "BS_RBL_MISDB_PROD";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "ACL_RBL_MISDB_PROD";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT READ ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT READ ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "PREMOC_RBL_MISDB_PROD";
  GRANT READ ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "QPI_RBL_MISDB_PROD";
  GRANT READ ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "ALERT_RBL_MISDB_PROD";
  GRANT READ ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "DWH_RBL_MISDB_PROD";
  GRANT READ ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "MAIN_PRO";
  GRANT READ ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT READ ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "CURDAT_RBL_MISDB_PROD";
  GRANT READ ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "BS_RBL_MISDB_PROD";
  GRANT READ ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "ACL_RBL_MISDB_PROD";
  GRANT READ ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT READ ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "PREMOC_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "QPI_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "ALERT_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "DWH_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "MAIN_PRO";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "CURDAT_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "BS_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "ACL_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "PREMOC_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "QPI_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "ALERT_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "DWH_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "MAIN_PRO";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "CURDAT_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "BS_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "ACL_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT DEBUG ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "PREMOC_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "QPI_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "ALERT_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "DWH_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "MAIN_PRO";
  GRANT DEBUG ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "CURDAT_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "BS_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "ACL_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "PREMOC_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "QPI_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "ALERT_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "DWH_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "MAIN_PRO";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "CURDAT_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "BS_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "ACL_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT ALTER ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "ROLE_ALL_DB";
  GRANT ALTER ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "CC_CDR_RBL_STGDB";
  GRANT ALTER ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "RBL_BI_RBL_STGDB";
  GRANT ALTER ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "BSG_READ_RBL_STGDB";
  GRANT ALTER ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "STD_FIN_RBL_STGDB";
  GRANT ALTER ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "RBL_STGDB";
  GRANT ALTER ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT ALTER ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "RBL_TEMPDB";
  GRANT ALTER ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "STG_FIN_RBL_STGDB";
  GRANT ALTER ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "ADF_CDR_RBL_STGDB";
  GRANT DELETE ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "ROLE_ALL_DB";
  GRANT DELETE ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "CC_CDR_RBL_STGDB";
  GRANT DELETE ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "RBL_BI_RBL_STGDB";
  GRANT DELETE ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "BSG_READ_RBL_STGDB";
  GRANT DELETE ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "STD_FIN_RBL_STGDB";
  GRANT DELETE ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "RBL_STGDB";
  GRANT DELETE ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT DELETE ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "RBL_TEMPDB";
  GRANT DELETE ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "STG_FIN_RBL_STGDB";
  GRANT DELETE ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "ADF_CDR_RBL_STGDB";
  GRANT INDEX ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "CC_CDR_RBL_STGDB";
  GRANT INDEX ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "RBL_BI_RBL_STGDB";
  GRANT INDEX ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "BSG_READ_RBL_STGDB";
  GRANT INDEX ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "STD_FIN_RBL_STGDB";
  GRANT INDEX ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "RBL_STGDB";
  GRANT INDEX ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT INDEX ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "RBL_TEMPDB";
  GRANT INDEX ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "STG_FIN_RBL_STGDB";
  GRANT INDEX ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "ADF_CDR_RBL_STGDB";
  GRANT INSERT ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "ROLE_ALL_DB";
  GRANT INSERT ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "CC_CDR_RBL_STGDB";
  GRANT INSERT ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "RBL_BI_RBL_STGDB";
  GRANT INSERT ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "BSG_READ_RBL_STGDB";
  GRANT INSERT ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "STD_FIN_RBL_STGDB";
  GRANT INSERT ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "RBL_STGDB";
  GRANT INSERT ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT INSERT ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "RBL_TEMPDB";
  GRANT INSERT ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "STG_FIN_RBL_STGDB";
  GRANT INSERT ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "ADF_CDR_RBL_STGDB";
  GRANT SELECT ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "ROLE_ALL_DB";
  GRANT SELECT ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "CC_CDR_RBL_STGDB";
  GRANT SELECT ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "RBL_BI_RBL_STGDB";
  GRANT SELECT ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "BSG_READ_RBL_STGDB";
  GRANT SELECT ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "STD_FIN_RBL_STGDB";
  GRANT SELECT ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "RBL_STGDB";
  GRANT SELECT ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT SELECT ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "RBL_TEMPDB";
  GRANT SELECT ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "STG_FIN_RBL_STGDB";
  GRANT SELECT ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "ADF_CDR_RBL_STGDB";
  GRANT UPDATE ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "ROLE_ALL_DB";
  GRANT UPDATE ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "CC_CDR_RBL_STGDB";
  GRANT UPDATE ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "RBL_BI_RBL_STGDB";
  GRANT UPDATE ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "BSG_READ_RBL_STGDB";
  GRANT UPDATE ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "STD_FIN_RBL_STGDB";
  GRANT UPDATE ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "RBL_STGDB";
  GRANT UPDATE ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT UPDATE ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "RBL_TEMPDB";
  GRANT UPDATE ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "STG_FIN_RBL_STGDB";
  GRANT UPDATE ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "ADF_CDR_RBL_STGDB";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "CC_CDR_RBL_STGDB";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "RBL_BI_RBL_STGDB";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "BSG_READ_RBL_STGDB";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "STD_FIN_RBL_STGDB";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "RBL_STGDB";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "RBL_TEMPDB";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "STG_FIN_RBL_STGDB";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "ADF_CDR_RBL_STGDB";
  GRANT READ ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "ROLE_ALL_DB";
  GRANT READ ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "CC_CDR_RBL_STGDB";
  GRANT READ ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "RBL_BI_RBL_STGDB";
  GRANT READ ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "BSG_READ_RBL_STGDB";
  GRANT READ ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "STD_FIN_RBL_STGDB";
  GRANT READ ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "RBL_STGDB";
  GRANT READ ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT READ ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "RBL_TEMPDB";
  GRANT READ ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "STG_FIN_RBL_STGDB";
  GRANT READ ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "ADF_CDR_RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "ROLE_ALL_DB";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "CC_CDR_RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "RBL_BI_RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "BSG_READ_RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "STD_FIN_RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "RBL_TEMPDB";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "STG_FIN_RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "ADF_CDR_RBL_STGDB";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "ROLE_ALL_DB";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "CC_CDR_RBL_STGDB";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "RBL_BI_RBL_STGDB";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "BSG_READ_RBL_STGDB";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "STD_FIN_RBL_STGDB";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "RBL_STGDB";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "RBL_TEMPDB";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "STG_FIN_RBL_STGDB";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "ADF_CDR_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "ROLE_ALL_DB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "CC_CDR_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "RBL_BI_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "BSG_READ_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "STD_FIN_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "RBL_TEMPDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "STG_FIN_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "ADF_CDR_RBL_STGDB";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "ROLE_ALL_DB";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "CC_CDR_RBL_STGDB";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "RBL_BI_RBL_STGDB";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "BSG_READ_RBL_STGDB";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "STD_FIN_RBL_STGDB";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "RBL_STGDB";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "RBL_TEMPDB";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "STG_FIN_RBL_STGDB";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."DIMBUSINESSGROUP" TO "ADF_CDR_RBL_STGDB";
