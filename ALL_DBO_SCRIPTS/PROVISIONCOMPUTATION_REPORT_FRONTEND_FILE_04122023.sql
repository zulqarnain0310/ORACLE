--------------------------------------------------------
--  DDL for Function PROVISIONCOMPUTATION_REPORT_FRONTEND_FILE_04122023
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "RBL_MISDB_PROD"."PROVISIONCOMPUTATION_REPORT_FRONTEND_FILE_04122023" 
(
  v_UserLoginID IN VARCHAR2,
  v_Result OUT NUMBER
)
RETURN NUMBER
AS
   v_temp NUMBER(1, 0) := 0;
   v_cursor SYS_REFCURSOR;

BEGIN

   BEGIN
      SELECT 1 INTO v_temp
        FROM DUAL
       WHERE ( SELECT COUNT(*)  
               FROM ProvisionComputation_Report_Frontend 
                WHERE  UserLoginId = v_UserLoginID ) > 0;
   EXCEPTION
      WHEN OTHERS THEN
         NULL;
   END;

   IF v_temp = 1 THEN

   BEGIN
      OPEN  v_cursor FOR
         SELECT UTILS.CONVERT_TO_VARCHAR2(Report_date,10,p_style=>105) Report_date  ,
                UCIC ,
                CIF_ID ,
                Borrower_Name ,
                Branch_Code ,
                Branch_Name ,
                Account_No ,
                Source_System ,
                Facility ,
                Scheme_Type ,
                Scheme_Code ,
                Scheme_Description ,
                Secured_Unsecured ,
                Seg_Code ,
                Segment_Description ,
                Business_Segment ,
                Account_DPD ,
                CASE 
                     WHEN NVL(NPA_Date, ' ') = ' ' THEN NULL
                ELSE UTILS.CONVERT_TO_VARCHAR2(NPA_Date,10,p_style=>103)
                   END NPA_Date  ,
                --,[NPA Date]
                Asset_Classification ,
                NPA_Norms ,
                Balance_Outstanding ,
                Customer_Security_Value ,
                Security_Value_Appropriated ,
                Secured_Outstanding ,
                Unsecured_Outstanding ,
                Provision_Total ,
                Provision_Secured ,
                Provision_Unsecured ,
                Net_NPA ,
                ProvisionSecured ,
                ProvisionUnSecured ,
                ProvisionTotal ,
                Prev_Qtr_Balance_Outstanding ,
                Prev_Qtr_Secured_Outstanding ,
                Prev_Qtr_Unsecured_Outstanding ,
                Prev_Qtr_Provision_Total ,
                Prev_Qtr_Provision_Secured ,
                Prev_Qtr_Provision_Unsecured ,
                Prev_Qtr_Net_NPA ,
                Block_Code_V ,
                Additional_Provision ,
                StatusType_1 ,
                PREV_QTR_Asset_Classification ,
                PREV_QTR_Additional_Provision ,
                PREV_QTR_ProvisionSecured ,
                PREV_QTR_ProvisionUnSecured ,
                PREV_QTR_ProvisionTotal ,
                TypeOfRestructure ,
                StatusType ,
                Asset_Norm Asset_Norm  ,
                Erosion_Testing Erosion_Testing  ,
                Litigation_Flg Litigation_Flag  ,
                Settlement_Flg Settlement_Flag  ,
                TWO_Flg TWO_Flag  ,
                CASE 
                     WHEN NVL(TWO_Date, ' ') = ' ' THEN NULL
                ELSE UTILS.CONVERT_TO_VARCHAR2(TWO_Date,10,p_style=>103)
                   END TWO_Date  ,
                TWO_Amount TWO_Amount  ,
                UserLoginID ,
                (UTILS.CONVERT_TO_VARCHAR2(UploadDate,10,p_style=>105) || ' ' || UTILS.CONVERT_TO_VARCHAR2(UploadDate,30,p_style=>108)) UploadDate  
           FROM ProvisionComputation_Report_Frontend 
          WHERE  UserLoginId = v_UserLoginID ;
         DBMS_SQL.RETURN_RESULT(v_cursor);
      v_Result := 1 ;
      RETURN v_result;

   END;
   ELSE

   BEGIN
      v_Result := 0 ;
      RETURN v_result;

   END;
   END IF;

EXCEPTION WHEN OTHERS THEN utils.handleerror(SQLCODE,SQLERRM);
END;

/

  GRANT EXECUTE ON "RBL_MISDB_PROD"."PROVISIONCOMPUTATION_REPORT_FRONTEND_FILE_04122023" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."PROVISIONCOMPUTATION_REPORT_FRONTEND_FILE_04122023" TO "PREMOC_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."PROVISIONCOMPUTATION_REPORT_FRONTEND_FILE_04122023" TO "QPI_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."PROVISIONCOMPUTATION_REPORT_FRONTEND_FILE_04122023" TO "ALERT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."PROVISIONCOMPUTATION_REPORT_FRONTEND_FILE_04122023" TO "DWH_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."PROVISIONCOMPUTATION_REPORT_FRONTEND_FILE_04122023" TO "MAIN_PRO";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."PROVISIONCOMPUTATION_REPORT_FRONTEND_FILE_04122023" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."PROVISIONCOMPUTATION_REPORT_FRONTEND_FILE_04122023" TO "CURDAT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."PROVISIONCOMPUTATION_REPORT_FRONTEND_FILE_04122023" TO "BS_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."PROVISIONCOMPUTATION_REPORT_FRONTEND_FILE_04122023" TO "ACL_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."PROVISIONCOMPUTATION_REPORT_FRONTEND_FILE_04122023" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."PROVISIONCOMPUTATION_REPORT_FRONTEND_FILE_04122023" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."PROVISIONCOMPUTATION_REPORT_FRONTEND_FILE_04122023" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT DEBUG ON "RBL_MISDB_PROD"."PROVISIONCOMPUTATION_REPORT_FRONTEND_FILE_04122023" TO "PREMOC_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."PROVISIONCOMPUTATION_REPORT_FRONTEND_FILE_04122023" TO "QPI_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."PROVISIONCOMPUTATION_REPORT_FRONTEND_FILE_04122023" TO "ALERT_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."PROVISIONCOMPUTATION_REPORT_FRONTEND_FILE_04122023" TO "DWH_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."PROVISIONCOMPUTATION_REPORT_FRONTEND_FILE_04122023" TO "MAIN_PRO";
  GRANT DEBUG ON "RBL_MISDB_PROD"."PROVISIONCOMPUTATION_REPORT_FRONTEND_FILE_04122023" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."PROVISIONCOMPUTATION_REPORT_FRONTEND_FILE_04122023" TO "CURDAT_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."PROVISIONCOMPUTATION_REPORT_FRONTEND_FILE_04122023" TO "BS_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."PROVISIONCOMPUTATION_REPORT_FRONTEND_FILE_04122023" TO "ACL_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."PROVISIONCOMPUTATION_REPORT_FRONTEND_FILE_04122023" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."PROVISIONCOMPUTATION_REPORT_FRONTEND_FILE_04122023" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."PROVISIONCOMPUTATION_REPORT_FRONTEND_FILE_04122023" TO "ROLE_ALL_DB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."PROVISIONCOMPUTATION_REPORT_FRONTEND_FILE_04122023" TO "CC_CDR_RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."PROVISIONCOMPUTATION_REPORT_FRONTEND_FILE_04122023" TO "RBL_BI_RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."PROVISIONCOMPUTATION_REPORT_FRONTEND_FILE_04122023" TO "BSG_READ_RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."PROVISIONCOMPUTATION_REPORT_FRONTEND_FILE_04122023" TO "STD_FIN_RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."PROVISIONCOMPUTATION_REPORT_FRONTEND_FILE_04122023" TO "RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."PROVISIONCOMPUTATION_REPORT_FRONTEND_FILE_04122023" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."PROVISIONCOMPUTATION_REPORT_FRONTEND_FILE_04122023" TO "RBL_TEMPDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."PROVISIONCOMPUTATION_REPORT_FRONTEND_FILE_04122023" TO "STG_FIN_RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."PROVISIONCOMPUTATION_REPORT_FRONTEND_FILE_04122023" TO "ADF_CDR_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."PROVISIONCOMPUTATION_REPORT_FRONTEND_FILE_04122023" TO "ROLE_ALL_DB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."PROVISIONCOMPUTATION_REPORT_FRONTEND_FILE_04122023" TO "CC_CDR_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."PROVISIONCOMPUTATION_REPORT_FRONTEND_FILE_04122023" TO "RBL_BI_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."PROVISIONCOMPUTATION_REPORT_FRONTEND_FILE_04122023" TO "BSG_READ_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."PROVISIONCOMPUTATION_REPORT_FRONTEND_FILE_04122023" TO "STD_FIN_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."PROVISIONCOMPUTATION_REPORT_FRONTEND_FILE_04122023" TO "RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."PROVISIONCOMPUTATION_REPORT_FRONTEND_FILE_04122023" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."PROVISIONCOMPUTATION_REPORT_FRONTEND_FILE_04122023" TO "RBL_TEMPDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."PROVISIONCOMPUTATION_REPORT_FRONTEND_FILE_04122023" TO "STG_FIN_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."PROVISIONCOMPUTATION_REPORT_FRONTEND_FILE_04122023" TO "ADF_CDR_RBL_STGDB";
