--------------------------------------------------------
--  DDL for Table ADVACBASICDETAIL_FEB2024
--------------------------------------------------------

  CREATE TABLE "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" 
   (	"AC_KEY" NUMBER(19,0), 
	"BRANCHCODE" VARCHAR2(10 CHAR), 
	"ACCOUNTENTITYID" NUMBER(10,0), 
	"CUSTOMERENTITYID" NUMBER(10,0), 
	"SYSTEMACID" VARCHAR2(30 CHAR), 
	"CUSTOMERACID" VARCHAR2(30 CHAR), 
	"GLALT_KEY" NUMBER(10,0), 
	"PRODUCTALT_KEY" NUMBER(5,0), 
	"GLPRODUCTALT_KEY" NUMBER(5,0), 
	"FACILITYTYPE" VARCHAR2(10 CHAR), 
	"SECTORALT_KEY" NUMBER(5,0), 
	"SUBSECTORALT_KEY" NUMBER(5,0), 
	"ACTIVITYALT_KEY" NUMBER(5,0), 
	"INDUSTRYALT_KEY" NUMBER(5,0), 
	"SCHEMEALT_KEY" NUMBER(5,0), 
	"DISTRICTALT_KEY" NUMBER(5,0), 
	"AREAALT_KEY" NUMBER(5,0), 
	"VILLAGEALT_KEY" NUMBER(10,0), 
	"STATEALT_KEY" NUMBER(5,0), 
	"CURRENCYALT_KEY" NUMBER(5,0), 
	"ORIGINALSANCTIONAUTHALT_KEY" NUMBER(5,0), 
	"ORIGINALLIMITREFNO" VARCHAR2(25 CHAR), 
	"ORIGINALLIMIT" NUMBER(16,2), 
	"ORIGINALLIMITDT" VARCHAR2(200 CHAR), 
	"DTOFFIRSTDISB" VARCHAR2(200 CHAR), 
	"FLAGRELIEFWAVIER" VARCHAR2(1 CHAR), 
	"UNDERLINEACTIVITYALT_KEY" NUMBER(5,0), 
	"MICROCREDIT" VARCHAR2(1 CHAR), 
	"SCRCRERROR" VARCHAR2(100 CHAR), 
	"ADJDT" VARCHAR2(200 CHAR), 
	"ADJREASONALT_KEY" NUMBER(5,0), 
	"MARGINTYPE" NUMBER(5,0), 
	"PREF_INTTRATE" NUMBER(4,2), 
	"CURRENTLIMITREFNO" VARCHAR2(25 CHAR), 
	"GUARANTEECOVERALT_KEY" NUMBER(5,0), 
	"ACCOUNTNAME" VARCHAR2(80 CHAR), 
	"ASSETCLASS" VARCHAR2(20 CHAR), 
	"JOINTACCOUNT" VARCHAR2(1 CHAR), 
	"LASTDISBDT" VARCHAR2(200 CHAR), 
	"SCRCRERRORBACKUP" VARCHAR2(100 CHAR), 
	"ACCOUNTOPENDATE" VARCHAR2(200 CHAR), 
	"AC_LADDT" VARCHAR2(200 CHAR), 
	"AC_DOCUMENTDT" VARCHAR2(200 CHAR), 
	"CURRENTLIMIT" NUMBER(16,2), 
	"INTTTYPEALT_KEY" NUMBER(5,0), 
	"INTTRATELOADFACTOR" NUMBER(4,2), 
	"MARGIN" NUMBER(5,2), 
	"CURRENTLIMITDT" VARCHAR2(200 CHAR), 
	"AC_DUEDT" VARCHAR2(200 CHAR), 
	"DRAWINGPOWERALT_KEY" NUMBER(5,0), 
	"REFCUSTOMERID" VARCHAR2(20 CHAR), 
	"AUTHORISATIONSTATUS" CHAR(2 CHAR), 
	"EFFECTIVEFROMTIMEKEY" NUMBER(10,0), 
	"EFFECTIVETOTIMEKEY" NUMBER(10,0), 
	"CREATEDBY" VARCHAR2(20 CHAR), 
	"DATECREATED" DATE, 
	"MODIFIEDBY" VARCHAR2(20 CHAR), 
	"DATEMODIFIED" DATE, 
	"APPROVEDBY" VARCHAR2(20 CHAR), 
	"DATEAPPROVED" DATE, 
	"D2KTIMESTAMP" DATE, 
	"MOCSTATUS" CHAR(1 CHAR), 
	"MOCDATE" DATE, 
	"MOCTYPEALT_KEY" NUMBER(10,0), 
	"ISLAD" NUMBER(1,0), 
	"FINCALEBASEDINDUSTRYALT_KEY" NUMBER(5,0), 
	"ACCATEGORYALT_KEY" NUMBER(5,0), 
	"ORIGINALSANCTIONAUTHLEVELALT_KEY" NUMBER(5,0), 
	"ACTYPEALT_KEY" NUMBER(5,0), 
	"SCRCRERRORSEQ" VARCHAR2(200 CHAR), 
	"BSRUNID" VARCHAR2(40 CHAR), 
	"ADDITIONALPROV" NUMBER(16,2), 
	"ACLATTESTDEVELOPMENT" VARCHAR2(1000 CHAR), 
	"SOURCEALT_KEY" NUMBER(3,0), 
	"LOANSERIES" NUMBER(5,0), 
	"LOANREFNO" NUMBER(5,0), 
	"SECURITIZATIONCODE" NVARCHAR2(20), 
	"FULL_DISB" CHAR(1 CHAR), 
	"ORIGINALBRANCHCODE" VARCHAR2(10 CHAR), 
	"PROJECTCOST" NUMBER(16,2), 
	"FLGSECURED" CHAR(1 CHAR), 
	"SEGMENTCODE" VARCHAR2(30 CHAR), 
	"REFERENCEPERIOD" NUMBER(5,0)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
  GRANT ALTER ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT ALTER ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "PREMOC_RBL_MISDB_PROD";
  GRANT ALTER ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "QPI_RBL_MISDB_PROD";
  GRANT ALTER ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "ALERT_RBL_MISDB_PROD";
  GRANT ALTER ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "DWH_RBL_MISDB_PROD";
  GRANT ALTER ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "MAIN_PRO";
  GRANT ALTER ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT ALTER ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "BS_RBL_MISDB_PROD";
  GRANT ALTER ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "ACL_RBL_MISDB_PROD";
  GRANT ALTER ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT ALTER ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "RBL_MISDB_PROD";
  GRANT ALTER ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT DELETE ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT DELETE ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "PREMOC_RBL_MISDB_PROD";
  GRANT DELETE ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "QPI_RBL_MISDB_PROD";
  GRANT DELETE ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "ALERT_RBL_MISDB_PROD";
  GRANT DELETE ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "DWH_RBL_MISDB_PROD";
  GRANT DELETE ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "MAIN_PRO";
  GRANT DELETE ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT DELETE ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "BS_RBL_MISDB_PROD";
  GRANT DELETE ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "ACL_RBL_MISDB_PROD";
  GRANT DELETE ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT DELETE ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "RBL_MISDB_PROD";
  GRANT DELETE ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT INDEX ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "PREMOC_RBL_MISDB_PROD";
  GRANT INDEX ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "QPI_RBL_MISDB_PROD";
  GRANT INDEX ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "ALERT_RBL_MISDB_PROD";
  GRANT INDEX ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "DWH_RBL_MISDB_PROD";
  GRANT INDEX ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "MAIN_PRO";
  GRANT INDEX ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT INDEX ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "BS_RBL_MISDB_PROD";
  GRANT INDEX ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "ACL_RBL_MISDB_PROD";
  GRANT INDEX ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT INDEX ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "RBL_MISDB_PROD";
  GRANT INDEX ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT INSERT ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT INSERT ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "PREMOC_RBL_MISDB_PROD";
  GRANT INSERT ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "QPI_RBL_MISDB_PROD";
  GRANT INSERT ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "ALERT_RBL_MISDB_PROD";
  GRANT INSERT ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "DWH_RBL_MISDB_PROD";
  GRANT INSERT ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "MAIN_PRO";
  GRANT INSERT ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT INSERT ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "BS_RBL_MISDB_PROD";
  GRANT INSERT ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "ACL_RBL_MISDB_PROD";
  GRANT INSERT ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT INSERT ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "RBL_MISDB_PROD";
  GRANT INSERT ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT SELECT ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT SELECT ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "PREMOC_RBL_MISDB_PROD";
  GRANT SELECT ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "QPI_RBL_MISDB_PROD";
  GRANT SELECT ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "ALERT_RBL_MISDB_PROD";
  GRANT SELECT ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "DWH_RBL_MISDB_PROD";
  GRANT SELECT ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "MAIN_PRO";
  GRANT SELECT ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT SELECT ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "BS_RBL_MISDB_PROD";
  GRANT SELECT ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "ACL_RBL_MISDB_PROD";
  GRANT SELECT ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT SELECT ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "RBL_MISDB_PROD";
  GRANT SELECT ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT UPDATE ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT UPDATE ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "PREMOC_RBL_MISDB_PROD";
  GRANT UPDATE ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "QPI_RBL_MISDB_PROD";
  GRANT UPDATE ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "ALERT_RBL_MISDB_PROD";
  GRANT UPDATE ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "DWH_RBL_MISDB_PROD";
  GRANT UPDATE ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "MAIN_PRO";
  GRANT UPDATE ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT UPDATE ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "BS_RBL_MISDB_PROD";
  GRANT UPDATE ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "ACL_RBL_MISDB_PROD";
  GRANT UPDATE ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT UPDATE ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "RBL_MISDB_PROD";
  GRANT UPDATE ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT REFERENCES ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "PREMOC_RBL_MISDB_PROD";
  GRANT REFERENCES ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "QPI_RBL_MISDB_PROD";
  GRANT REFERENCES ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "ALERT_RBL_MISDB_PROD";
  GRANT REFERENCES ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "DWH_RBL_MISDB_PROD";
  GRANT REFERENCES ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "MAIN_PRO";
  GRANT REFERENCES ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT REFERENCES ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "BS_RBL_MISDB_PROD";
  GRANT REFERENCES ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "ACL_RBL_MISDB_PROD";
  GRANT REFERENCES ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT REFERENCES ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "RBL_MISDB_PROD";
  GRANT REFERENCES ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT READ ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT READ ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "PREMOC_RBL_MISDB_PROD";
  GRANT READ ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "QPI_RBL_MISDB_PROD";
  GRANT READ ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "ALERT_RBL_MISDB_PROD";
  GRANT READ ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "DWH_RBL_MISDB_PROD";
  GRANT READ ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "MAIN_PRO";
  GRANT READ ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT READ ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "BS_RBL_MISDB_PROD";
  GRANT READ ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "ACL_RBL_MISDB_PROD";
  GRANT READ ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT READ ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "RBL_MISDB_PROD";
  GRANT READ ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT ON COMMIT REFRESH ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "PREMOC_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "QPI_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "ALERT_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "DWH_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "MAIN_PRO";
  GRANT ON COMMIT REFRESH ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "BS_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "ACL_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT QUERY REWRITE ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "PREMOC_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "QPI_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "ALERT_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "DWH_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "MAIN_PRO";
  GRANT QUERY REWRITE ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "BS_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "ACL_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT DEBUG ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT DEBUG ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "PREMOC_RBL_MISDB_PROD";
  GRANT DEBUG ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "QPI_RBL_MISDB_PROD";
  GRANT DEBUG ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "ALERT_RBL_MISDB_PROD";
  GRANT DEBUG ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "DWH_RBL_MISDB_PROD";
  GRANT DEBUG ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "MAIN_PRO";
  GRANT DEBUG ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT DEBUG ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "BS_RBL_MISDB_PROD";
  GRANT DEBUG ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "ACL_RBL_MISDB_PROD";
  GRANT DEBUG ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT DEBUG ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "RBL_MISDB_PROD";
  GRANT DEBUG ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT FLASHBACK ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "PREMOC_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "QPI_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "ALERT_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "DWH_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "MAIN_PRO";
  GRANT FLASHBACK ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "BS_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "ACL_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "RBL_MISDB_PROD";
  GRANT FLASHBACK ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT ALTER ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "ROLE_ALL_DB";
  GRANT ALTER ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "CC_CDR_RBL_STGDB";
  GRANT ALTER ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "RBL_BI_RBL_STGDB";
  GRANT ALTER ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "BSG_READ_RBL_STGDB";
  GRANT ALTER ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "STD_FIN_RBL_STGDB";
  GRANT ALTER ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "RBL_STGDB";
  GRANT ALTER ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT ALTER ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "RBL_TEMPDB";
  GRANT ALTER ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "STG_FIN_RBL_STGDB";
  GRANT ALTER ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "ADF_CDR_RBL_STGDB";
  GRANT DELETE ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "ROLE_ALL_DB";
  GRANT DELETE ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "CC_CDR_RBL_STGDB";
  GRANT DELETE ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "RBL_BI_RBL_STGDB";
  GRANT DELETE ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "BSG_READ_RBL_STGDB";
  GRANT DELETE ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "STD_FIN_RBL_STGDB";
  GRANT DELETE ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "RBL_STGDB";
  GRANT DELETE ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT DELETE ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "RBL_TEMPDB";
  GRANT DELETE ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "STG_FIN_RBL_STGDB";
  GRANT DELETE ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "ADF_CDR_RBL_STGDB";
  GRANT INDEX ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "CC_CDR_RBL_STGDB";
  GRANT INDEX ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "RBL_BI_RBL_STGDB";
  GRANT INDEX ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "BSG_READ_RBL_STGDB";
  GRANT INDEX ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "STD_FIN_RBL_STGDB";
  GRANT INDEX ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "RBL_STGDB";
  GRANT INDEX ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT INDEX ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "RBL_TEMPDB";
  GRANT INDEX ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "STG_FIN_RBL_STGDB";
  GRANT INDEX ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "ADF_CDR_RBL_STGDB";
  GRANT INSERT ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "ROLE_ALL_DB";
  GRANT INSERT ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "CC_CDR_RBL_STGDB";
  GRANT INSERT ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "RBL_BI_RBL_STGDB";
  GRANT INSERT ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "BSG_READ_RBL_STGDB";
  GRANT INSERT ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "STD_FIN_RBL_STGDB";
  GRANT INSERT ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "RBL_STGDB";
  GRANT INSERT ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT INSERT ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "RBL_TEMPDB";
  GRANT INSERT ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "STG_FIN_RBL_STGDB";
  GRANT INSERT ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "ADF_CDR_RBL_STGDB";
  GRANT SELECT ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "ROLE_ALL_DB";
  GRANT SELECT ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "CC_CDR_RBL_STGDB";
  GRANT SELECT ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "RBL_BI_RBL_STGDB";
  GRANT SELECT ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "BSG_READ_RBL_STGDB";
  GRANT SELECT ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "STD_FIN_RBL_STGDB";
  GRANT SELECT ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "RBL_STGDB";
  GRANT SELECT ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT SELECT ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "RBL_TEMPDB";
  GRANT SELECT ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "STG_FIN_RBL_STGDB";
  GRANT SELECT ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "ADF_CDR_RBL_STGDB";
  GRANT UPDATE ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "ROLE_ALL_DB";
  GRANT UPDATE ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "CC_CDR_RBL_STGDB";
  GRANT UPDATE ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "RBL_BI_RBL_STGDB";
  GRANT UPDATE ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "BSG_READ_RBL_STGDB";
  GRANT UPDATE ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "STD_FIN_RBL_STGDB";
  GRANT UPDATE ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "RBL_STGDB";
  GRANT UPDATE ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT UPDATE ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "RBL_TEMPDB";
  GRANT UPDATE ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "STG_FIN_RBL_STGDB";
  GRANT UPDATE ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "ADF_CDR_RBL_STGDB";
  GRANT REFERENCES ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "CC_CDR_RBL_STGDB";
  GRANT REFERENCES ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "RBL_BI_RBL_STGDB";
  GRANT REFERENCES ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "BSG_READ_RBL_STGDB";
  GRANT REFERENCES ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "STD_FIN_RBL_STGDB";
  GRANT REFERENCES ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "RBL_STGDB";
  GRANT REFERENCES ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT REFERENCES ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "RBL_TEMPDB";
  GRANT REFERENCES ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "STG_FIN_RBL_STGDB";
  GRANT REFERENCES ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "ADF_CDR_RBL_STGDB";
  GRANT READ ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "ROLE_ALL_DB";
  GRANT READ ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "CC_CDR_RBL_STGDB";
  GRANT READ ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "RBL_BI_RBL_STGDB";
  GRANT READ ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "BSG_READ_RBL_STGDB";
  GRANT READ ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "STD_FIN_RBL_STGDB";
  GRANT READ ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "RBL_STGDB";
  GRANT READ ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT READ ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "RBL_TEMPDB";
  GRANT READ ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "STG_FIN_RBL_STGDB";
  GRANT READ ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "ADF_CDR_RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "ROLE_ALL_DB";
  GRANT ON COMMIT REFRESH ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "CC_CDR_RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "RBL_BI_RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "BSG_READ_RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "STD_FIN_RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT ON COMMIT REFRESH ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "RBL_TEMPDB";
  GRANT ON COMMIT REFRESH ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "STG_FIN_RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "ADF_CDR_RBL_STGDB";
  GRANT QUERY REWRITE ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "ROLE_ALL_DB";
  GRANT QUERY REWRITE ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "CC_CDR_RBL_STGDB";
  GRANT QUERY REWRITE ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "RBL_BI_RBL_STGDB";
  GRANT QUERY REWRITE ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "BSG_READ_RBL_STGDB";
  GRANT QUERY REWRITE ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "STD_FIN_RBL_STGDB";
  GRANT QUERY REWRITE ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "RBL_STGDB";
  GRANT QUERY REWRITE ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT QUERY REWRITE ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "RBL_TEMPDB";
  GRANT QUERY REWRITE ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "STG_FIN_RBL_STGDB";
  GRANT QUERY REWRITE ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "ADF_CDR_RBL_STGDB";
  GRANT DEBUG ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "ROLE_ALL_DB";
  GRANT DEBUG ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "CC_CDR_RBL_STGDB";
  GRANT DEBUG ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "RBL_BI_RBL_STGDB";
  GRANT DEBUG ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "BSG_READ_RBL_STGDB";
  GRANT DEBUG ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "STD_FIN_RBL_STGDB";
  GRANT DEBUG ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "RBL_STGDB";
  GRANT DEBUG ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT DEBUG ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "RBL_TEMPDB";
  GRANT DEBUG ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "STG_FIN_RBL_STGDB";
  GRANT DEBUG ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "ADF_CDR_RBL_STGDB";
  GRANT FLASHBACK ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "ROLE_ALL_DB";
  GRANT FLASHBACK ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "CC_CDR_RBL_STGDB";
  GRANT FLASHBACK ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "RBL_BI_RBL_STGDB";
  GRANT FLASHBACK ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "BSG_READ_RBL_STGDB";
  GRANT FLASHBACK ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "STD_FIN_RBL_STGDB";
  GRANT FLASHBACK ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "RBL_STGDB";
  GRANT FLASHBACK ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT FLASHBACK ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "RBL_TEMPDB";
  GRANT FLASHBACK ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "STG_FIN_RBL_STGDB";
  GRANT FLASHBACK ON "CURDAT_RBL_MISDB_PROD"."ADVACBASICDETAIL_FEB2024" TO "ADF_CDR_RBL_STGDB";
