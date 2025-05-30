--------------------------------------------------------
--  DDL for Table ADVACBALANCEDETAIL_BACKUP
--------------------------------------------------------

  CREATE TABLE "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" 
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
	"DFVAMT" NUMBER(18,2), 
	"INTERESTRECEIVABLE" NUMBER(18,2), 
	"OVERDUEPRINCIPALDT" VARCHAR2(200 CHAR), 
	"OVERDUEINTDT" VARCHAR2(200 CHAR), 
	"OVEROTHERDUE" NUMBER(18,2), 
	"OVERDUEOTHERDT" VARCHAR2(200 CHAR), 
	"SOURCEASSETCLASS" VARCHAR2(100 CHAR), 
	"SOURCENPADATE" VARCHAR2(200 CHAR)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
  GRANT ALTER ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT ALTER ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "PREMOC_RBL_MISDB_PROD";
  GRANT ALTER ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "QPI_RBL_MISDB_PROD";
  GRANT ALTER ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "ALERT_RBL_MISDB_PROD";
  GRANT ALTER ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "DWH_RBL_MISDB_PROD";
  GRANT ALTER ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "MAIN_PRO";
  GRANT ALTER ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT ALTER ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "BS_RBL_MISDB_PROD";
  GRANT ALTER ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "ACL_RBL_MISDB_PROD";
  GRANT ALTER ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT ALTER ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "RBL_MISDB_PROD";
  GRANT ALTER ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT DELETE ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT DELETE ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "PREMOC_RBL_MISDB_PROD";
  GRANT DELETE ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "QPI_RBL_MISDB_PROD";
  GRANT DELETE ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "ALERT_RBL_MISDB_PROD";
  GRANT DELETE ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "DWH_RBL_MISDB_PROD";
  GRANT DELETE ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "MAIN_PRO";
  GRANT DELETE ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT DELETE ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "BS_RBL_MISDB_PROD";
  GRANT DELETE ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "ACL_RBL_MISDB_PROD";
  GRANT DELETE ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT DELETE ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "RBL_MISDB_PROD";
  GRANT DELETE ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT INDEX ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "PREMOC_RBL_MISDB_PROD";
  GRANT INDEX ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "QPI_RBL_MISDB_PROD";
  GRANT INDEX ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "ALERT_RBL_MISDB_PROD";
  GRANT INDEX ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "DWH_RBL_MISDB_PROD";
  GRANT INDEX ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "MAIN_PRO";
  GRANT INDEX ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT INDEX ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "BS_RBL_MISDB_PROD";
  GRANT INDEX ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "ACL_RBL_MISDB_PROD";
  GRANT INDEX ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT INDEX ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "RBL_MISDB_PROD";
  GRANT INDEX ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT INSERT ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT INSERT ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "PREMOC_RBL_MISDB_PROD";
  GRANT INSERT ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "QPI_RBL_MISDB_PROD";
  GRANT INSERT ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "ALERT_RBL_MISDB_PROD";
  GRANT INSERT ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "DWH_RBL_MISDB_PROD";
  GRANT INSERT ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "MAIN_PRO";
  GRANT INSERT ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT INSERT ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "BS_RBL_MISDB_PROD";
  GRANT INSERT ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "ACL_RBL_MISDB_PROD";
  GRANT INSERT ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT INSERT ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "RBL_MISDB_PROD";
  GRANT INSERT ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT SELECT ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT SELECT ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "PREMOC_RBL_MISDB_PROD";
  GRANT SELECT ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "QPI_RBL_MISDB_PROD";
  GRANT SELECT ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "ALERT_RBL_MISDB_PROD";
  GRANT SELECT ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "DWH_RBL_MISDB_PROD";
  GRANT SELECT ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "MAIN_PRO";
  GRANT SELECT ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT SELECT ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "BS_RBL_MISDB_PROD";
  GRANT SELECT ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "ACL_RBL_MISDB_PROD";
  GRANT SELECT ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT SELECT ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "RBL_MISDB_PROD";
  GRANT SELECT ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT UPDATE ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT UPDATE ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "PREMOC_RBL_MISDB_PROD";
  GRANT UPDATE ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "QPI_RBL_MISDB_PROD";
  GRANT UPDATE ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "ALERT_RBL_MISDB_PROD";
  GRANT UPDATE ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "DWH_RBL_MISDB_PROD";
  GRANT UPDATE ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "MAIN_PRO";
  GRANT UPDATE ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT UPDATE ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "BS_RBL_MISDB_PROD";
  GRANT UPDATE ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "ACL_RBL_MISDB_PROD";
  GRANT UPDATE ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT UPDATE ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "RBL_MISDB_PROD";
  GRANT UPDATE ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT REFERENCES ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "PREMOC_RBL_MISDB_PROD";
  GRANT REFERENCES ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "QPI_RBL_MISDB_PROD";
  GRANT REFERENCES ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "ALERT_RBL_MISDB_PROD";
  GRANT REFERENCES ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "DWH_RBL_MISDB_PROD";
  GRANT REFERENCES ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "MAIN_PRO";
  GRANT REFERENCES ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT REFERENCES ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "BS_RBL_MISDB_PROD";
  GRANT REFERENCES ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "ACL_RBL_MISDB_PROD";
  GRANT REFERENCES ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT REFERENCES ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "RBL_MISDB_PROD";
  GRANT REFERENCES ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT READ ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT READ ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "PREMOC_RBL_MISDB_PROD";
  GRANT READ ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "QPI_RBL_MISDB_PROD";
  GRANT READ ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "ALERT_RBL_MISDB_PROD";
  GRANT READ ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "DWH_RBL_MISDB_PROD";
  GRANT READ ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "MAIN_PRO";
  GRANT READ ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT READ ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "BS_RBL_MISDB_PROD";
  GRANT READ ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "ACL_RBL_MISDB_PROD";
  GRANT READ ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT READ ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "RBL_MISDB_PROD";
  GRANT READ ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT ON COMMIT REFRESH ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "PREMOC_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "QPI_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "ALERT_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "DWH_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "MAIN_PRO";
  GRANT ON COMMIT REFRESH ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "BS_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "ACL_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT QUERY REWRITE ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "PREMOC_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "QPI_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "ALERT_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "DWH_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "MAIN_PRO";
  GRANT QUERY REWRITE ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "BS_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "ACL_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT DEBUG ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT DEBUG ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "PREMOC_RBL_MISDB_PROD";
  GRANT DEBUG ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "QPI_RBL_MISDB_PROD";
  GRANT DEBUG ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "ALERT_RBL_MISDB_PROD";
  GRANT DEBUG ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "DWH_RBL_MISDB_PROD";
  GRANT DEBUG ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "MAIN_PRO";
  GRANT DEBUG ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT DEBUG ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "BS_RBL_MISDB_PROD";
  GRANT DEBUG ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "ACL_RBL_MISDB_PROD";
  GRANT DEBUG ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT DEBUG ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "RBL_MISDB_PROD";
  GRANT DEBUG ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT FLASHBACK ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "PREMOC_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "QPI_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "ALERT_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "DWH_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "MAIN_PRO";
  GRANT FLASHBACK ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "BS_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "ACL_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "RBL_MISDB_PROD";
  GRANT FLASHBACK ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT ALTER ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "ROLE_ALL_DB";
  GRANT ALTER ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "CC_CDR_RBL_STGDB";
  GRANT ALTER ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "RBL_BI_RBL_STGDB";
  GRANT ALTER ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "BSG_READ_RBL_STGDB";
  GRANT ALTER ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "STD_FIN_RBL_STGDB";
  GRANT ALTER ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "RBL_STGDB";
  GRANT ALTER ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT ALTER ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "RBL_TEMPDB";
  GRANT ALTER ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "STG_FIN_RBL_STGDB";
  GRANT ALTER ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "ADF_CDR_RBL_STGDB";
  GRANT DELETE ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "ROLE_ALL_DB";
  GRANT DELETE ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "CC_CDR_RBL_STGDB";
  GRANT DELETE ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "RBL_BI_RBL_STGDB";
  GRANT DELETE ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "BSG_READ_RBL_STGDB";
  GRANT DELETE ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "STD_FIN_RBL_STGDB";
  GRANT DELETE ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "RBL_STGDB";
  GRANT DELETE ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT DELETE ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "RBL_TEMPDB";
  GRANT DELETE ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "STG_FIN_RBL_STGDB";
  GRANT DELETE ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "ADF_CDR_RBL_STGDB";
  GRANT INDEX ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "CC_CDR_RBL_STGDB";
  GRANT INDEX ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "RBL_BI_RBL_STGDB";
  GRANT INDEX ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "BSG_READ_RBL_STGDB";
  GRANT INDEX ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "STD_FIN_RBL_STGDB";
  GRANT INDEX ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "RBL_STGDB";
  GRANT INDEX ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT INDEX ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "RBL_TEMPDB";
  GRANT INDEX ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "STG_FIN_RBL_STGDB";
  GRANT INDEX ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "ADF_CDR_RBL_STGDB";
  GRANT INSERT ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "ROLE_ALL_DB";
  GRANT INSERT ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "CC_CDR_RBL_STGDB";
  GRANT INSERT ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "RBL_BI_RBL_STGDB";
  GRANT INSERT ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "BSG_READ_RBL_STGDB";
  GRANT INSERT ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "STD_FIN_RBL_STGDB";
  GRANT INSERT ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "RBL_STGDB";
  GRANT INSERT ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT INSERT ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "RBL_TEMPDB";
  GRANT INSERT ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "STG_FIN_RBL_STGDB";
  GRANT INSERT ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "ADF_CDR_RBL_STGDB";
  GRANT SELECT ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "ROLE_ALL_DB";
  GRANT SELECT ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "CC_CDR_RBL_STGDB";
  GRANT SELECT ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "RBL_BI_RBL_STGDB";
  GRANT SELECT ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "BSG_READ_RBL_STGDB";
  GRANT SELECT ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "STD_FIN_RBL_STGDB";
  GRANT SELECT ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "RBL_STGDB";
  GRANT SELECT ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT SELECT ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "RBL_TEMPDB";
  GRANT SELECT ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "STG_FIN_RBL_STGDB";
  GRANT SELECT ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "ADF_CDR_RBL_STGDB";
  GRANT UPDATE ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "ROLE_ALL_DB";
  GRANT UPDATE ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "CC_CDR_RBL_STGDB";
  GRANT UPDATE ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "RBL_BI_RBL_STGDB";
  GRANT UPDATE ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "BSG_READ_RBL_STGDB";
  GRANT UPDATE ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "STD_FIN_RBL_STGDB";
  GRANT UPDATE ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "RBL_STGDB";
  GRANT UPDATE ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT UPDATE ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "RBL_TEMPDB";
  GRANT UPDATE ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "STG_FIN_RBL_STGDB";
  GRANT UPDATE ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "ADF_CDR_RBL_STGDB";
  GRANT REFERENCES ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "CC_CDR_RBL_STGDB";
  GRANT REFERENCES ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "RBL_BI_RBL_STGDB";
  GRANT REFERENCES ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "BSG_READ_RBL_STGDB";
  GRANT REFERENCES ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "STD_FIN_RBL_STGDB";
  GRANT REFERENCES ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "RBL_STGDB";
  GRANT REFERENCES ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT REFERENCES ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "RBL_TEMPDB";
  GRANT REFERENCES ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "STG_FIN_RBL_STGDB";
  GRANT REFERENCES ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "ADF_CDR_RBL_STGDB";
  GRANT READ ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "ROLE_ALL_DB";
  GRANT READ ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "CC_CDR_RBL_STGDB";
  GRANT READ ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "RBL_BI_RBL_STGDB";
  GRANT READ ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "BSG_READ_RBL_STGDB";
  GRANT READ ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "STD_FIN_RBL_STGDB";
  GRANT READ ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "RBL_STGDB";
  GRANT READ ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT READ ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "RBL_TEMPDB";
  GRANT READ ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "STG_FIN_RBL_STGDB";
  GRANT READ ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "ADF_CDR_RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "ROLE_ALL_DB";
  GRANT ON COMMIT REFRESH ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "CC_CDR_RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "RBL_BI_RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "BSG_READ_RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "STD_FIN_RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT ON COMMIT REFRESH ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "RBL_TEMPDB";
  GRANT ON COMMIT REFRESH ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "STG_FIN_RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "ADF_CDR_RBL_STGDB";
  GRANT QUERY REWRITE ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "ROLE_ALL_DB";
  GRANT QUERY REWRITE ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "CC_CDR_RBL_STGDB";
  GRANT QUERY REWRITE ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "RBL_BI_RBL_STGDB";
  GRANT QUERY REWRITE ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "BSG_READ_RBL_STGDB";
  GRANT QUERY REWRITE ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "STD_FIN_RBL_STGDB";
  GRANT QUERY REWRITE ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "RBL_STGDB";
  GRANT QUERY REWRITE ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT QUERY REWRITE ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "RBL_TEMPDB";
  GRANT QUERY REWRITE ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "STG_FIN_RBL_STGDB";
  GRANT QUERY REWRITE ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "ADF_CDR_RBL_STGDB";
  GRANT DEBUG ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "ROLE_ALL_DB";
  GRANT DEBUG ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "CC_CDR_RBL_STGDB";
  GRANT DEBUG ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "RBL_BI_RBL_STGDB";
  GRANT DEBUG ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "BSG_READ_RBL_STGDB";
  GRANT DEBUG ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "STD_FIN_RBL_STGDB";
  GRANT DEBUG ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "RBL_STGDB";
  GRANT DEBUG ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT DEBUG ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "RBL_TEMPDB";
  GRANT DEBUG ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "STG_FIN_RBL_STGDB";
  GRANT DEBUG ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "ADF_CDR_RBL_STGDB";
  GRANT FLASHBACK ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "ROLE_ALL_DB";
  GRANT FLASHBACK ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "CC_CDR_RBL_STGDB";
  GRANT FLASHBACK ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "RBL_BI_RBL_STGDB";
  GRANT FLASHBACK ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "BSG_READ_RBL_STGDB";
  GRANT FLASHBACK ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "STD_FIN_RBL_STGDB";
  GRANT FLASHBACK ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "RBL_STGDB";
  GRANT FLASHBACK ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT FLASHBACK ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "RBL_TEMPDB";
  GRANT FLASHBACK ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "STG_FIN_RBL_STGDB";
  GRANT FLASHBACK ON "CURDAT_RBL_MISDB_PROD"."ADVACBALANCEDETAIL_BACKUP" TO "ADF_CDR_RBL_STGDB";
