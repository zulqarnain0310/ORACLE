--------------------------------------------------------
--  DDL for Procedure ADD_MISSING_ACCOUNT_COBORROWER_26092023
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "RBL_MISDB_PROD"."ADD_MISSING_ACCOUNT_COBORROWER_26092023" 
AS

BEGIN

   TABLE IF  --SQLDEV: NOT RECOGNIZED
   IF tt_leftaccounts_5 ;  --SQLDEV: NOT RECOGNIZED
   DELETE FROM tt_leftaccounts_5;
   UTILS.IDENTITY_RESET('tt_leftaccounts_5');

   INSERT INTO tt_leftaccounts_5 WITH CTE_A AS ( SELECT A.UCIF_ID ,
                                                        A.CustomerAcID ,
                                                        RefCustomerID 
        FROM PRO_RBL_MISDB_PROD.AccountCal_Main A
       WHERE  EXISTS ( SELECT 1 
                       FROM RBL_MISDB_PROD.CoBorrowerData B
                        WHERE  A.UCIF_ID = B.UCIC )
        GROUP BY A.UCIF_ID,A.CustomerAcID,RefCustomerID ) 
         SELECT A.UCIF_ID ,
                A.CustomerAcID ,
                RefCustomerID 
           FROM CTE_A A
         MINUS 
         SELECT UCIC ,
                CustomerAcID ,
                CustomerID 
           FROM RBL_MISDB_PROD.CoBorrowerData 
         ;

   EXECUTE IMMEDIATE ' ALTER TABLE tt_leftaccounts_5 
      ADD ( [COHORT_NO NUMBER(10,0) , TIMEKEY NUMBER(10,0) ] ) ';
   --UPDATE A 
   --SET A.CustomerId=B.RefCustomerID
   --FROM
   --tt_leftaccounts_5 A INNER JOIN PRO.ACCOUNTCAL B
   --ON A.CUSTOMERACID=B.CUSTOMERACID
   --WHERE A.CustomerId IS NULL
   MERGE INTO A 
   USING (SELECT A.ROWID row_id, B.Cohort_No, B.TimeKey
   FROM A ,tt_leftaccounts_5 A
          JOIN RBL_MISDB_PROD.CoBorrowerData B   ON A.UCIF_ID = B.UCIC 
    WHERE A.Cohort_No IS NULL) src
   ON ( A.ROWID = src.row_id )
   WHEN MATCHED THEN UPDATE SET A.COHORT_NO = src.Cohort_No,
                                A.TIMEKEY = src.TimeKey;
   INSERT INTO PRO_RBL_MISDB_PROD.CoBorrowerCal
     ( CustomerACID, UCIC, CustomerID, CustomerType, Cohort_No, TimeKey )
     ( SELECT CustomerACID ,
              UCIF_ID ,
              RefCustomerID ,
              'Link' CustomerType  ,
              COHORT_NO ,
              TimeKey 
       FROM tt_leftaccounts_5  );

EXCEPTION WHEN OTHERS THEN utils.handleerror(SQLCODE,SQLERRM);
END;

/

  GRANT EXECUTE ON "RBL_MISDB_PROD"."ADD_MISSING_ACCOUNT_COBORROWER_26092023" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."ADD_MISSING_ACCOUNT_COBORROWER_26092023" TO "PREMOC_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."ADD_MISSING_ACCOUNT_COBORROWER_26092023" TO "QPI_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."ADD_MISSING_ACCOUNT_COBORROWER_26092023" TO "ALERT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."ADD_MISSING_ACCOUNT_COBORROWER_26092023" TO "DWH_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."ADD_MISSING_ACCOUNT_COBORROWER_26092023" TO "MAIN_PRO";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."ADD_MISSING_ACCOUNT_COBORROWER_26092023" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."ADD_MISSING_ACCOUNT_COBORROWER_26092023" TO "CURDAT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."ADD_MISSING_ACCOUNT_COBORROWER_26092023" TO "BS_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."ADD_MISSING_ACCOUNT_COBORROWER_26092023" TO "ACL_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."ADD_MISSING_ACCOUNT_COBORROWER_26092023" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."ADD_MISSING_ACCOUNT_COBORROWER_26092023" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."ADD_MISSING_ACCOUNT_COBORROWER_26092023" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT DEBUG ON "RBL_MISDB_PROD"."ADD_MISSING_ACCOUNT_COBORROWER_26092023" TO "PREMOC_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."ADD_MISSING_ACCOUNT_COBORROWER_26092023" TO "QPI_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."ADD_MISSING_ACCOUNT_COBORROWER_26092023" TO "ALERT_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."ADD_MISSING_ACCOUNT_COBORROWER_26092023" TO "DWH_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."ADD_MISSING_ACCOUNT_COBORROWER_26092023" TO "MAIN_PRO";
  GRANT DEBUG ON "RBL_MISDB_PROD"."ADD_MISSING_ACCOUNT_COBORROWER_26092023" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."ADD_MISSING_ACCOUNT_COBORROWER_26092023" TO "CURDAT_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."ADD_MISSING_ACCOUNT_COBORROWER_26092023" TO "BS_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."ADD_MISSING_ACCOUNT_COBORROWER_26092023" TO "ACL_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."ADD_MISSING_ACCOUNT_COBORROWER_26092023" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."ADD_MISSING_ACCOUNT_COBORROWER_26092023" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."ADD_MISSING_ACCOUNT_COBORROWER_26092023" TO "ROLE_ALL_DB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."ADD_MISSING_ACCOUNT_COBORROWER_26092023" TO "CC_CDR_RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."ADD_MISSING_ACCOUNT_COBORROWER_26092023" TO "RBL_BI_RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."ADD_MISSING_ACCOUNT_COBORROWER_26092023" TO "BSG_READ_RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."ADD_MISSING_ACCOUNT_COBORROWER_26092023" TO "STD_FIN_RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."ADD_MISSING_ACCOUNT_COBORROWER_26092023" TO "RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."ADD_MISSING_ACCOUNT_COBORROWER_26092023" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."ADD_MISSING_ACCOUNT_COBORROWER_26092023" TO "RBL_TEMPDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."ADD_MISSING_ACCOUNT_COBORROWER_26092023" TO "STG_FIN_RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."ADD_MISSING_ACCOUNT_COBORROWER_26092023" TO "ADF_CDR_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."ADD_MISSING_ACCOUNT_COBORROWER_26092023" TO "ROLE_ALL_DB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."ADD_MISSING_ACCOUNT_COBORROWER_26092023" TO "CC_CDR_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."ADD_MISSING_ACCOUNT_COBORROWER_26092023" TO "RBL_BI_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."ADD_MISSING_ACCOUNT_COBORROWER_26092023" TO "BSG_READ_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."ADD_MISSING_ACCOUNT_COBORROWER_26092023" TO "STD_FIN_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."ADD_MISSING_ACCOUNT_COBORROWER_26092023" TO "RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."ADD_MISSING_ACCOUNT_COBORROWER_26092023" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."ADD_MISSING_ACCOUNT_COBORROWER_26092023" TO "RBL_TEMPDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."ADD_MISSING_ACCOUNT_COBORROWER_26092023" TO "STG_FIN_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."ADD_MISSING_ACCOUNT_COBORROWER_26092023" TO "ADF_CDR_RBL_STGDB";
