--------------------------------------------------------
--  DDL for Table ADVCUSTOTHERDETAIL
--------------------------------------------------------

  CREATE TABLE "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" 
   (	"ENTITYKEY" NUMBER(10,0) GENERATED BY DEFAULT ON NULL AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE , 
	"CUSTOMERENTITYID" NUMBER(10,0), 
	"ORGCOSTOFEQUIP" NUMBER(16,2), 
	"ORGCOSTOFPLANTMECH" NUMBER(16,2), 
	"DEPVALPLANT" NUMBER(16,2), 
	"VALLAND" NUMBER(16,2), 
	"IECDNO" VARCHAR2(20 CHAR), 
	"GROUPALT_KEY" NUMBER(5,0), 
	"CUSTOMERSWIFTCODE" VARCHAR2(20 CHAR), 
	"SPLCATG1ALT_KEY" NUMBER(5,0), 
	"SPLCATG2ALT_KEY" NUMBER(5,0), 
	"SPLCATG3ALT_KEY" NUMBER(5,0), 
	"SPLCATG4ALT_KEY" NUMBER(5,0), 
	"CMAELIGIBLE" VARCHAR2(1 CHAR), 
	"PFNO" VARCHAR2(10 CHAR), 
	"SUPPERANNUATIONBENEFIT" NUMBER(16,2), 
	"SUPPERANNUATIONBENEFITVALUATIONDT" DATE, 
	"BUSINESSCOMMENCEDT" DATE, 
	"CANCELOBTAINED" VARCHAR2(1 CHAR), 
	"TOTCONSORTIUMLIMITFUNDED" NUMBER(16,2), 
	"TOTCONSORTIUMLIMITNONFUNDED" NUMBER(16,2), 
	"UPGRADATIONDATE" DATE, 
	"CUSTOMEREXPIREDYN" CHAR(1 CHAR), 
	"TOTWCLIMITFUNDED" NUMBER(16,2), 
	"FLAGGED_SUBSECTOR" VARCHAR2(1 CHAR), 
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
	"D2KTIMESTAMP" RAW(50), 
	"MOCSTATUS" CHAR(1 CHAR), 
	"MOCDATE" DATE, 
	"MOCTYPEALT_KEY" NUMBER(10,0), 
	"ANNUALEXPORTTURNOVER" NUMBER(16,2), 
	"FMCNUMBER" VARCHAR2(20 CHAR), 
	"ISEMPLOYEE" CHAR(1 CHAR), 
	"ISPETITIONER" CHAR(1 CHAR), 
	"UNDERLITIGATION" CHAR(1 CHAR), 
	"PERMINATUREID" VARCHAR2(50 CHAR), 
	"BORRUNITFUNCT" VARCHAR2(50 CHAR), 
	"DTOFCLOSURE" VARCHAR2(200 CHAR), 
	"NONCOOPBORROWER" VARCHAR2(2 CHAR), 
	"ARBIAGREEMENT" VARCHAR2(2 CHAR), 
	"TRANSTHROUGHUS" VARCHAR2(2 CHAR), 
	"CUTBACKARRANGEMENT" VARCHAR2(2 CHAR), 
	"BANKINGARRANGEMENT" VARCHAR2(2 CHAR), 
	"MEMBERBANKSNO" NUMBER(5,0), 
	"TOTALCONSORTIUMAMT" NUMBER(16,2), 
	"ROC_CFCREPORTDATE" VARCHAR2(200 CHAR), 
	"ROC_CHARGEFV" VARCHAR2(2 CHAR), 
	"ROC_CHARGEFVDT" VARCHAR2(200 CHAR), 
	"ROC_CHARGEREMARK" VARCHAR2(1000 CHAR), 
	"ROC_SECURITIES" VARCHAR2(1000 CHAR), 
	"ROC_COVER" VARCHAR2(2 CHAR), 
	"ROC_COVEREDDT" DATE, 
	"CHARGEFILEDWITH" VARCHAR2(2 CHAR), 
	"FILEDDT" VARCHAR2(200 CHAR), 
	"EMPLOYEEID" VARCHAR2(50 CHAR), 
	"EMPLOYEETYPE" VARCHAR2(50 CHAR), 
	"DESIGNATION" NVARCHAR2(50), 
	"PLACEOFPOSTING" NVARCHAR2(50), 
	"LPERSONALCONDATE" VARCHAR2(200 CHAR), 
	"LPERSONALCONDTLS" VARCHAR2(1000 CHAR), 
	"RECALLNOTICEDATE" VARCHAR2(200 CHAR), 
	"RECALLNOTICEMODEID" VARCHAR2(50 CHAR), 
	"LEGALAUDITDATE" VARCHAR2(200 CHAR), 
	"IRREGULARITYPENDING" VARCHAR2(2 CHAR), 
	"IRREGULARITYRECTIDATE" VARCHAR2(200 CHAR), 
	"FRAUDACCOSTATUS" CHAR(1 CHAR), 
	"PRESARFAESINOTICEDT" DATE, 
	"FMRNO" VARCHAR2(50 CHAR), 
	"FMRDATE" DATE, 
	"GRADESCALEALT_KEY" NUMBER(5,0), 
	"FRAUDNATUREREMARK" VARCHAR2(1000 CHAR), 
	"ROCCOVEREDCERTIFICATEREMARK" VARCHAR2(1000 CHAR), 
	"REASONSNONCOOPERATIVEBORROWER" VARCHAR2(500 CHAR), 
	"STATUSNONCOOPERATIVEBORROWER" VARCHAR2(500 CHAR)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
  GRANT ALTER ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT ALTER ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "QPI_RBL_MISDB_PROD";
  GRANT ALTER ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "ALERT_RBL_MISDB_PROD";
  GRANT ALTER ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "DWH_RBL_MISDB_PROD";
  GRANT ALTER ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "MAIN_PRO";
  GRANT ALTER ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT ALTER ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "CURDAT_RBL_MISDB_PROD";
  GRANT ALTER ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "BS_RBL_MISDB_PROD";
  GRANT ALTER ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "ACL_RBL_MISDB_PROD";
  GRANT ALTER ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT ALTER ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "RBL_MISDB_PROD";
  GRANT ALTER ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT DELETE ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT DELETE ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "QPI_RBL_MISDB_PROD";
  GRANT DELETE ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "ALERT_RBL_MISDB_PROD";
  GRANT DELETE ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "DWH_RBL_MISDB_PROD";
  GRANT DELETE ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "MAIN_PRO";
  GRANT DELETE ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT DELETE ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "CURDAT_RBL_MISDB_PROD";
  GRANT DELETE ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "BS_RBL_MISDB_PROD";
  GRANT DELETE ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "ACL_RBL_MISDB_PROD";
  GRANT DELETE ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT DELETE ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "RBL_MISDB_PROD";
  GRANT DELETE ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT INDEX ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "QPI_RBL_MISDB_PROD";
  GRANT INDEX ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "ALERT_RBL_MISDB_PROD";
  GRANT INDEX ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "DWH_RBL_MISDB_PROD";
  GRANT INDEX ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "MAIN_PRO";
  GRANT INDEX ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT INDEX ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "CURDAT_RBL_MISDB_PROD";
  GRANT INDEX ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "BS_RBL_MISDB_PROD";
  GRANT INDEX ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "ACL_RBL_MISDB_PROD";
  GRANT INDEX ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT INDEX ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "RBL_MISDB_PROD";
  GRANT INDEX ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT INSERT ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT INSERT ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "QPI_RBL_MISDB_PROD";
  GRANT INSERT ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "ALERT_RBL_MISDB_PROD";
  GRANT INSERT ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "DWH_RBL_MISDB_PROD";
  GRANT INSERT ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "MAIN_PRO";
  GRANT INSERT ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT INSERT ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "CURDAT_RBL_MISDB_PROD";
  GRANT INSERT ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "BS_RBL_MISDB_PROD";
  GRANT INSERT ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "ACL_RBL_MISDB_PROD";
  GRANT INSERT ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT INSERT ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "RBL_MISDB_PROD";
  GRANT INSERT ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT SELECT ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT SELECT ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "QPI_RBL_MISDB_PROD";
  GRANT SELECT ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "ALERT_RBL_MISDB_PROD";
  GRANT SELECT ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "DWH_RBL_MISDB_PROD";
  GRANT SELECT ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "MAIN_PRO";
  GRANT SELECT ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT SELECT ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "CURDAT_RBL_MISDB_PROD";
  GRANT SELECT ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "BS_RBL_MISDB_PROD";
  GRANT SELECT ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "ACL_RBL_MISDB_PROD";
  GRANT SELECT ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT SELECT ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "RBL_MISDB_PROD";
  GRANT SELECT ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT UPDATE ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT UPDATE ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "QPI_RBL_MISDB_PROD";
  GRANT UPDATE ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "ALERT_RBL_MISDB_PROD";
  GRANT UPDATE ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "DWH_RBL_MISDB_PROD";
  GRANT UPDATE ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "MAIN_PRO";
  GRANT UPDATE ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT UPDATE ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "CURDAT_RBL_MISDB_PROD";
  GRANT UPDATE ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "BS_RBL_MISDB_PROD";
  GRANT UPDATE ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "ACL_RBL_MISDB_PROD";
  GRANT UPDATE ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT UPDATE ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "RBL_MISDB_PROD";
  GRANT UPDATE ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT REFERENCES ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "QPI_RBL_MISDB_PROD";
  GRANT REFERENCES ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "ALERT_RBL_MISDB_PROD";
  GRANT REFERENCES ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "DWH_RBL_MISDB_PROD";
  GRANT REFERENCES ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "MAIN_PRO";
  GRANT REFERENCES ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT REFERENCES ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "CURDAT_RBL_MISDB_PROD";
  GRANT REFERENCES ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "BS_RBL_MISDB_PROD";
  GRANT REFERENCES ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "ACL_RBL_MISDB_PROD";
  GRANT REFERENCES ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT REFERENCES ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "RBL_MISDB_PROD";
  GRANT REFERENCES ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT READ ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT READ ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "QPI_RBL_MISDB_PROD";
  GRANT READ ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "ALERT_RBL_MISDB_PROD";
  GRANT READ ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "DWH_RBL_MISDB_PROD";
  GRANT READ ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "MAIN_PRO";
  GRANT READ ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT READ ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "CURDAT_RBL_MISDB_PROD";
  GRANT READ ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "BS_RBL_MISDB_PROD";
  GRANT READ ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "ACL_RBL_MISDB_PROD";
  GRANT READ ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT READ ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "RBL_MISDB_PROD";
  GRANT READ ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT ON COMMIT REFRESH ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "QPI_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "ALERT_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "DWH_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "MAIN_PRO";
  GRANT ON COMMIT REFRESH ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "CURDAT_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "BS_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "ACL_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT QUERY REWRITE ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "QPI_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "ALERT_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "DWH_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "MAIN_PRO";
  GRANT QUERY REWRITE ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "CURDAT_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "BS_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "ACL_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT DEBUG ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT DEBUG ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "QPI_RBL_MISDB_PROD";
  GRANT DEBUG ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "ALERT_RBL_MISDB_PROD";
  GRANT DEBUG ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "DWH_RBL_MISDB_PROD";
  GRANT DEBUG ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "MAIN_PRO";
  GRANT DEBUG ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT DEBUG ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "CURDAT_RBL_MISDB_PROD";
  GRANT DEBUG ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "BS_RBL_MISDB_PROD";
  GRANT DEBUG ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "ACL_RBL_MISDB_PROD";
  GRANT DEBUG ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT DEBUG ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "RBL_MISDB_PROD";
  GRANT DEBUG ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT FLASHBACK ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "QPI_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "ALERT_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "DWH_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "MAIN_PRO";
  GRANT FLASHBACK ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "CURDAT_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "BS_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "ACL_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "RBL_MISDB_PROD";
  GRANT FLASHBACK ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT ALTER ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "ROLE_ALL_DB";
  GRANT ALTER ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "CC_CDR_RBL_STGDB";
  GRANT ALTER ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "RBL_BI_RBL_STGDB";
  GRANT ALTER ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "BSG_READ_RBL_STGDB";
  GRANT ALTER ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "STD_FIN_RBL_STGDB";
  GRANT ALTER ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "RBL_STGDB";
  GRANT ALTER ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT ALTER ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "RBL_TEMPDB";
  GRANT ALTER ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "STG_FIN_RBL_STGDB";
  GRANT ALTER ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "ADF_CDR_RBL_STGDB";
  GRANT DELETE ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "ROLE_ALL_DB";
  GRANT DELETE ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "CC_CDR_RBL_STGDB";
  GRANT DELETE ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "RBL_BI_RBL_STGDB";
  GRANT DELETE ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "BSG_READ_RBL_STGDB";
  GRANT DELETE ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "STD_FIN_RBL_STGDB";
  GRANT DELETE ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "RBL_STGDB";
  GRANT DELETE ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT DELETE ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "RBL_TEMPDB";
  GRANT DELETE ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "STG_FIN_RBL_STGDB";
  GRANT DELETE ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "ADF_CDR_RBL_STGDB";
  GRANT INDEX ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "CC_CDR_RBL_STGDB";
  GRANT INDEX ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "RBL_BI_RBL_STGDB";
  GRANT INDEX ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "BSG_READ_RBL_STGDB";
  GRANT INDEX ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "STD_FIN_RBL_STGDB";
  GRANT INDEX ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "RBL_STGDB";
  GRANT INDEX ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT INDEX ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "RBL_TEMPDB";
  GRANT INDEX ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "STG_FIN_RBL_STGDB";
  GRANT INDEX ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "ADF_CDR_RBL_STGDB";
  GRANT INSERT ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "ROLE_ALL_DB";
  GRANT INSERT ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "CC_CDR_RBL_STGDB";
  GRANT INSERT ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "RBL_BI_RBL_STGDB";
  GRANT INSERT ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "BSG_READ_RBL_STGDB";
  GRANT INSERT ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "STD_FIN_RBL_STGDB";
  GRANT INSERT ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "RBL_STGDB";
  GRANT INSERT ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT INSERT ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "RBL_TEMPDB";
  GRANT INSERT ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "STG_FIN_RBL_STGDB";
  GRANT INSERT ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "ADF_CDR_RBL_STGDB";
  GRANT SELECT ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "ROLE_ALL_DB";
  GRANT SELECT ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "CC_CDR_RBL_STGDB";
  GRANT SELECT ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "RBL_BI_RBL_STGDB";
  GRANT SELECT ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "BSG_READ_RBL_STGDB";
  GRANT SELECT ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "STD_FIN_RBL_STGDB";
  GRANT SELECT ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "RBL_STGDB";
  GRANT SELECT ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT SELECT ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "RBL_TEMPDB";
  GRANT SELECT ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "STG_FIN_RBL_STGDB";
  GRANT SELECT ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "ADF_CDR_RBL_STGDB";
  GRANT UPDATE ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "ROLE_ALL_DB";
  GRANT UPDATE ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "CC_CDR_RBL_STGDB";
  GRANT UPDATE ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "RBL_BI_RBL_STGDB";
  GRANT UPDATE ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "BSG_READ_RBL_STGDB";
  GRANT UPDATE ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "STD_FIN_RBL_STGDB";
  GRANT UPDATE ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "RBL_STGDB";
  GRANT UPDATE ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT UPDATE ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "RBL_TEMPDB";
  GRANT UPDATE ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "STG_FIN_RBL_STGDB";
  GRANT UPDATE ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "ADF_CDR_RBL_STGDB";
  GRANT REFERENCES ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "CC_CDR_RBL_STGDB";
  GRANT REFERENCES ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "RBL_BI_RBL_STGDB";
  GRANT REFERENCES ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "BSG_READ_RBL_STGDB";
  GRANT REFERENCES ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "STD_FIN_RBL_STGDB";
  GRANT REFERENCES ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "RBL_STGDB";
  GRANT REFERENCES ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT REFERENCES ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "RBL_TEMPDB";
  GRANT REFERENCES ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "STG_FIN_RBL_STGDB";
  GRANT REFERENCES ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "ADF_CDR_RBL_STGDB";
  GRANT READ ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "ROLE_ALL_DB";
  GRANT READ ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "CC_CDR_RBL_STGDB";
  GRANT READ ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "RBL_BI_RBL_STGDB";
  GRANT READ ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "BSG_READ_RBL_STGDB";
  GRANT READ ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "STD_FIN_RBL_STGDB";
  GRANT READ ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "RBL_STGDB";
  GRANT READ ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT READ ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "RBL_TEMPDB";
  GRANT READ ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "STG_FIN_RBL_STGDB";
  GRANT READ ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "ADF_CDR_RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "ROLE_ALL_DB";
  GRANT ON COMMIT REFRESH ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "CC_CDR_RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "RBL_BI_RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "BSG_READ_RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "STD_FIN_RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT ON COMMIT REFRESH ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "RBL_TEMPDB";
  GRANT ON COMMIT REFRESH ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "STG_FIN_RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "ADF_CDR_RBL_STGDB";
  GRANT QUERY REWRITE ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "ROLE_ALL_DB";
  GRANT QUERY REWRITE ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "CC_CDR_RBL_STGDB";
  GRANT QUERY REWRITE ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "RBL_BI_RBL_STGDB";
  GRANT QUERY REWRITE ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "BSG_READ_RBL_STGDB";
  GRANT QUERY REWRITE ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "STD_FIN_RBL_STGDB";
  GRANT QUERY REWRITE ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "RBL_STGDB";
  GRANT QUERY REWRITE ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT QUERY REWRITE ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "RBL_TEMPDB";
  GRANT QUERY REWRITE ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "STG_FIN_RBL_STGDB";
  GRANT QUERY REWRITE ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "ADF_CDR_RBL_STGDB";
  GRANT DEBUG ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "ROLE_ALL_DB";
  GRANT DEBUG ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "CC_CDR_RBL_STGDB";
  GRANT DEBUG ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "RBL_BI_RBL_STGDB";
  GRANT DEBUG ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "BSG_READ_RBL_STGDB";
  GRANT DEBUG ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "STD_FIN_RBL_STGDB";
  GRANT DEBUG ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "RBL_STGDB";
  GRANT DEBUG ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT DEBUG ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "RBL_TEMPDB";
  GRANT DEBUG ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "STG_FIN_RBL_STGDB";
  GRANT DEBUG ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "ADF_CDR_RBL_STGDB";
  GRANT FLASHBACK ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "ROLE_ALL_DB";
  GRANT FLASHBACK ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "CC_CDR_RBL_STGDB";
  GRANT FLASHBACK ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "RBL_BI_RBL_STGDB";
  GRANT FLASHBACK ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "BSG_READ_RBL_STGDB";
  GRANT FLASHBACK ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "STD_FIN_RBL_STGDB";
  GRANT FLASHBACK ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "RBL_STGDB";
  GRANT FLASHBACK ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT FLASHBACK ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "RBL_TEMPDB";
  GRANT FLASHBACK ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "STG_FIN_RBL_STGDB";
  GRANT FLASHBACK ON "PREMOC_RBL_MISDB_PROD"."ADVCUSTOTHERDETAIL" TO "ADF_CDR_RBL_STGDB";
