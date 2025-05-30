--------------------------------------------------------
--  DDL for Procedure MARKING_NPA_REASON_NPAACCOUNT_21082024
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "MAIN_PRO"."MARKING_NPA_REASON_NPAACCOUNT_21082024" /*=========================================
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
         --UPDATE PRO.ACCOUNTCAL SET NPA_REASON=NULL
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
         USING (SELECT A.ROWID row_id, NVL(A.NPA_Reason, ' ') || ' Degrade Account due to ALWYS_NPA and balance >=0' AS NPA_Reason
         FROM A ,tt_ACCOUNTCAL_44 A
                JOIN tt_CUSTOMERCAL_46 B   ON A.CUSTOMERENTITYID = B.CUSTOMERENTITYID 
          WHERE A.ASSET_NORM = 'ALWYS_NPA'
           AND NVL(FinalAssetClassAlt_Key, 1) <> 1
           AND ( B.FLGPROCESSING = 'N' )) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.NPA_Reason = src.NPA_Reason;
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, NVL(A.NPA_Reason, ' ') || ' DEGRADE BY INT NOT SERVICED' AS NPA_Reason
         FROM A ,tt_ACCOUNTCAL_44 A
                JOIN tt_CUSTOMERCAL_46 B   ON A.CustomerEntityID = B.CustomerEntityID 
          WHERE ( B.FlgProcessing = 'N' )
           AND ( NVL(FinalAssetClassAlt_Key, 1) <> 1
           AND ( A.DPD_INTSERVICE > 0 ) )) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.NPA_Reason = src.NPA_Reason;
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, NVL(A.NPA_Reason, ' ') || ', DEGRADE BY CONTI EXCESS' AS NPA_Reason
         FROM A ,tt_ACCOUNTCAL_44 A
                JOIN tt_CUSTOMERCAL_46 B   ON A.CustomerEntityID = B.CustomerEntityID 
          WHERE ( B.FlgProcessing = 'N' )
           AND ( NVL(FinalAssetClassAlt_Key, 1) <> 1
           AND A.DPD_OVERDRAWN > 0 )) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.NPA_Reason = src.NPA_Reason;
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, NVL(A.NPA_Reason, ' ') || ', DEGRADE BY NO CREDIT' AS NPA_Reason
         FROM A ,tt_ACCOUNTCAL_44 A
                JOIN tt_CUSTOMERCAL_46 B   ON A.CustomerEntityID = B.CustomerEntityID 
          WHERE ( B.FlgProcessing = 'N' )
           AND ( NVL(FinalAssetClassAlt_Key, 1) <> 1
           AND A.DPD_NOCREDIT > 0 )) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.NPA_Reason = src.NPA_Reason;
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, NVL(A.NPA_Reason, ' ') || ', DEGRADE BY OVERDUE' AS NPA_Reason
         FROM A ,tt_ACCOUNTCAL_44 A
                JOIN tt_CUSTOMERCAL_46 B   ON A.CustomerEntityID = B.CustomerEntityID 
          WHERE ( B.FlgProcessing = 'N' )
           AND ( NVL(FinalAssetClassAlt_Key, 1) <> 1
           AND A.DPD_OVERDUE > 0 )
           AND NVL(a.DegReason, ' ') NOT LIKE '%NPA Due to overdue – Buyout Portfolio%'
           AND NVL(a.DegReason, ' ') NOT LIKE '%NPA with Seller%') src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.NPA_Reason = src.NPA_Reason;-- Buyout changes
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, NVL(A.NPA_Reason, ' ') || ',NPA Due to overdue – Buyout Portfolio' AS NPA_Reason
         FROM A ,tt_ACCOUNTCAL_44 A
                JOIN tt_CUSTOMERCAL_46 B   ON A.CustomerEntityID = B.CustomerEntityID 
          WHERE ( B.FlgProcessing = 'N' )
           AND ( NVL(FinalAssetClassAlt_Key, 1) <> 1
           AND A.DPD_OVERDUE > 0 )
           AND a.DegReason LIKE '%NPA Due to overdue – Buyout Portfolio%') src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.NPA_Reason = src.NPA_Reason;-- Buyout changes
         ------------------------------COMMENTED BY AMAR SIR
         --------UPDATE A SET A.NPA_Reason= CASE WHEN B.NPA_Flag='NPA_VDPD' THEN ',NPA Due to Virtual DPD'            
         --------															WHEN B.NPA_Flag='NPA_SELLER' THEN ',NPA with Seller'   
         --------													ELSE A.NPA_Reason END
         --------FROM PRO.AccountCal A 
         --------INNER JOIN PRO.BuyoutUploadDetailsCal_Hist B ON A.AccountEntityID=B.AccountEntityID
         --------		AND B.EffectiveFromTimeKey<=@TIMEKEY AND B.EffectiveToTimeKey>=@TIMEKEY
         --------WHERE ( isnull(FinalAssetClassAlt_Key,1)<>1  and InitialAssetClassAlt_Key<>1)  
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, NVL(A.NPA_Reason, ' ') || ', DEGRADE BY DEBIT BALANCE ' AS NPA_Reason
         FROM A ,tt_ACCOUNTCAL_44 A
                JOIN tt_CUSTOMERCAL_46 B   ON A.CustomerEntityID = B.CustomerEntityID
                JOIN DimProduct C   ON A.ProductAlt_Key = C.ProductAlt_Key
                AND ( C.EffectiveFromTimeKey <= v_TimeKey
                AND C.EffectiveToTimeKey >= v_TimeKey ) 
          WHERE ( B.FlgProcessing = 'N' )
           AND ( NVL(FinalAssetClassAlt_Key, 1) <> 1
           AND A.DPD_OVERDUE > 0 )
           AND A.DebitSinceDt IS NOT NULL) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.NPA_Reason = src.NPA_Reason;--AND ISNULL(C.SrcSysProductCode,'N')='SAVING'
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, NVL(A.NPA_Reason, ' ') || ', DEGRADE BY STOCK STATEMENT' AS NPA_Reason
         FROM A ,tt_ACCOUNTCAL_44 A
                JOIN tt_CUSTOMERCAL_46 B   ON A.CustomerEntityID = B.CustomerEntityID 
          WHERE ( B.FlgProcessing = 'N' )
           AND ( NVL(FinalAssetClassAlt_Key, 1) <> 1
           AND A.DPD_STOCKSTMT > 0 )) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.NPA_Reason = src.NPA_Reason;
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, NVL(A.NPA_Reason, ' ') || ', DEGRADE BY REVIEW DUE DATE' AS NPA_Reason
         FROM A ,tt_ACCOUNTCAL_44 A
                JOIN tt_CUSTOMERCAL_46 B   ON A.CustomerEntityID = B.CustomerEntityID 
          WHERE ( B.FlgProcessing = 'N' )
           AND ( NVL(FinalAssetClassAlt_Key, 1) <> 1
           AND A.DPD_RENEWAL > 0 )) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.NPA_Reason = src.NPA_Reason;
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, NVL(A.NPA_REASON, ' ') || 'DEGRADE BY MOC' AS NPA_REASON
         FROM A ,tt_ACCOUNTCAL_44 A
                JOIN PRO_RBL_MISDB_PROD.ChangedMocAclStatus B   ON A.CUSTOMERENTITYID = B.CustomerEntityID
                AND ( B.EffectiveFromTimeKey <= v_TIMEKEY
                AND B.EffectiveToTimeKey >= v_TIMEKEY )
                AND a.Asset_Norm = 'NORMAL' ) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.NPA_REASON = src.NPA_REASON;
         MERGE INTO B 
         USING (SELECT B.ROWID row_id, 'PERCOLATION BY PAN CARD ' || ' ' || A.PANNO AS NPA_Reason
         FROM B ,tt_CUSTOMERCAL_46 A
                JOIN tt_ACCOUNTCAL_44 B   ON A.REFCUSTOMERID = B.REFCUSTOMERID 
          WHERE B.FinalAssetClassAlt_Key > 1
           AND B.NPA_Reason IS NULL
           AND A.DEGREASON LIKE '%PERCOLATION BY PAN CARD%') src
         ON ( B.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET B.NPA_Reason = src.NPA_Reason;
         MERGE INTO B 
         USING (SELECT B.ROWID row_id, 'PERCOLATION BY AADHAR CARD ' || ' ' || A.AADHARCARDNO AS NPA_Reason
         FROM B ,tt_CUSTOMERCAL_46 A
                JOIN tt_ACCOUNTCAL_44 B   ON A.REFCUSTOMERID = B.REFCUSTOMERID 
          WHERE B.FinalAssetClassAlt_Key > 1
           AND B.NPA_Reason IS NULL
           AND A.DEGREASON LIKE '%PERCOLATION BY AADHAR CARD%') src
         ON ( B.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET B.NPA_Reason = src.NPA_Reason;
         IF utils.object_id('TEMPDB..tt_TEMPTABLE_PERCOLATION_6') IS NOT NULL THEN
          EXECUTE IMMEDIATE ' TRUNCATE TABLE tt_TEMPTABLE_PERCOLATION_6 ';
         END IF;
         DELETE FROM tt_TEMPTABLE_PERCOLATION_6;
         UTILS.IDENTITY_RESET('tt_TEMPTABLE_PERCOLATION_6');

         INSERT INTO tt_TEMPTABLE_PERCOLATION_6 SELECT A.REFCUSTOMERID REFCUSTOMERID  ,
                                                       A.CustomerAcID CustomerAcID  ,
                                                       A.NPA_Reason 
              FROM tt_ACCOUNTCAL_44 A
                     JOIN tt_CUSTOMERCAL_46 B   ON A.REFCUSTOMERID = B.REFCUSTOMERID
             WHERE  A.EFFECTIVEFROMTIMEKEY <= v_TIMEKEY
                      AND A.EFFECTIVETOTIMEKEY >= v_TIMEKEY
                      AND B.EFFECTIVEFROMTIMEKEY <= v_TIMEKEY
                      AND B.EFFECTIVETOTIMEKEY >= v_TIMEKEY
                      AND A.NPA_Reason IS NOT NULL
                      AND A.FinalAssetClassAlt_Key > 1
                      AND ( A.FLGDEG = 'N' )
              ORDER BY A.REFCUSTOMERID;
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, 'Link By AccountId' || ' ' || B.CustomerAcID AS NPA_Reason
         FROM A ,tt_ACCOUNTCAL_44 A
                JOIN tt_TEMPTABLE_PERCOLATION_6 B   ON A.REFCUSTOMERID = B.REFCUSTOMERID 
          WHERE A.FinalAssetClassAlt_Key > 1
           AND A.NPA_Reason IS NULL
           AND ( A.FLGDEG = 'N' )) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.NPA_Reason = src.NPA_Reason;
         IF utils.object_id('TEMPDB..tt_TEMPTABLE_PERCOLATION_6FreshSlipage') IS NOT NULL THEN
          EXECUTE IMMEDIATE ' TRUNCATE TABLE tt_TEMPTABLE_PERCOLATIONFre_6 ';
         END IF;
         DELETE FROM tt_TEMPTABLE_PERCOLATIONFre_6;
         UTILS.IDENTITY_RESET('tt_TEMPTABLE_PERCOLATIONFre_6');

         INSERT INTO tt_TEMPTABLE_PERCOLATIONFre_6 SELECT A.REFCUSTOMERID REFCUSTOMERID  ,
                                                          A.CustomerAcID CustomerAcID  ,
                                                          A.NPA_Reason 
              FROM tt_ACCOUNTCAL_44 A
                     JOIN tt_CUSTOMERCAL_46 B   ON A.REFCUSTOMERID = B.REFCUSTOMERID
             WHERE  A.EFFECTIVEFROMTIMEKEY <= v_TIMEKEY
                      AND A.EFFECTIVETOTIMEKEY >= v_TIMEKEY
                      AND B.EFFECTIVEFROMTIMEKEY <= v_TIMEKEY
                      AND B.EFFECTIVETOTIMEKEY >= v_TIMEKEY
                      AND A.NPA_Reason IS NOT NULL
                      AND A.FinalAssetClassAlt_Key > 1
                      AND ( A.FLGDEG = 'Y' )
              ORDER BY A.REFCUSTOMERID;
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, 'Link By AccountId' || ' ' || B.CustomerAcID AS NPA_Reason
         FROM A ,tt_ACCOUNTCAL_44 A
                JOIN tt_TEMPTABLE_PERCOLATIONFre_6 B   ON A.REFCUSTOMERID = B.REFCUSTOMERID
                JOIN DIMPRODUCT P   ON P.EFFECTIVEFROMTIMEKEY <= v_TIMEKEY
                AND P.EFFECTIVETOTIMEKEY >= v_TIMEKEY
                AND ( P.PRODUCTALT_KEY = A.PRODUCTALT_KEY ) 
          WHERE A.FinalAssetClassAlt_Key > 1
           AND ( NVL(A.DPD_Max, 0) < 90
           OR P.Agrischeme = 'Y'
           AND A.DPD_mAX < 366 )
           AND ( A.FLGDEG = 'N' )) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.NPA_Reason = src.NPA_Reason;--A.NPA_Reason IS NULL AND (A.FLGDEG='N')  As per Mail Changes done by Triloki 25/02/2020
         ---WRITE OF REASON UPDATED -----
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, 'ALWYS_NPA Due To Writeoff Amount' AS NPA_Reason
         FROM A ,tt_ACCOUNTCAL_44 A
                JOIN tt_CUSTOMERCAL_46 B   ON A.CUSTOMERENTITYID = B.CUSTOMERENTITYID 
          WHERE A.ASSET_NORM = 'ALWYS_NPA'
           AND NVL(FinalAssetClassAlt_Key, 1) <> 1
           AND ( B.FLGPROCESSING = 'N' )
           AND A.WriteOffAmount > 0) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.NPA_Reason = src.NPA_Reason;
         -----need to uncomment with credit carad changes deployment
         --UPDATE   A SET  A.NPA_Reason='NPA DUE TO CREDIT CARD SETTLEMENT'
         --FROM PRO.ACCOUNTCAL A  
         --WHERE A.ASSET_NORM='ALWYS_NPA' AND isnull(FinalAssetClassAlt_Key,1)<>1 
         --AND a.AccountBlkCode2='K'  -- ADDED BY AMAR ON 03033022
         IF utils.object_id('TEMPDB..tt_TEMPTABLE_PERCOLATION_6WRITEOFF') IS NOT NULL THEN
          EXECUTE IMMEDIATE ' TRUNCATE TABLE tt_TEMPTABLE_PERCOLATIONWRI_6 ';
         END IF;
         DELETE FROM tt_TEMPTABLE_PERCOLATIONWRI_6;
         UTILS.IDENTITY_RESET('tt_TEMPTABLE_PERCOLATIONWRI_6');

         INSERT INTO tt_TEMPTABLE_PERCOLATIONWRI_6 SELECT A.REFCUSTOMERID REFCUSTOMERID  ,
                                                          A.CustomerAcID CustomerAcID  ,
                                                          A.NPA_Reason 
              FROM tt_ACCOUNTCAL_44 A
                     JOIN tt_CUSTOMERCAL_46 B   ON A.REFCUSTOMERID = B.REFCUSTOMERID
             WHERE  A.EFFECTIVEFROMTIMEKEY <= v_TIMEKEY
                      AND A.EFFECTIVETOTIMEKEY >= v_TIMEKEY
                      AND B.EFFECTIVEFROMTIMEKEY <= v_TIMEKEY
                      AND B.EFFECTIVETOTIMEKEY >= v_TIMEKEY
                      AND A.FinalAssetClassAlt_Key > 1
                      AND ( A.FLGDEG = 'N' )
                      AND A.WriteOffAmount > 0
                      AND A.NPA_Reason = 'ALWYS_NPA Due To Writeoff Amount'
              ORDER BY A.REFCUSTOMERID;
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, 'Link By W/o AccountId' || ' ' || B.CustomerAcID AS NPA_Reason
         FROM A ,tt_ACCOUNTCAL_44 A
                JOIN tt_TEMPTABLE_PERCOLATIONWRI_6 B   ON A.REFCUSTOMERID = B.REFCUSTOMERID 
          WHERE A.FinalAssetClassAlt_Key > 1
           AND A.NPA_Reason <> 'ALWYS_NPA Due To Writeoff Amount'
           AND ( A.FLGDEG = 'N' )) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.NPA_Reason = src.NPA_Reason;
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, NVL(A.NPA_Reason, ' ') || ' Degrade Account due to ALWYS_NPA and balance >=0' AS NPA_Reason
         FROM A ,tt_ACCOUNTCAL_44 A
                JOIN tt_CUSTOMERCAL_46 B   ON A.CUSTOMERENTITYID = B.CUSTOMERENTITYID 
          WHERE B.ASSET_NORM = 'ALWYS_NPA'
           AND NVL(FinalAssetClassAlt_Key, 1) <> 1
           AND ( B.FLGPROCESSING = 'N' )
           AND A.NPA_Reason IS NULL) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.NPA_Reason = src.NPA_Reason;
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, NVL(A.NPA_Reason, ' ') || ' Degrade Account due to ALWYS_NPA and balance >=0' AS NPA_Reason
         FROM A ,tt_ACCOUNTCAL_44 A
                JOIN tt_CUSTOMERCAL_46 B   ON A.UcifEntityID = B.UcifEntityID 
          WHERE B.ASSET_NORM = 'ALWYS_NPA'
           AND NVL(FinalAssetClassAlt_Key, 1) <> 1
           AND ( B.FLGPROCESSING = 'N' )
           AND A.NPA_Reason IS NULL
           AND B.UcifEntityID > 0) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.NPA_Reason = src.NPA_Reason;
         UPDATE tt_ACCOUNTCAL_44
            SET NPA_Reason = 'NPA DUE TO FRAUD MARKING'
          WHERE  DegReason LIKE '%Fraud%';
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, 'PERCOLATION BY UCIC_ID' || B.UCIF_ID AS NPA_Reason
         FROM A ,tt_ACCOUNTCAL_44 A
                JOIN tt_CUSTOMERCAL_46 B   ON A.UcifEntityID = B.UcifEntityID 
          WHERE NVL(FinalAssetClassAlt_Key, 1) <> 1
           AND ( B.FLGPROCESSING = 'N' )
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

  GRANT EXECUTE ON "MAIN_PRO"."MARKING_NPA_REASON_NPAACCOUNT_21082024" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT EXECUTE ON "MAIN_PRO"."MARKING_NPA_REASON_NPAACCOUNT_21082024" TO "PREMOC_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."MARKING_NPA_REASON_NPAACCOUNT_21082024" TO "QPI_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."MARKING_NPA_REASON_NPAACCOUNT_21082024" TO "ALERT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."MARKING_NPA_REASON_NPAACCOUNT_21082024" TO "DWH_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."MARKING_NPA_REASON_NPAACCOUNT_21082024" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."MARKING_NPA_REASON_NPAACCOUNT_21082024" TO "CURDAT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."MARKING_NPA_REASON_NPAACCOUNT_21082024" TO "BS_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."MARKING_NPA_REASON_NPAACCOUNT_21082024" TO "ACL_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."MARKING_NPA_REASON_NPAACCOUNT_21082024" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."MARKING_NPA_REASON_NPAACCOUNT_21082024" TO "RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."MARKING_NPA_REASON_NPAACCOUNT_21082024" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."MARKING_NPA_REASON_NPAACCOUNT_21082024" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT DEBUG ON "MAIN_PRO"."MARKING_NPA_REASON_NPAACCOUNT_21082024" TO "PREMOC_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."MARKING_NPA_REASON_NPAACCOUNT_21082024" TO "QPI_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."MARKING_NPA_REASON_NPAACCOUNT_21082024" TO "ALERT_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."MARKING_NPA_REASON_NPAACCOUNT_21082024" TO "DWH_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."MARKING_NPA_REASON_NPAACCOUNT_21082024" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."MARKING_NPA_REASON_NPAACCOUNT_21082024" TO "CURDAT_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."MARKING_NPA_REASON_NPAACCOUNT_21082024" TO "BS_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."MARKING_NPA_REASON_NPAACCOUNT_21082024" TO "ACL_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."MARKING_NPA_REASON_NPAACCOUNT_21082024" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."MARKING_NPA_REASON_NPAACCOUNT_21082024" TO "RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."MARKING_NPA_REASON_NPAACCOUNT_21082024" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."MARKING_NPA_REASON_NPAACCOUNT_21082024" TO "ROLE_ALL_DB";
  GRANT EXECUTE ON "MAIN_PRO"."MARKING_NPA_REASON_NPAACCOUNT_21082024" TO "CC_CDR_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."MARKING_NPA_REASON_NPAACCOUNT_21082024" TO "RBL_BI_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."MARKING_NPA_REASON_NPAACCOUNT_21082024" TO "BSG_READ_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."MARKING_NPA_REASON_NPAACCOUNT_21082024" TO "STD_FIN_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."MARKING_NPA_REASON_NPAACCOUNT_21082024" TO "RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."MARKING_NPA_REASON_NPAACCOUNT_21082024" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT EXECUTE ON "MAIN_PRO"."MARKING_NPA_REASON_NPAACCOUNT_21082024" TO "RBL_TEMPDB";
  GRANT EXECUTE ON "MAIN_PRO"."MARKING_NPA_REASON_NPAACCOUNT_21082024" TO "STG_FIN_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."MARKING_NPA_REASON_NPAACCOUNT_21082024" TO "ADF_CDR_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."MARKING_NPA_REASON_NPAACCOUNT_21082024" TO "ROLE_ALL_DB";
  GRANT DEBUG ON "MAIN_PRO"."MARKING_NPA_REASON_NPAACCOUNT_21082024" TO "CC_CDR_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."MARKING_NPA_REASON_NPAACCOUNT_21082024" TO "RBL_BI_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."MARKING_NPA_REASON_NPAACCOUNT_21082024" TO "BSG_READ_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."MARKING_NPA_REASON_NPAACCOUNT_21082024" TO "STD_FIN_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."MARKING_NPA_REASON_NPAACCOUNT_21082024" TO "RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."MARKING_NPA_REASON_NPAACCOUNT_21082024" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT DEBUG ON "MAIN_PRO"."MARKING_NPA_REASON_NPAACCOUNT_21082024" TO "RBL_TEMPDB";
  GRANT DEBUG ON "MAIN_PRO"."MARKING_NPA_REASON_NPAACCOUNT_21082024" TO "STG_FIN_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."MARKING_NPA_REASON_NPAACCOUNT_21082024" TO "ADF_CDR_RBL_STGDB";
