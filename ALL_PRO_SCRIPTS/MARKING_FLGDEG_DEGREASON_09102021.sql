--------------------------------------------------------
--  DDL for Procedure MARKING_FLGDEG_DEGREASON_09102021
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "MAIN_PRO"."MARKING_FLGDEG_DEGREASON_09102021" /*=========================================
 AUTHER : TRILOKI KHANNA
 CREATE DATE : 27-11-2019
 MODIFY DATE : 27-11-2019
 DESCRIPTION : MARKING OF FLGDEG AND DEG REASON 
 --EXEC [Pro].[Marking_FlgDeg_Degreason] @TIMEKEY=25140
=============================================*/
(
  v_TIMEKEY IN NUMBER
)
AS

BEGIN

   BEGIN
      DECLARE
         v_ProcessDate VARCHAR2(200) := ( SELECT DATE_ 
           FROM SYSDAYMATRIX 
          WHERE  TimeKey = v_TIMEKEY );

      BEGIN
         /*---------------INTIAL LEVEL FLG DEG SET N------------------------------------------*/
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, 'N'
         FROM A ,PRO_RBL_MISDB_PROD.ACCOUNTCAL A
                JOIN PRO_RBL_MISDB_PROD.CUSTOMERCAL B   ON A.RefCustomerID = B.RefCustomerID 
          WHERE ( NVL(B.FlgProcessing, 'N') = 'N' )) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.FLGDEG = 'N';
         /*---------------UPDATE DEG FLAG AT CUSTOMER LEVEL------------------------------------*/
         MERGE INTO B 
         USING (SELECT B.ROWID row_id, 'N'
         FROM B ,PRO_RBL_MISDB_PROD.ACCOUNTCAL A
                JOIN PRO_RBL_MISDB_PROD.CUSTOMERCAL B   ON A.RefCustomerID = B.RefCustomerID 
          WHERE ( NVL(B.FlgProcessing, 'N') = 'N' )) src
         ON ( B.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET B.FlgDeg = 'N';
         /*---------------UPDATE DEG FLAG AT ACCOUNT LEVEL-----------------------------------------*/
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, (CASE 
         WHEN NVL(A.DPD_IntService, 0) >= A.RefPeriodIntService THEN 'Y'
         WHEN NVL(A.DPD_Overdrawn, 0) >= A.RefPeriodOverDrawn THEN 'Y'
         WHEN NVL(A.DPD_NoCredit, 0) >= A.RefPeriodNoCredit THEN 'Y'
         WHEN NVL(A.DPD_Overdue, 0) >= A.RefPeriodOverdue THEN 'Y'
         WHEN NVL(A.DPD_StockStmt, 0) >= A.RefPeriodStkStatement THEN 'Y'
         WHEN NVL(A.DPD_Renewal, 0) >= A.RefPeriodReview THEN 'Y'
         ELSE 'N'
            END) AS FLGDEG
         FROM A ,PRO_RBL_MISDB_PROD.ACCOUNTCAL A
                JOIN PRO_RBL_MISDB_PROD.CUSTOMERCAL B   ON A.RefCustomerID = B.RefCustomerID 
          WHERE ( a.FinalAssetClassAlt_Key IN ( SELECT AssetClassAlt_Key 
                                                FROM DimAssetClass 
                                                 WHERE  AssetClassShortNameEnum IN ( 'STD' )

                                                          AND EffectiveFromTimeKey <= v_TIMEKEY
                                                          AND EffectiveToTimeKey >= v_TIMEKEY )
          )
           AND ( NVL(A.Asset_Norm, 'NORMAL') <> 'ALWYS_STD' )
           AND ( B.FlgProcessing = 'N' )
           AND NVL(InMonthMark, 'N') = 'Y'
           AND NVL(B.FlgMoc, 'N') = 'N'
           AND NVL(A.Balance, 0) > 0) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.FLGDEG = src.FLGDEG;
         /* ------------------------UPDATE DEG FLAG AT CUSTOMER LEVEL----------------------------------*/
         MERGE INTO B 
         USING (SELECT B.ROWID row_id, 'Y'
         FROM B ,PRO_RBL_MISDB_PROD.ACCOUNTCAL A
                JOIN PRO_RBL_MISDB_PROD.CUSTOMERCAL B   ON A.RefCustomerID = B.RefCustomerID 
          WHERE A.FlgDeg = 'Y'
           AND ( B.FlgProcessing = 'N' )) src
         ON ( B.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET B.FlgDeg = 'Y';
         /*---------------------ASSIGNE DEG REASON------------------------------------------------------*/
         --UPDATE  A SET A.DEGREASON=NULL 
         --FROM PRO.AccountCal A INNER JOIN PRO.CustomerCal B ON A.RefCustomerID =B.RefCustomerID
         --WHERE (B.FlgProcessing='N')
         --UPDATE A SET A.NPA_Reason= ISNULL(A.NPA_Reason,'')+' DEGRADE BY INT NOT SERVICED'  
         --FROM PRO.AccountCal A INNER JOIN PRO.CustomerCal B ON A.CustomerEntityID =B.CustomerEntityID
         --WHERE (B.FlgProcessing='N')  AND ( isnull(FinalAssetClassAlt_Key,1)<>1 AND (A.DPD_INTSERVICE>0))
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, NVL(A.DegReason, ' ') || 'DEGRADE BY INT NOT SERVICED' AS DegReason
         FROM A ,PRO_RBL_MISDB_PROD.ACCOUNTCAL A
                JOIN PRO_RBL_MISDB_PROD.CUSTOMERCAL B   ON A.RefCustomerID = B.RefCustomerID 
          WHERE ( B.FlgProcessing = 'N' )
           AND ( A.FlgDeg = 'Y'
           AND ( A.DPD_IntService >= A.RefPeriodIntService ) )) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.DegReason = src.DegReason;
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, NVL(A.DegReason, ' ') || ', DEGRADE BY CONTI EXCESS' AS DegReason
         FROM A ,PRO_RBL_MISDB_PROD.ACCOUNTCAL A
                JOIN PRO_RBL_MISDB_PROD.CUSTOMERCAL B   ON A.RefCustomerID = B.RefCustomerID 
          WHERE ( B.FlgProcessing = 'N' )
           AND ( A.FlgDeg = 'Y'
           AND A.DPD_Overdrawn >= A.RefPeriodOverDrawn )) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.DegReason = src.DegReason;
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, NVL(A.DegReason, ' ') || ', DEGRADE BY NO CREDIT' AS DegReason
         FROM A ,PRO_RBL_MISDB_PROD.ACCOUNTCAL A
                JOIN PRO_RBL_MISDB_PROD.CUSTOMERCAL B   ON A.RefCustomerID = B.RefCustomerID 
          WHERE ( B.FlgProcessing = 'N' )
           AND ( A.FlgDeg = 'Y'
           AND A.DPD_NoCredit >= A.RefPeriodNoCredit )) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET B.DegReason = src.DegReason;
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, NVL(A.DegReason, ' ') || ', DEGRADE BY STOCK STATEMENT' AS DegReason
         FROM A ,PRO_RBL_MISDB_PROD.ACCOUNTCAL A
                JOIN PRO_RBL_MISDB_PROD.CUSTOMERCAL B   ON A.RefCustomerID = B.RefCustomerID 
          WHERE ( B.FlgProcessing = 'N' )
           AND ( A.FlgDeg = 'Y'
           AND A.DPD_StockStmt >= A.RefPeriodStkStatement )) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET B.DegReason = src.DegReason;
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, NVL(A.DegReason, ' ') || ', DEGRADE BY REVIEW DUE DATE' AS DEGREASON
         FROM A ,PRO_RBL_MISDB_PROD.ACCOUNTCAL A
                JOIN PRO_RBL_MISDB_PROD.CUSTOMERCAL B   ON A.RefCustomerID = B.RefCustomerID 
          WHERE ( B.FlgProcessing = 'N' )
           AND ( A.FlgDeg = 'Y'
           AND A.DPD_Renewal >= A.RefPeriodReview )) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.DEGREASON = src.DEGREASON;
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, NVL(A.DegReason, ' ') || ', DEGRADE BY OVERDUE' AS DegReason
         FROM A ,PRO_RBL_MISDB_PROD.ACCOUNTCAL A
                JOIN PRO_RBL_MISDB_PROD.CUSTOMERCAL B   ON A.RefCustomerID = B.RefCustomerID 
          WHERE ( B.FlgProcessing = 'N' )
           AND ( A.FlgDeg = 'Y'
           AND A.DPD_Overdue >= A.RefPeriodOverdue )) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.DegReason = src.DegReason;
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, B.DegReason
         FROM A ,PRO_RBL_MISDB_PROD.ACCOUNTCAL A
                JOIN PRO_RBL_MISDB_PROD.CUSTOMERCAL B   ON A.SourceSystemCustomerID = B.SourceSystemCustomerID 
          WHERE ( B.FlgProcessing = 'N' )
           AND ( A.FlgDeg = 'N' )
           AND B.DegReason IS NOT NULL
           AND A.FinalAssetClassAlt_Key > 1
           AND A.DegReason IS NULL) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET B.DegReason = src.DegReason;
         UPDATE PRO_RBL_MISDB_PROD.AclRunningProcessStatus
            SET COMPLETED = 'Y',
                ERRORDATE = NULL,
                ERRORDESCRIPTION = NULL,
                COUNT = NVL(COUNT, 0) + 1
          WHERE  RUNNINGPROCESSNAME = 'Marking_FlgDeg_Degreason';

      END;
   EXCEPTION
      WHEN OTHERS THEN

   BEGIN
      -----------------Added for DashBoard 04-03-2021
      --Update BANDAUDITSTATUS set CompletedCount=CompletedCount+1 where BandName='ASSET CLASSIFICATION'
      UPDATE PRO_RBL_MISDB_PROD.AclRunningProcessStatus
         SET COMPLETED = 'N',
             ERRORDATE = SYSDATE,
             ERRORDESCRIPTION = SQLERRM,
             COUNT = NVL(COUNT, 0) + 1
       WHERE  RUNNINGPROCESSNAME = 'Marking_FlgDeg_Degreason';

   END;END;

EXCEPTION WHEN OTHERS THEN utils.handleerror(SQLCODE,SQLERRM);
END;

/

  GRANT EXECUTE ON "MAIN_PRO"."MARKING_FLGDEG_DEGREASON_09102021" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT EXECUTE ON "MAIN_PRO"."MARKING_FLGDEG_DEGREASON_09102021" TO "PREMOC_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."MARKING_FLGDEG_DEGREASON_09102021" TO "QPI_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."MARKING_FLGDEG_DEGREASON_09102021" TO "ALERT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."MARKING_FLGDEG_DEGREASON_09102021" TO "DWH_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."MARKING_FLGDEG_DEGREASON_09102021" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."MARKING_FLGDEG_DEGREASON_09102021" TO "CURDAT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."MARKING_FLGDEG_DEGREASON_09102021" TO "BS_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."MARKING_FLGDEG_DEGREASON_09102021" TO "ACL_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."MARKING_FLGDEG_DEGREASON_09102021" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."MARKING_FLGDEG_DEGREASON_09102021" TO "RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."MARKING_FLGDEG_DEGREASON_09102021" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."MARKING_FLGDEG_DEGREASON_09102021" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT DEBUG ON "MAIN_PRO"."MARKING_FLGDEG_DEGREASON_09102021" TO "PREMOC_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."MARKING_FLGDEG_DEGREASON_09102021" TO "QPI_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."MARKING_FLGDEG_DEGREASON_09102021" TO "ALERT_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."MARKING_FLGDEG_DEGREASON_09102021" TO "DWH_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."MARKING_FLGDEG_DEGREASON_09102021" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."MARKING_FLGDEG_DEGREASON_09102021" TO "CURDAT_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."MARKING_FLGDEG_DEGREASON_09102021" TO "BS_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."MARKING_FLGDEG_DEGREASON_09102021" TO "ACL_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."MARKING_FLGDEG_DEGREASON_09102021" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."MARKING_FLGDEG_DEGREASON_09102021" TO "RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."MARKING_FLGDEG_DEGREASON_09102021" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."MARKING_FLGDEG_DEGREASON_09102021" TO "ROLE_ALL_DB";
  GRANT EXECUTE ON "MAIN_PRO"."MARKING_FLGDEG_DEGREASON_09102021" TO "CC_CDR_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."MARKING_FLGDEG_DEGREASON_09102021" TO "RBL_BI_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."MARKING_FLGDEG_DEGREASON_09102021" TO "BSG_READ_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."MARKING_FLGDEG_DEGREASON_09102021" TO "STD_FIN_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."MARKING_FLGDEG_DEGREASON_09102021" TO "RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."MARKING_FLGDEG_DEGREASON_09102021" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT EXECUTE ON "MAIN_PRO"."MARKING_FLGDEG_DEGREASON_09102021" TO "RBL_TEMPDB";
  GRANT EXECUTE ON "MAIN_PRO"."MARKING_FLGDEG_DEGREASON_09102021" TO "STG_FIN_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."MARKING_FLGDEG_DEGREASON_09102021" TO "ADF_CDR_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."MARKING_FLGDEG_DEGREASON_09102021" TO "ROLE_ALL_DB";
  GRANT DEBUG ON "MAIN_PRO"."MARKING_FLGDEG_DEGREASON_09102021" TO "CC_CDR_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."MARKING_FLGDEG_DEGREASON_09102021" TO "RBL_BI_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."MARKING_FLGDEG_DEGREASON_09102021" TO "BSG_READ_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."MARKING_FLGDEG_DEGREASON_09102021" TO "STD_FIN_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."MARKING_FLGDEG_DEGREASON_09102021" TO "RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."MARKING_FLGDEG_DEGREASON_09102021" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT DEBUG ON "MAIN_PRO"."MARKING_FLGDEG_DEGREASON_09102021" TO "RBL_TEMPDB";
  GRANT DEBUG ON "MAIN_PRO"."MARKING_FLGDEG_DEGREASON_09102021" TO "STG_FIN_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."MARKING_FLGDEG_DEGREASON_09102021" TO "ADF_CDR_RBL_STGDB";
