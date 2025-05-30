--------------------------------------------------------
--  DDL for Procedure MARKING_NPA_REASON_NPAACCOUNT_04032022
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "MAIN_PRO"."MARKING_NPA_REASON_NPAACCOUNT_04032022" /*=========================================
 AUTHER : TRILOKI KHANNA
 CREATE DATE : 27-11-2019
 MODIFY DATE : 27-11-2019
 DESCRIPTION : MARKING OF FLGDEG AND DEG REASON 
 --EXEC [PRO].[Marking_NPA_Reason_NPAAccount]  @TIMEKEY=25140
=============================================*/
(
  v_TIMEKEY IN NUMBER
)
AS

BEGIN

   BEGIN
      DECLARE
         v_PROCESSDATE VARCHAR2(200) := ( SELECT DATE_ 
           FROM SYSDAYMATRIX 
          WHERE  TIMEKEY = v_TIMEKEY );

      BEGIN
         UPDATE PRO_RBL_MISDB_PROD.ACCOUNTCAL
            SET NPA_REASON = NULL;
         --UPDATE A SET a.NPA_Reason='Account Restructured after 01-04-2015'
         --FROM PRO.AccountCal A INNER JOIN dbo.AdvAcRestructureDetail B ON A.AccountEntityID=B.AccountEntityId
         --AND (B.EffectiveFromTimeKey<=@TIMEKEY AND B.EffectiveToTimeKey>=@TIMEKEY)
         --INNER JOIN PRO.CustomerCal C ON C.CustomerEntityID=A.CustomerEntityID
         --WHERE B.RestructureDt IS NOT NULL AND RestructureDt >'2015-04-01'  AND ISNULL(FinalAssetClassAlt_Key,1)<>1 
         /*----REVERSING DEGRADED ACCOUNT THROUGH NORMAL  PROCESS--------------*/
         ------UPDATE B SET 
         ------ b.NPA_Reason=(CASE WHEN ISNULL(SDR_INVOKED,'N')='Y' AND   SDR_REFER_DATE >DATEADD(MONTH,-18,@PROCESSDATE) THEN null
         ------ELSE B.NPA_Reason end)
         ------FROM  dbo.AdvAcRestructureDetail A INNER JOIN PRO.AccountCal
         ------ B ON A.AccountEntityId=B.AccountEntityID
         ------ AND A.EffectiveFromTimeKey<=@TIMEKEY AND A.EffectiveToTimeKey>=@TIMEKEY
         ------ INNER JOIN PRO.CustomerCal C ON C.CustomerEntityID=B.CustomerEntityID
         ------ WHERE  C.CustomerEntityID  NOT IN(SELECT CustomerEntityID FROM AdvAcProjectDetail WHERE EffectiveFromTimeKey<=@TIMEKEY AND EffectiveToTimeKey>=@TIMEKEY)
         ------ AND  A.SDR_REFER_DATE IS NOT NULL   AND ISNULL(FinalAssetClassAlt_Key,1)<>1 
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, NVL(A.NPA_Reason, ' ') || ' Degarde Account due to ALWYS_NPA and balance >=0' AS NPA_Reason
         FROM A ,PRO_RBL_MISDB_PROD.ACCOUNTCAL A
                JOIN PRO_RBL_MISDB_PROD.CUSTOMERCAL B   ON A.CustomerEntityID = B.CustomerEntityID 
          WHERE A.Asset_Norm = 'ALWYS_NPA'
           AND NVL(FinalAssetClassAlt_Key, 1) <> 1
           AND ( B.FlgProcessing = 'N' )) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.NPA_Reason = src.NPA_Reason;
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, NVL(A.NPA_Reason, ' ') || ' DEGRADE BY INT NOT SERVICED' AS NPA_Reason
         FROM A ,PRO_RBL_MISDB_PROD.ACCOUNTCAL A
                JOIN PRO_RBL_MISDB_PROD.CUSTOMERCAL B   ON A.CustomerEntityID = B.CustomerEntityID 
          WHERE ( B.FlgProcessing = 'N' )
           AND ( NVL(FinalAssetClassAlt_Key, 1) <> 1
           AND ( A.DPD_IntService > 0 ) )) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.NPA_Reason = src.NPA_Reason;
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, NVL(A.NPA_Reason, ' ') || ', DEGRADE BY CONTI EXCESS' AS NPA_Reason
         FROM A ,PRO_RBL_MISDB_PROD.ACCOUNTCAL A
                JOIN PRO_RBL_MISDB_PROD.CUSTOMERCAL B   ON A.CustomerEntityID = B.CustomerEntityID 
          WHERE ( B.FlgProcessing = 'N' )
           AND ( NVL(FinalAssetClassAlt_Key, 1) <> 1
           AND A.DPD_Overdrawn > 0 )) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.NPA_Reason = src.NPA_Reason;
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, NVL(A.NPA_Reason, ' ') || ', DEGRADE BY NO CREDIT' AS NPA_Reason
         FROM A ,PRO_RBL_MISDB_PROD.ACCOUNTCAL A
                JOIN PRO_RBL_MISDB_PROD.CUSTOMERCAL B   ON A.CustomerEntityID = B.CustomerEntityID 
          WHERE ( B.FlgProcessing = 'N' )
           AND ( NVL(FinalAssetClassAlt_Key, 1) <> 1
           AND A.DPD_NoCredit > 0 )) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET B.NPA_Reason = src.NPA_Reason;
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, NVL(A.NPA_Reason, ' ') || ', DEGRADE BY OVERDUE' AS NPA_Reason
         FROM A ,PRO_RBL_MISDB_PROD.ACCOUNTCAL A
                JOIN PRO_RBL_MISDB_PROD.CUSTOMERCAL B   ON A.CustomerEntityID = B.CustomerEntityID 
          WHERE ( B.FlgProcessing = 'N' )
           AND ( NVL(FinalAssetClassAlt_Key, 1) <> 1
           AND A.DPD_Overdue > 0 )) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.NPA_Reason = src.NPA_Reason;
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, NVL(A.NPA_Reason, ' ') || ', DEGRADE BY DEBIT BALANCE ' AS NPA_Reason
         FROM A ,PRO_RBL_MISDB_PROD.ACCOUNTCAL A
                JOIN PRO_RBL_MISDB_PROD.CUSTOMERCAL B   ON A.CustomerEntityID = B.CustomerEntityID
                JOIN DimProduct C   ON A.ProductAlt_Key = C.ProductAlt_Key
                AND ( C.EffectiveFromTimeKey <= v_TimeKey
                AND C.EffectiveToTimeKey >= v_TimeKey ) 
          WHERE ( B.FlgProcessing = 'N' )
           AND ( NVL(FinalAssetClassAlt_Key, 1) <> 1
           AND A.DPD_Overdue > 0 )
           AND A.DebitSinceDt IS NOT NULL) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.NPA_Reason = src.NPA_Reason;--AND ISNULL(C.SrcSysProductCode,'N')='SAVING'
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, NVL(A.NPA_Reason, ' ') || ', DEGRADE BY STOCK STATEMENT' AS NPA_Reason
         FROM A ,PRO_RBL_MISDB_PROD.ACCOUNTCAL A
                JOIN PRO_RBL_MISDB_PROD.CUSTOMERCAL B   ON A.CustomerEntityID = B.CustomerEntityID 
          WHERE ( B.FlgProcessing = 'N' )
           AND ( NVL(FinalAssetClassAlt_Key, 1) <> 1
           AND A.DPD_StockStmt > 0 )) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET B.NPA_Reason = src.NPA_Reason;
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, NVL(A.NPA_Reason, ' ') || ', DEGRADE BY REVIEW DUE DATE' AS NPA_Reason
         FROM A ,PRO_RBL_MISDB_PROD.ACCOUNTCAL A
                JOIN PRO_RBL_MISDB_PROD.CUSTOMERCAL B   ON A.CustomerEntityID = B.CustomerEntityID 
          WHERE ( B.FlgProcessing = 'N' )
           AND ( NVL(FinalAssetClassAlt_Key, 1) <> 1
           AND A.DPD_Renewal > 0 )) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.NPA_Reason = src.NPA_Reason;
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, NVL(A.NPA_Reason, ' ') || 'DEGARDE BY MOC' AS NPA_REASON
         FROM A ,PRO_RBL_MISDB_PROD.ACCOUNTCAL A
                JOIN PRO_RBL_MISDB_PROD.ChangedMocAclStatus B   ON A.CustomerEntityID = B.CustomerEntityID
                AND ( B.EffectiveFromTimeKey <= v_TIMEKEY
                AND B.EffectiveToTimeKey >= v_TIMEKEY )
                AND a.Asset_Norm = 'NORMAL' ) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.NPA_REASON = src.NPA_REASON;
         MERGE INTO B 
         USING (SELECT B.ROWID row_id, 'PERCOLATION BY PAN CARD ' || ' ' || A.PANNO AS NPA_Reason
         FROM B ,PRO_RBL_MISDB_PROD.CUSTOMERCAL A
                JOIN PRO_RBL_MISDB_PROD.ACCOUNTCAL B   ON A.RefCustomerID = B.RefCustomerID 
          WHERE B.FinalAssetClassAlt_Key > 1
           AND B.NPA_Reason IS NULL
           AND A.DegReason LIKE '%PERCOLATION BY PAN CARD%') src
         ON ( B.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET NPA_Reason = src.NPA_Reason;
         MERGE INTO B 
         USING (SELECT B.ROWID row_id, 'PERCOLATION BY AADHAR CARD ' || ' ' || A.AadharCardNO AS NPA_Reason
         FROM B ,PRO_RBL_MISDB_PROD.CUSTOMERCAL A
                JOIN PRO_RBL_MISDB_PROD.ACCOUNTCAL B   ON A.RefCustomerID = B.RefCustomerID 
          WHERE B.FinalAssetClassAlt_Key > 1
           AND B.NPA_Reason IS NULL
           AND A.DegReason LIKE '%PERCOLATION BY AADHAR CARD%') src
         ON ( B.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET NPA_Reason = src.NPA_Reason;
         IF utils.object_id('TEMPDB..tt_TEMPTABLE_PERCOLATION_3') IS NOT NULL THEN
          EXECUTE IMMEDIATE ' TRUNCATE TABLE tt_TEMPTABLE_PERCOLATION_3 ';
         END IF;
         DELETE FROM tt_TEMPTABLE_PERCOLATION_3;
         UTILS.IDENTITY_RESET('tt_TEMPTABLE_PERCOLATION_3');

         INSERT INTO tt_TEMPTABLE_PERCOLATION_3 SELECT A.RefCustomerID RefCustomerID  ,
                                                       A.CustomerAcID CustomerAcID  ,
                                                       A.NPA_Reason 
              FROM PRO_RBL_MISDB_PROD.ACCOUNTCAL A
                     JOIN PRO_RBL_MISDB_PROD.CUSTOMERCAL B   ON A.RefCustomerID = B.RefCustomerID
             WHERE  A.EffectiveFromTimeKey <= v_TIMEKEY
                      AND A.EffectiveToTimeKey >= v_TIMEKEY
                      AND B.EffectiveFromTimeKey <= v_TIMEKEY
                      AND B.EffectiveToTimeKey >= v_TIMEKEY
                      AND A.NPA_Reason IS NOT NULL
                      AND A.FinalAssetClassAlt_Key > 1
                      AND ( A.FlgDeg = 'N' )
              ORDER BY A.RefCustomerID;
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, 'Link By AccountId' || ' ' || B.CustomerAcID AS NPA_Reason
         FROM A ,PRO_RBL_MISDB_PROD.ACCOUNTCAL A
                JOIN tt_TEMPTABLE_PERCOLATION_3 B   ON A.RefCustomerID = B.REFCUSTOMERID 
          WHERE A.FinalAssetClassAlt_Key > 1
           AND A.NPA_Reason IS NULL
           AND ( A.FlgDeg = 'N' )) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET B.NPA_Reason = src.NPA_Reason;
         IF utils.object_id('TEMPDB..tt_TEMPTABLE_PERCOLATION_3FreshSlipage') IS NOT NULL THEN
          EXECUTE IMMEDIATE ' TRUNCATE TABLE tt_TEMPTABLE_PERCOLATIONFre_3 ';
         END IF;
         DELETE FROM tt_TEMPTABLE_PERCOLATIONFre_3;
         UTILS.IDENTITY_RESET('tt_TEMPTABLE_PERCOLATIONFre_3');

         INSERT INTO tt_TEMPTABLE_PERCOLATIONFre_3 SELECT A.RefCustomerID RefCustomerID  ,
                                                          A.CustomerAcID CustomerAcID  ,
                                                          A.NPA_Reason 
              FROM PRO_RBL_MISDB_PROD.ACCOUNTCAL A
                     JOIN PRO_RBL_MISDB_PROD.CUSTOMERCAL B   ON A.RefCustomerID = B.RefCustomerID
             WHERE  A.EffectiveFromTimeKey <= v_TIMEKEY
                      AND A.EffectiveToTimeKey >= v_TIMEKEY
                      AND B.EffectiveFromTimeKey <= v_TIMEKEY
                      AND B.EffectiveToTimeKey >= v_TIMEKEY
                      AND A.NPA_Reason IS NOT NULL
                      AND A.FinalAssetClassAlt_Key > 1
                      AND ( A.FlgDeg = 'Y' )
              ORDER BY A.RefCustomerID;
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, 'Link By AccountId' || ' ' || B.CustomerAcID AS NPA_Reason
         FROM A ,PRO_RBL_MISDB_PROD.ACCOUNTCAL A
                JOIN tt_TEMPTABLE_PERCOLATIONFre_3 B   ON A.RefCustomerID = B.REFCUSTOMERID
                JOIN DIMPRODUCT P   ON P.EFFECTIVEFROMTIMEKEY <= v_TIMEKEY
                AND P.EFFECTIVETOTIMEKEY >= v_TIMEKEY
                AND ( P.PRODUCTALT_KEY = A.ProductAlt_Key ) 
          WHERE A.FinalAssetClassAlt_Key > 1
           AND ( NVL(A.DPD_Max, 0) < 90
           OR P.Agrischeme = 'Y'
           AND A.DPD_Max < 366 )
           AND ( A.FlgDeg = 'N' )) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET B.NPA_Reason = src.NPA_Reason;--A.NPA_Reason IS NULL AND (A.FLGDEG='N')  As per Mail Changes done by Triloki 25/02/2020
         ---WRITE OF REASON UPDATED -----
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, 'ALWYS_NPA Due To Writeoff Amount' AS NPA_Reason
         FROM A ,PRO_RBL_MISDB_PROD.ACCOUNTCAL A
                JOIN PRO_RBL_MISDB_PROD.CUSTOMERCAL B   ON A.CustomerEntityID = B.CustomerEntityID 
          WHERE A.Asset_Norm = 'ALWYS_NPA'
           AND NVL(FinalAssetClassAlt_Key, 1) <> 1
           AND ( B.FlgProcessing = 'N' )
           AND A.WriteOffAmount > 0) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.NPA_Reason = src.NPA_Reason;
         IF utils.object_id('TEMPDB..tt_TEMPTABLE_PERCOLATION_3WRITEOFF') IS NOT NULL THEN
          EXECUTE IMMEDIATE ' TRUNCATE TABLE tt_TEMPTABLE_PERCOLATIONWRI_3 ';
         END IF;
         DELETE FROM tt_TEMPTABLE_PERCOLATIONWRI_3;
         UTILS.IDENTITY_RESET('tt_TEMPTABLE_PERCOLATIONWRI_3');

         INSERT INTO tt_TEMPTABLE_PERCOLATIONWRI_3 SELECT A.RefCustomerID RefCustomerID  ,
                                                          A.CustomerAcID CustomerAcID  ,
                                                          A.NPA_Reason 
              FROM PRO_RBL_MISDB_PROD.ACCOUNTCAL A
                     JOIN PRO_RBL_MISDB_PROD.CUSTOMERCAL B   ON A.RefCustomerID = B.RefCustomerID
             WHERE  A.EffectiveFromTimeKey <= v_TIMEKEY
                      AND A.EffectiveToTimeKey >= v_TIMEKEY
                      AND B.EffectiveFromTimeKey <= v_TIMEKEY
                      AND B.EffectiveToTimeKey >= v_TIMEKEY
                      AND A.FinalAssetClassAlt_Key > 1
                      AND ( A.FlgDeg = 'N' )
                      AND A.WriteOffAmount > 0
                      AND A.NPA_Reason = 'ALWYS_NPA Due To Writeoff Amount'
              ORDER BY A.RefCustomerID;
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, 'Link By W/o AccountId' || ' ' || B.CustomerAcID AS NPA_Reason
         FROM A ,PRO_RBL_MISDB_PROD.ACCOUNTCAL A
                JOIN tt_TEMPTABLE_PERCOLATIONWRI_3 B   ON A.RefCustomerID = B.REFCUSTOMERID 
          WHERE A.FinalAssetClassAlt_Key > 1
           AND A.NPA_Reason <> 'ALWYS_NPA Due To Writeoff Amount'
           AND ( A.FlgDeg = 'N' )) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET NPA_Reason = src.NPA_Reason;
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, NVL(A.NPA_Reason, ' ') || ' Degarde Account due to ALWYS_NPA and balance >=0' AS NPA_Reason
         FROM A ,PRO_RBL_MISDB_PROD.ACCOUNTCAL A
                JOIN PRO_RBL_MISDB_PROD.CUSTOMERCAL B   ON A.CustomerEntityID = B.CustomerEntityID 
          WHERE B.Asset_Norm = 'ALWYS_NPA'
           AND NVL(FinalAssetClassAlt_Key, 1) <> 1
           AND ( B.FlgProcessing = 'N' )
           AND A.NPA_Reason IS NULL) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.NPA_Reason = src.NPA_Reason;
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, NVL(A.NPA_Reason, ' ') || ' Degarde Account due to ALWYS_NPA and balance >=0' AS NPA_Reason
         FROM A ,PRO_RBL_MISDB_PROD.ACCOUNTCAL A
                JOIN PRO_RBL_MISDB_PROD.CUSTOMERCAL B   ON A.UcifEntityID = B.UcifEntityID 
          WHERE B.Asset_Norm = 'ALWYS_NPA'
           AND NVL(FinalAssetClassAlt_Key, 1) <> 1
           AND ( B.FlgProcessing = 'N' )
           AND A.NPA_Reason IS NULL
           AND B.UcifEntityID > 0) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.NPA_Reason = src.NPA_Reason;
         UPDATE PRO_RBL_MISDB_PROD.ACCOUNTCAL
            SET NPA_Reason = 'NPA DUE TO FRAUD MARKING'
          WHERE  DegReason LIKE '%Fraud%';
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, 'PERCOLATION BY UCIC_ID' || B.UCIF_ID AS NPA_Reason
         FROM A ,PRO_RBL_MISDB_PROD.ACCOUNTCAL A
                JOIN PRO_RBL_MISDB_PROD.CUSTOMERCAL B   ON A.UcifEntityID = B.UcifEntityID 
          WHERE NVL(FinalAssetClassAlt_Key, 1) <> 1
           AND ( B.FlgProcessing = 'N' )
           AND A.NPA_Reason IS NULL
           AND B.UcifEntityID > 0) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.NPA_Reason = src.NPA_Reason;
         UPDATE PRO_RBL_MISDB_PROD.AclRunningProcessStatus
            SET COMPLETED = 'Y',
                ERRORDATE = NULL,
                ERRORDESCRIPTION = NULL,
                COUNT = NVL(COUNT, 0) + 1
          WHERE  RUNNINGPROCESSNAME = 'Marking_NPA_Reason_NPAAccount';

      END;
   EXCEPTION
      WHEN OTHERS THEN

   BEGIN
      --------------Added for DashBoard 04-03-2021
      --Update BANDAUDITSTATUS set CompletedCount=CompletedCount+1 where BandName='ASSET CLASSIFICATION'
      UPDATE PRO_RBL_MISDB_PROD.AclRunningProcessStatus
         SET COMPLETED = 'N',
             ERRORDATE = SYSDATE,
             ERRORDESCRIPTION = SQLERRM,
             COUNT = NVL(COUNT, 0) + 1
       WHERE  RUNNINGPROCESSNAME = 'Marking_NPA_Reason_NPAAccount';

   END;END;

EXCEPTION WHEN OTHERS THEN utils.handleerror(SQLCODE,SQLERRM);
END;

/

  GRANT EXECUTE ON "MAIN_PRO"."MARKING_NPA_REASON_NPAACCOUNT_04032022" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT EXECUTE ON "MAIN_PRO"."MARKING_NPA_REASON_NPAACCOUNT_04032022" TO "PREMOC_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."MARKING_NPA_REASON_NPAACCOUNT_04032022" TO "QPI_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."MARKING_NPA_REASON_NPAACCOUNT_04032022" TO "ALERT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."MARKING_NPA_REASON_NPAACCOUNT_04032022" TO "DWH_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."MARKING_NPA_REASON_NPAACCOUNT_04032022" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."MARKING_NPA_REASON_NPAACCOUNT_04032022" TO "CURDAT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."MARKING_NPA_REASON_NPAACCOUNT_04032022" TO "BS_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."MARKING_NPA_REASON_NPAACCOUNT_04032022" TO "ACL_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."MARKING_NPA_REASON_NPAACCOUNT_04032022" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."MARKING_NPA_REASON_NPAACCOUNT_04032022" TO "RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."MARKING_NPA_REASON_NPAACCOUNT_04032022" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."MARKING_NPA_REASON_NPAACCOUNT_04032022" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT DEBUG ON "MAIN_PRO"."MARKING_NPA_REASON_NPAACCOUNT_04032022" TO "PREMOC_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."MARKING_NPA_REASON_NPAACCOUNT_04032022" TO "QPI_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."MARKING_NPA_REASON_NPAACCOUNT_04032022" TO "ALERT_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."MARKING_NPA_REASON_NPAACCOUNT_04032022" TO "DWH_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."MARKING_NPA_REASON_NPAACCOUNT_04032022" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."MARKING_NPA_REASON_NPAACCOUNT_04032022" TO "CURDAT_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."MARKING_NPA_REASON_NPAACCOUNT_04032022" TO "BS_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."MARKING_NPA_REASON_NPAACCOUNT_04032022" TO "ACL_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."MARKING_NPA_REASON_NPAACCOUNT_04032022" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."MARKING_NPA_REASON_NPAACCOUNT_04032022" TO "RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."MARKING_NPA_REASON_NPAACCOUNT_04032022" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."MARKING_NPA_REASON_NPAACCOUNT_04032022" TO "ROLE_ALL_DB";
  GRANT EXECUTE ON "MAIN_PRO"."MARKING_NPA_REASON_NPAACCOUNT_04032022" TO "CC_CDR_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."MARKING_NPA_REASON_NPAACCOUNT_04032022" TO "RBL_BI_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."MARKING_NPA_REASON_NPAACCOUNT_04032022" TO "BSG_READ_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."MARKING_NPA_REASON_NPAACCOUNT_04032022" TO "STD_FIN_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."MARKING_NPA_REASON_NPAACCOUNT_04032022" TO "RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."MARKING_NPA_REASON_NPAACCOUNT_04032022" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT EXECUTE ON "MAIN_PRO"."MARKING_NPA_REASON_NPAACCOUNT_04032022" TO "RBL_TEMPDB";
  GRANT EXECUTE ON "MAIN_PRO"."MARKING_NPA_REASON_NPAACCOUNT_04032022" TO "STG_FIN_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."MARKING_NPA_REASON_NPAACCOUNT_04032022" TO "ADF_CDR_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."MARKING_NPA_REASON_NPAACCOUNT_04032022" TO "ROLE_ALL_DB";
  GRANT DEBUG ON "MAIN_PRO"."MARKING_NPA_REASON_NPAACCOUNT_04032022" TO "CC_CDR_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."MARKING_NPA_REASON_NPAACCOUNT_04032022" TO "RBL_BI_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."MARKING_NPA_REASON_NPAACCOUNT_04032022" TO "BSG_READ_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."MARKING_NPA_REASON_NPAACCOUNT_04032022" TO "STD_FIN_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."MARKING_NPA_REASON_NPAACCOUNT_04032022" TO "RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."MARKING_NPA_REASON_NPAACCOUNT_04032022" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT DEBUG ON "MAIN_PRO"."MARKING_NPA_REASON_NPAACCOUNT_04032022" TO "RBL_TEMPDB";
  GRANT DEBUG ON "MAIN_PRO"."MARKING_NPA_REASON_NPAACCOUNT_04032022" TO "STG_FIN_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."MARKING_NPA_REASON_NPAACCOUNT_04032022" TO "ADF_CDR_RBL_STGDB";
