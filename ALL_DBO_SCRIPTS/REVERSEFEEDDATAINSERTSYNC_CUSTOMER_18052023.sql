--------------------------------------------------------
--  DDL for Table REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023
--------------------------------------------------------

  CREATE TABLE "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" 
   (	"ENTITYKEY" NUMBER(10,0) GENERATED BY DEFAULT ON NULL AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE , 
	"PROCESSDATE" VARCHAR2(200 CHAR), 
	"RUNDATE" VARCHAR2(200 CHAR), 
	"SOURCENAME" VARCHAR2(50 CHAR), 
	"CUSTOMERID" VARCHAR2(30 CHAR), 
	"FINALASSETCLASSALT_KEY" NUMBER(10,0), 
	"FINALNPADT" VARCHAR2(200 CHAR), 
	"UPGRADEDATE" VARCHAR2(200 CHAR)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
  GRANT ALTER ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT ALTER ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "PREMOC_RBL_MISDB_PROD";
  GRANT ALTER ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "QPI_RBL_MISDB_PROD";
  GRANT ALTER ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "ALERT_RBL_MISDB_PROD";
  GRANT ALTER ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "DWH_RBL_MISDB_PROD";
  GRANT ALTER ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "MAIN_PRO";
  GRANT ALTER ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT ALTER ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "CURDAT_RBL_MISDB_PROD";
  GRANT ALTER ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "BS_RBL_MISDB_PROD";
  GRANT ALTER ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "ACL_RBL_MISDB_PROD";
  GRANT ALTER ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT ALTER ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT DELETE ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT DELETE ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "PREMOC_RBL_MISDB_PROD";
  GRANT DELETE ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "QPI_RBL_MISDB_PROD";
  GRANT DELETE ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "ALERT_RBL_MISDB_PROD";
  GRANT DELETE ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "DWH_RBL_MISDB_PROD";
  GRANT DELETE ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "MAIN_PRO";
  GRANT DELETE ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT DELETE ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "CURDAT_RBL_MISDB_PROD";
  GRANT DELETE ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "BS_RBL_MISDB_PROD";
  GRANT DELETE ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "ACL_RBL_MISDB_PROD";
  GRANT DELETE ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT DELETE ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT INDEX ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "PREMOC_RBL_MISDB_PROD";
  GRANT INDEX ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "QPI_RBL_MISDB_PROD";
  GRANT INDEX ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "ALERT_RBL_MISDB_PROD";
  GRANT INDEX ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "DWH_RBL_MISDB_PROD";
  GRANT INDEX ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "MAIN_PRO";
  GRANT INDEX ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT INDEX ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "CURDAT_RBL_MISDB_PROD";
  GRANT INDEX ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "BS_RBL_MISDB_PROD";
  GRANT INDEX ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "ACL_RBL_MISDB_PROD";
  GRANT INDEX ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT INDEX ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT INSERT ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT INSERT ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "PREMOC_RBL_MISDB_PROD";
  GRANT INSERT ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "QPI_RBL_MISDB_PROD";
  GRANT INSERT ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "ALERT_RBL_MISDB_PROD";
  GRANT INSERT ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "DWH_RBL_MISDB_PROD";
  GRANT INSERT ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "MAIN_PRO";
  GRANT INSERT ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT INSERT ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "CURDAT_RBL_MISDB_PROD";
  GRANT INSERT ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "BS_RBL_MISDB_PROD";
  GRANT INSERT ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "ACL_RBL_MISDB_PROD";
  GRANT INSERT ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT INSERT ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT SELECT ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT SELECT ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "PREMOC_RBL_MISDB_PROD";
  GRANT SELECT ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "QPI_RBL_MISDB_PROD";
  GRANT SELECT ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "ALERT_RBL_MISDB_PROD";
  GRANT SELECT ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "DWH_RBL_MISDB_PROD";
  GRANT SELECT ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "MAIN_PRO";
  GRANT SELECT ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT SELECT ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "CURDAT_RBL_MISDB_PROD";
  GRANT SELECT ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "BS_RBL_MISDB_PROD";
  GRANT SELECT ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "ACL_RBL_MISDB_PROD";
  GRANT SELECT ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT SELECT ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT UPDATE ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT UPDATE ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "PREMOC_RBL_MISDB_PROD";
  GRANT UPDATE ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "QPI_RBL_MISDB_PROD";
  GRANT UPDATE ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "ALERT_RBL_MISDB_PROD";
  GRANT UPDATE ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "DWH_RBL_MISDB_PROD";
  GRANT UPDATE ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "MAIN_PRO";
  GRANT UPDATE ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT UPDATE ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "CURDAT_RBL_MISDB_PROD";
  GRANT UPDATE ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "BS_RBL_MISDB_PROD";
  GRANT UPDATE ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "ACL_RBL_MISDB_PROD";
  GRANT UPDATE ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT UPDATE ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "PREMOC_RBL_MISDB_PROD";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "QPI_RBL_MISDB_PROD";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "ALERT_RBL_MISDB_PROD";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "DWH_RBL_MISDB_PROD";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "MAIN_PRO";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "CURDAT_RBL_MISDB_PROD";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "BS_RBL_MISDB_PROD";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "ACL_RBL_MISDB_PROD";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT READ ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT READ ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "PREMOC_RBL_MISDB_PROD";
  GRANT READ ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "QPI_RBL_MISDB_PROD";
  GRANT READ ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "ALERT_RBL_MISDB_PROD";
  GRANT READ ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "DWH_RBL_MISDB_PROD";
  GRANT READ ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "MAIN_PRO";
  GRANT READ ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT READ ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "CURDAT_RBL_MISDB_PROD";
  GRANT READ ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "BS_RBL_MISDB_PROD";
  GRANT READ ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "ACL_RBL_MISDB_PROD";
  GRANT READ ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT READ ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "PREMOC_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "QPI_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "ALERT_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "DWH_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "MAIN_PRO";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "CURDAT_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "BS_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "ACL_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "PREMOC_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "QPI_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "ALERT_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "DWH_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "MAIN_PRO";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "CURDAT_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "BS_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "ACL_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT DEBUG ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "PREMOC_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "QPI_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "ALERT_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "DWH_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "MAIN_PRO";
  GRANT DEBUG ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "CURDAT_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "BS_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "ACL_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "PREMOC_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "QPI_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "ALERT_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "DWH_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "MAIN_PRO";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "CURDAT_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "BS_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "ACL_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT ALTER ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "ROLE_ALL_DB";
  GRANT ALTER ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "CC_CDR_RBL_STGDB";
  GRANT ALTER ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "RBL_BI_RBL_STGDB";
  GRANT ALTER ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "BSG_READ_RBL_STGDB";
  GRANT ALTER ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "STD_FIN_RBL_STGDB";
  GRANT ALTER ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "RBL_STGDB";
  GRANT ALTER ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT ALTER ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "RBL_TEMPDB";
  GRANT ALTER ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "STG_FIN_RBL_STGDB";
  GRANT ALTER ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "ADF_CDR_RBL_STGDB";
  GRANT DELETE ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "ROLE_ALL_DB";
  GRANT DELETE ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "CC_CDR_RBL_STGDB";
  GRANT DELETE ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "RBL_BI_RBL_STGDB";
  GRANT DELETE ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "BSG_READ_RBL_STGDB";
  GRANT DELETE ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "STD_FIN_RBL_STGDB";
  GRANT DELETE ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "RBL_STGDB";
  GRANT DELETE ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT DELETE ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "RBL_TEMPDB";
  GRANT DELETE ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "STG_FIN_RBL_STGDB";
  GRANT DELETE ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "ADF_CDR_RBL_STGDB";
  GRANT INDEX ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "CC_CDR_RBL_STGDB";
  GRANT INDEX ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "RBL_BI_RBL_STGDB";
  GRANT INDEX ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "BSG_READ_RBL_STGDB";
  GRANT INDEX ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "STD_FIN_RBL_STGDB";
  GRANT INDEX ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "RBL_STGDB";
  GRANT INDEX ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT INDEX ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "RBL_TEMPDB";
  GRANT INDEX ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "STG_FIN_RBL_STGDB";
  GRANT INDEX ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "ADF_CDR_RBL_STGDB";
  GRANT INSERT ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "ROLE_ALL_DB";
  GRANT INSERT ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "CC_CDR_RBL_STGDB";
  GRANT INSERT ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "RBL_BI_RBL_STGDB";
  GRANT INSERT ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "BSG_READ_RBL_STGDB";
  GRANT INSERT ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "STD_FIN_RBL_STGDB";
  GRANT INSERT ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "RBL_STGDB";
  GRANT INSERT ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT INSERT ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "RBL_TEMPDB";
  GRANT INSERT ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "STG_FIN_RBL_STGDB";
  GRANT INSERT ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "ADF_CDR_RBL_STGDB";
  GRANT SELECT ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "ROLE_ALL_DB";
  GRANT SELECT ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "CC_CDR_RBL_STGDB";
  GRANT SELECT ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "RBL_BI_RBL_STGDB";
  GRANT SELECT ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "BSG_READ_RBL_STGDB";
  GRANT SELECT ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "STD_FIN_RBL_STGDB";
  GRANT SELECT ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "RBL_STGDB";
  GRANT SELECT ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT SELECT ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "RBL_TEMPDB";
  GRANT SELECT ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "STG_FIN_RBL_STGDB";
  GRANT SELECT ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "ADF_CDR_RBL_STGDB";
  GRANT UPDATE ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "ROLE_ALL_DB";
  GRANT UPDATE ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "CC_CDR_RBL_STGDB";
  GRANT UPDATE ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "RBL_BI_RBL_STGDB";
  GRANT UPDATE ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "BSG_READ_RBL_STGDB";
  GRANT UPDATE ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "STD_FIN_RBL_STGDB";
  GRANT UPDATE ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "RBL_STGDB";
  GRANT UPDATE ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT UPDATE ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "RBL_TEMPDB";
  GRANT UPDATE ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "STG_FIN_RBL_STGDB";
  GRANT UPDATE ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "ADF_CDR_RBL_STGDB";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "CC_CDR_RBL_STGDB";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "RBL_BI_RBL_STGDB";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "BSG_READ_RBL_STGDB";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "STD_FIN_RBL_STGDB";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "RBL_STGDB";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "RBL_TEMPDB";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "STG_FIN_RBL_STGDB";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "ADF_CDR_RBL_STGDB";
  GRANT READ ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "ROLE_ALL_DB";
  GRANT READ ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "CC_CDR_RBL_STGDB";
  GRANT READ ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "RBL_BI_RBL_STGDB";
  GRANT READ ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "BSG_READ_RBL_STGDB";
  GRANT READ ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "STD_FIN_RBL_STGDB";
  GRANT READ ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "RBL_STGDB";
  GRANT READ ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT READ ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "RBL_TEMPDB";
  GRANT READ ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "STG_FIN_RBL_STGDB";
  GRANT READ ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "ADF_CDR_RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "ROLE_ALL_DB";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "CC_CDR_RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "RBL_BI_RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "BSG_READ_RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "STD_FIN_RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "RBL_TEMPDB";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "STG_FIN_RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "ADF_CDR_RBL_STGDB";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "ROLE_ALL_DB";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "CC_CDR_RBL_STGDB";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "RBL_BI_RBL_STGDB";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "BSG_READ_RBL_STGDB";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "STD_FIN_RBL_STGDB";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "RBL_STGDB";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "RBL_TEMPDB";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "STG_FIN_RBL_STGDB";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "ADF_CDR_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "ROLE_ALL_DB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "CC_CDR_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "RBL_BI_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "BSG_READ_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "STD_FIN_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "RBL_TEMPDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "STG_FIN_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "ADF_CDR_RBL_STGDB";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "ROLE_ALL_DB";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "CC_CDR_RBL_STGDB";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "RBL_BI_RBL_STGDB";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "BSG_READ_RBL_STGDB";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "STD_FIN_RBL_STGDB";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "RBL_STGDB";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "RBL_TEMPDB";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "STG_FIN_RBL_STGDB";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."REVERSEFEEDDATAINSERTSYNC_CUSTOMER_18052023" TO "ADF_CDR_RBL_STGDB";
