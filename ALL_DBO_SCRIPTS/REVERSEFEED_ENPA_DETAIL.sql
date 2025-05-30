--------------------------------------------------------
--  DDL for Table REVERSEFEED_ENPA_DETAIL
--------------------------------------------------------

  CREATE TABLE "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" 
   (	"SRNO" NUMBER(10,0), 
	"ATHEZ_D_ORG" VARCHAR2(3 CHAR), 
	"ATHEZ_D_ACCT_NBR" VARCHAR2(19 CHAR), 
	"ATHEZ_D_CARD_SEQ_NBR" VARCHAR2(4 CHAR), 
	"ATHEZ_D_FILE_CODE" VARCHAR2(2 CHAR), 
	"ATHEZ_D_FIELD_CODE" VARCHAR2(4 CHAR), 
	"ATHEZ_D_FIELD_OCCURRENCE" VARCHAR2(4 CHAR), 
	"ATHEZ_D_FIELD_LENGTH" VARCHAR2(3 CHAR), 
	"ATHEZ_D_BEFORE_DATA" VARCHAR2(60 CHAR), 
	"ATHEZ_D_AFTER_DATA" VARCHAR2(60 CHAR), 
	"ATHEZ_D_SIGNON" VARCHAR2(20 CHAR), 
	"FILLER" VARCHAR2(11 CHAR), 
	"ATHEZ_D_PLAN_NBR" VARCHAR2(5 CHAR), 
	"ATHEZ_D_REC_NBR" VARCHAR2(3 CHAR), 
	"ATHEZ_D_REC_TYPE_KEY" VARCHAR2(2 CHAR), 
	"DATEOFDATA" VARCHAR2(200 CHAR), 
	"EFFECTIVEFROMTIMEKEY" NUMBER(10,0), 
	"EFFECTIVETOTIMEKEY" NUMBER(10,0)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL"."ATHEZ_D_ORG" IS 'ORIGINAL NAME:ATHEZ-D-ORG';
   COMMENT ON COLUMN "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL"."ATHEZ_D_ACCT_NBR" IS 'ORIGINAL NAME:ATHEZ-D-ACCT-NBR';
   COMMENT ON COLUMN "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL"."ATHEZ_D_CARD_SEQ_NBR" IS 'ORIGINAL NAME:ATHEZ-D-CARD-SEQ-NBR';
   COMMENT ON COLUMN "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL"."ATHEZ_D_FILE_CODE" IS 'ORIGINAL NAME:ATHEZ-D-FILE-CODE';
   COMMENT ON COLUMN "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL"."ATHEZ_D_FIELD_CODE" IS 'ORIGINAL NAME:ATHEZ-D-FIELD-CODE';
   COMMENT ON COLUMN "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL"."ATHEZ_D_FIELD_OCCURRENCE" IS 'ORIGINAL NAME:ATHEZ-D-FIELD-OCCURRENCE';
   COMMENT ON COLUMN "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL"."ATHEZ_D_FIELD_LENGTH" IS 'ORIGINAL NAME:ATHEZ-D-FIELD-LENGTH';
   COMMENT ON COLUMN "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL"."ATHEZ_D_BEFORE_DATA" IS 'ORIGINAL NAME:ATHEZ-D-BEFORE-DATA';
   COMMENT ON COLUMN "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL"."ATHEZ_D_AFTER_DATA" IS 'ORIGINAL NAME:ATHEZ-D-AFTER-DATA';
   COMMENT ON COLUMN "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL"."ATHEZ_D_SIGNON" IS 'ORIGINAL NAME:ATHEZ-D-SIGNON';
   COMMENT ON COLUMN "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL"."ATHEZ_D_PLAN_NBR" IS 'ORIGINAL NAME:ATHEZ-D-PLAN-NBR';
   COMMENT ON COLUMN "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL"."ATHEZ_D_REC_NBR" IS 'ORIGINAL NAME:ATHEZ-D-REC-NBR';
   COMMENT ON COLUMN "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL"."ATHEZ_D_REC_TYPE_KEY" IS 'ORIGINAL NAME:ATHEZ-D-REC-TYPE-KEY';
  GRANT ALTER ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT ALTER ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "PREMOC_RBL_MISDB_PROD";
  GRANT ALTER ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "QPI_RBL_MISDB_PROD";
  GRANT ALTER ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "ALERT_RBL_MISDB_PROD";
  GRANT ALTER ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "DWH_RBL_MISDB_PROD";
  GRANT ALTER ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "MAIN_PRO";
  GRANT ALTER ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT ALTER ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "CURDAT_RBL_MISDB_PROD";
  GRANT ALTER ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "BS_RBL_MISDB_PROD";
  GRANT ALTER ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "ACL_RBL_MISDB_PROD";
  GRANT ALTER ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT ALTER ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT DELETE ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT DELETE ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "PREMOC_RBL_MISDB_PROD";
  GRANT DELETE ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "QPI_RBL_MISDB_PROD";
  GRANT DELETE ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "ALERT_RBL_MISDB_PROD";
  GRANT DELETE ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "DWH_RBL_MISDB_PROD";
  GRANT DELETE ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "MAIN_PRO";
  GRANT DELETE ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT DELETE ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "CURDAT_RBL_MISDB_PROD";
  GRANT DELETE ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "BS_RBL_MISDB_PROD";
  GRANT DELETE ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "ACL_RBL_MISDB_PROD";
  GRANT DELETE ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT DELETE ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT INDEX ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "PREMOC_RBL_MISDB_PROD";
  GRANT INDEX ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "QPI_RBL_MISDB_PROD";
  GRANT INDEX ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "ALERT_RBL_MISDB_PROD";
  GRANT INDEX ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "DWH_RBL_MISDB_PROD";
  GRANT INDEX ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "MAIN_PRO";
  GRANT INDEX ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT INDEX ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "CURDAT_RBL_MISDB_PROD";
  GRANT INDEX ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "BS_RBL_MISDB_PROD";
  GRANT INDEX ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "ACL_RBL_MISDB_PROD";
  GRANT INDEX ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT INDEX ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT INSERT ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT INSERT ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "PREMOC_RBL_MISDB_PROD";
  GRANT INSERT ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "QPI_RBL_MISDB_PROD";
  GRANT INSERT ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "ALERT_RBL_MISDB_PROD";
  GRANT INSERT ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "DWH_RBL_MISDB_PROD";
  GRANT INSERT ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "MAIN_PRO";
  GRANT INSERT ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT INSERT ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "CURDAT_RBL_MISDB_PROD";
  GRANT INSERT ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "BS_RBL_MISDB_PROD";
  GRANT INSERT ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "ACL_RBL_MISDB_PROD";
  GRANT INSERT ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT INSERT ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT SELECT ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT SELECT ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "PREMOC_RBL_MISDB_PROD";
  GRANT SELECT ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "QPI_RBL_MISDB_PROD";
  GRANT SELECT ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "ALERT_RBL_MISDB_PROD";
  GRANT SELECT ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "DWH_RBL_MISDB_PROD";
  GRANT SELECT ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "MAIN_PRO";
  GRANT SELECT ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT SELECT ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "CURDAT_RBL_MISDB_PROD";
  GRANT SELECT ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "BS_RBL_MISDB_PROD";
  GRANT SELECT ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "ACL_RBL_MISDB_PROD";
  GRANT SELECT ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT SELECT ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT UPDATE ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT UPDATE ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "PREMOC_RBL_MISDB_PROD";
  GRANT UPDATE ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "QPI_RBL_MISDB_PROD";
  GRANT UPDATE ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "ALERT_RBL_MISDB_PROD";
  GRANT UPDATE ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "DWH_RBL_MISDB_PROD";
  GRANT UPDATE ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "MAIN_PRO";
  GRANT UPDATE ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT UPDATE ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "CURDAT_RBL_MISDB_PROD";
  GRANT UPDATE ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "BS_RBL_MISDB_PROD";
  GRANT UPDATE ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "ACL_RBL_MISDB_PROD";
  GRANT UPDATE ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT UPDATE ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "PREMOC_RBL_MISDB_PROD";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "QPI_RBL_MISDB_PROD";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "ALERT_RBL_MISDB_PROD";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "DWH_RBL_MISDB_PROD";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "MAIN_PRO";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "CURDAT_RBL_MISDB_PROD";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "BS_RBL_MISDB_PROD";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "ACL_RBL_MISDB_PROD";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT READ ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT READ ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "PREMOC_RBL_MISDB_PROD";
  GRANT READ ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "QPI_RBL_MISDB_PROD";
  GRANT READ ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "ALERT_RBL_MISDB_PROD";
  GRANT READ ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "DWH_RBL_MISDB_PROD";
  GRANT READ ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "MAIN_PRO";
  GRANT READ ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT READ ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "CURDAT_RBL_MISDB_PROD";
  GRANT READ ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "BS_RBL_MISDB_PROD";
  GRANT READ ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "ACL_RBL_MISDB_PROD";
  GRANT READ ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT READ ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "PREMOC_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "QPI_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "ALERT_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "DWH_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "MAIN_PRO";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "CURDAT_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "BS_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "ACL_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "PREMOC_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "QPI_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "ALERT_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "DWH_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "MAIN_PRO";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "CURDAT_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "BS_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "ACL_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT DEBUG ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "PREMOC_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "QPI_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "ALERT_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "DWH_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "MAIN_PRO";
  GRANT DEBUG ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "CURDAT_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "BS_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "ACL_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "PREMOC_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "QPI_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "ALERT_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "DWH_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "MAIN_PRO";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "CURDAT_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "BS_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "ACL_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT ALTER ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "ROLE_ALL_DB";
  GRANT ALTER ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "CC_CDR_RBL_STGDB";
  GRANT ALTER ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "RBL_BI_RBL_STGDB";
  GRANT ALTER ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "BSG_READ_RBL_STGDB";
  GRANT ALTER ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "STD_FIN_RBL_STGDB";
  GRANT ALTER ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "RBL_STGDB";
  GRANT ALTER ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT ALTER ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "RBL_TEMPDB";
  GRANT ALTER ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "STG_FIN_RBL_STGDB";
  GRANT ALTER ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "ADF_CDR_RBL_STGDB";
  GRANT DELETE ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "ROLE_ALL_DB";
  GRANT DELETE ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "CC_CDR_RBL_STGDB";
  GRANT DELETE ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "RBL_BI_RBL_STGDB";
  GRANT DELETE ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "BSG_READ_RBL_STGDB";
  GRANT DELETE ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "STD_FIN_RBL_STGDB";
  GRANT DELETE ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "RBL_STGDB";
  GRANT DELETE ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT DELETE ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "RBL_TEMPDB";
  GRANT DELETE ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "STG_FIN_RBL_STGDB";
  GRANT DELETE ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "ADF_CDR_RBL_STGDB";
  GRANT INDEX ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "CC_CDR_RBL_STGDB";
  GRANT INDEX ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "RBL_BI_RBL_STGDB";
  GRANT INDEX ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "BSG_READ_RBL_STGDB";
  GRANT INDEX ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "STD_FIN_RBL_STGDB";
  GRANT INDEX ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "RBL_STGDB";
  GRANT INDEX ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT INDEX ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "RBL_TEMPDB";
  GRANT INDEX ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "STG_FIN_RBL_STGDB";
  GRANT INDEX ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "ADF_CDR_RBL_STGDB";
  GRANT INSERT ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "ROLE_ALL_DB";
  GRANT INSERT ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "CC_CDR_RBL_STGDB";
  GRANT INSERT ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "RBL_BI_RBL_STGDB";
  GRANT INSERT ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "BSG_READ_RBL_STGDB";
  GRANT INSERT ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "STD_FIN_RBL_STGDB";
  GRANT INSERT ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "RBL_STGDB";
  GRANT INSERT ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT INSERT ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "RBL_TEMPDB";
  GRANT INSERT ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "STG_FIN_RBL_STGDB";
  GRANT INSERT ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "ADF_CDR_RBL_STGDB";
  GRANT SELECT ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "ROLE_ALL_DB";
  GRANT SELECT ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "CC_CDR_RBL_STGDB";
  GRANT SELECT ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "RBL_BI_RBL_STGDB";
  GRANT SELECT ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "BSG_READ_RBL_STGDB";
  GRANT SELECT ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "STD_FIN_RBL_STGDB";
  GRANT SELECT ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "RBL_STGDB";
  GRANT SELECT ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT SELECT ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "RBL_TEMPDB";
  GRANT SELECT ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "STG_FIN_RBL_STGDB";
  GRANT SELECT ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "ADF_CDR_RBL_STGDB";
  GRANT UPDATE ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "ROLE_ALL_DB";
  GRANT UPDATE ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "CC_CDR_RBL_STGDB";
  GRANT UPDATE ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "RBL_BI_RBL_STGDB";
  GRANT UPDATE ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "BSG_READ_RBL_STGDB";
  GRANT UPDATE ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "STD_FIN_RBL_STGDB";
  GRANT UPDATE ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "RBL_STGDB";
  GRANT UPDATE ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT UPDATE ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "RBL_TEMPDB";
  GRANT UPDATE ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "STG_FIN_RBL_STGDB";
  GRANT UPDATE ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "ADF_CDR_RBL_STGDB";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "CC_CDR_RBL_STGDB";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "RBL_BI_RBL_STGDB";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "BSG_READ_RBL_STGDB";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "STD_FIN_RBL_STGDB";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "RBL_STGDB";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "RBL_TEMPDB";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "STG_FIN_RBL_STGDB";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "ADF_CDR_RBL_STGDB";
  GRANT READ ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "ROLE_ALL_DB";
  GRANT READ ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "CC_CDR_RBL_STGDB";
  GRANT READ ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "RBL_BI_RBL_STGDB";
  GRANT READ ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "BSG_READ_RBL_STGDB";
  GRANT READ ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "STD_FIN_RBL_STGDB";
  GRANT READ ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "RBL_STGDB";
  GRANT READ ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT READ ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "RBL_TEMPDB";
  GRANT READ ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "STG_FIN_RBL_STGDB";
  GRANT READ ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "ADF_CDR_RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "ROLE_ALL_DB";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "CC_CDR_RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "RBL_BI_RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "BSG_READ_RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "STD_FIN_RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "RBL_TEMPDB";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "STG_FIN_RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "ADF_CDR_RBL_STGDB";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "ROLE_ALL_DB";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "CC_CDR_RBL_STGDB";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "RBL_BI_RBL_STGDB";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "BSG_READ_RBL_STGDB";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "STD_FIN_RBL_STGDB";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "RBL_STGDB";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "RBL_TEMPDB";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "STG_FIN_RBL_STGDB";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "ADF_CDR_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "ROLE_ALL_DB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "CC_CDR_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "RBL_BI_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "BSG_READ_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "STD_FIN_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "RBL_TEMPDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "STG_FIN_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "ADF_CDR_RBL_STGDB";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "ROLE_ALL_DB";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "CC_CDR_RBL_STGDB";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "RBL_BI_RBL_STGDB";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "BSG_READ_RBL_STGDB";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "STD_FIN_RBL_STGDB";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "RBL_STGDB";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "RBL_TEMPDB";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "STG_FIN_RBL_STGDB";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."REVERSEFEED_ENPA_DETAIL" TO "ADF_CDR_RBL_STGDB";
